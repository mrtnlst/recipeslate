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
    var item: Listable!
    var amountPicker1 = DetailPickerView()
    var amountPicker2 = DetailPickerView()
    var critterPicker = DetailPickerView()
    var monsterPicker = DetailPickerView()
    var critterPickerData: [Critter] = []
    var monsterPickerData: [MonsterPart] = monsterPartData

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        applyCellStyle()
        setupContainer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setItem(_ item: Listable) {
        self.item = item
        guard let elixir = item as? Elixir else { return }
    
        critterPickerData = critterData.filter({ $0.category == elixir.category })
        configurePickers()
    }
    
    func configurePickers() {
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
//        notifyMaterialSelection()
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
        return 5
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

//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        notifyElixirSelection()
//    }
//
//    private func notifySelection() {
//        var selectedMaterials: [Elixir] = []
//        if let item1 = picker1Data.item(at: picker1.selectedRow(inComponent: 0)) {
//            selectedMaterials.append(item1)
//        }
//        if let item2 = picker2Data.item(at: picker2.selectedRow(inComponent: 0)) {
//           selectedMaterials.append(item2)
//        }
//        NotificationHandler.post(.RecipeSlateCategoryItemDidChange, object: selectedMaterials)
//    }
}
