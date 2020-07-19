//
//  DetailElixirPickerCell.swift
//  Recipe Slate
//
//  Created by Martin List on 11.07.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import UIKit

class DetailElixirPickerCell: UITableViewCell, DetailCellStyle, Guidable {
    
    static let identifier = "Detail-Elixir-Picker-Cell"
    internal var container = UILayoutGuide()
    var item: Elixir!
    var amountPicker1 = DetailPickerView()
    var amountPicker2 = DetailPickerView()
    var critterPicker = DetailPickerView()
    var monsterPicker = DetailPickerView()
    var critterPickerData: [Material] = []
    var monsterPickerData: [Material] = []

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        applyCellStyle()
        setupContainer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setItem(_ item: Listable) {
        guard let elixir = item as? Elixir else { return }
        self.item = elixir
        critterPickerData = materialData.filter({ $0.effect?.type == elixir.effect })
        critterPickerData.removeAll(where: { !$0.category.contains(.critter) })
        monsterPickerData = materialData.filter({ $0.category.contains(.monsterPart) })
        
        configurePickers()
    }
    
    func select(filter: Material?) {
        guard let filter = filter else { return }
    
        if let index = critterPickerData.firstIndex(of: filter) {
            critterPicker.selectRow(index, inComponent: 0, animated: false)
        } else if let index = monsterPickerData.firstIndex(of: filter) {
            monsterPicker.selectRow(index, inComponent: 0, animated: false)
        }
    }
    
    private func configurePickers() {
        let pickers = [amountPicker1, amountPicker2, critterPicker, monsterPicker]
        
        pickers.forEach({
            $0.dataSource = self
            $0.delegate = self
            contentView.addSubview($0)
        })
        
        let rowContainer1 = UILayoutGuide()
        contentView.addLayoutGuide(rowContainer1)
        let rowContainer2 = UILayoutGuide()
        contentView.addLayoutGuide(rowContainer2)
    
    
        NSLayoutConstraint.activate([
            amountPicker1.topAnchor.constraint(equalTo: rowContainer1.topAnchor),
            critterPicker.topAnchor.constraint(equalTo: rowContainer1.topAnchor),
            amountPicker1.leadingAnchor.constraint(equalTo: rowContainer1.leadingAnchor),
            critterPicker.leadingAnchor.constraint(equalTo: amountPicker1.trailingAnchor, constant: 5),
            critterPicker.trailingAnchor.constraint(equalTo: rowContainer1.trailingAnchor),
            amountPicker1.bottomAnchor.constraint(equalTo: rowContainer1.bottomAnchor),
            critterPicker.bottomAnchor.constraint(equalTo: rowContainer1.bottomAnchor),
            amountPicker1.widthAnchor.constraint(equalTo: rowContainer1.widthAnchor, multiplier: 0.2),
            
            amountPicker2.topAnchor.constraint(equalTo: rowContainer2.topAnchor),
            monsterPicker.topAnchor.constraint(equalTo: rowContainer2.topAnchor),
            amountPicker2.leadingAnchor.constraint(equalTo: rowContainer2.leadingAnchor),
            monsterPicker.leadingAnchor.constraint(equalTo: amountPicker2.trailingAnchor, constant: 5),
            monsterPicker.trailingAnchor.constraint(equalTo: rowContainer2.trailingAnchor),
            amountPicker2.bottomAnchor.constraint(equalTo: rowContainer2.bottomAnchor),
            monsterPicker.bottomAnchor.constraint(equalTo: rowContainer2.bottomAnchor),
            amountPicker2.widthAnchor.constraint(equalTo: rowContainer2.widthAnchor, multiplier: 0.2),
            
            rowContainer1.topAnchor.constraint(equalTo: container.topAnchor),
            rowContainer1.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            rowContainer1.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            rowContainer1.bottomAnchor.constraint(equalTo: container.centerYAnchor),

            rowContainer2.topAnchor.constraint(equalTo: container.centerYAnchor),
            rowContainer2.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            rowContainer2.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            rowContainer2.bottomAnchor.constraint(equalTo: container.bottomAnchor),
        ])
        
        pickers.forEach({
            $0.reloadAllComponents()
        })
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: false)
        notifyElixirSelection()
    }
}

// MARK: - UIPickerViewDataSource

extension DetailElixirPickerCell: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == critterPicker {
            return critterPickerData.count
        } else if pickerView == monsterPicker {
            return monsterPickerData.count
        }
        return 4
    }
}

// MARK: - UIPickerViewDelegate

extension DetailElixirPickerCell: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center

        if pickerView == critterPicker {
            label.text = critterPickerData[row].name
        } else if pickerView == monsterPicker {
            label.text = monsterPickerData[row].name
        } else {
            label.text = "\(row + 1)"
        }
        return label
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard isAmountValid(for: pickerView, selectedRow: row + 1) else { return }
        notifyElixirSelection()
    }
    
    /// Validates whether the sum of both amounts is less or equal than 5.
    private func isAmountValid(for picker: UIPickerView, selectedRow: Int) -> Bool {
        if picker == amountPicker1 {
            let selectedRow2 = amountPicker2.selectedRow(inComponent: 0) + 1
            if selectedRow + selectedRow2 > 5 {
                amountPicker1.selectRow(4 - selectedRow2, inComponent: 0, animated: true)
                return false
            }
        } else if picker == amountPicker2 {
            let selectedRow2 = amountPicker1.selectedRow(inComponent: 0) + 1
            if selectedRow + selectedRow2 > 5 {
                amountPicker2.selectRow(4 - selectedRow2, inComponent: 0, animated: true)
                return false
            }
        }
        return true
    }

    private func notifyElixirSelection() {
        guard !critterPickerData.isEmpty, !monsterPickerData.isEmpty else { return }
        var selectedMaterials: [Material] = []
        let critter = critterPickerData[critterPicker.selectedRow(inComponent: 0)]
        let monsterPart = monsterPickerData[monsterPicker.selectedRow(inComponent: 0)]
        
        for _ in 0 ... amountPicker1.selectedRow(inComponent: 0) {
            selectedMaterials.append(critter)
        }
        for _ in 0 ... amountPicker2.selectedRow(inComponent: 0) {
            selectedMaterials.append(monsterPart)
        }
        NotificationHandler.post(.RecipeSlateCategoryItemDidChange, object: selectedMaterials)
    }
}
