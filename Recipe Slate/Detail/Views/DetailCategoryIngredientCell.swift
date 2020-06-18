//
//  DetailCategoryIngredientCell.swift
//  Recipe Slate
//
//  Created by Martin List on 16.06.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import UIKit

enum CategoryPicker {
    case first
    case second
}

class DetailCategoryIngredientCell: UITableViewCell {
    
    static let identifier = "Detail-Category-Ingredient-Cell"
    private var stackView = UIStackView()
    var picker1 = UIPickerView()
    var picker2 = UIPickerView()
    var picker1Data: [Material] = []
    var picker2Data: [Material] = []
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        backgroundColor = .backgroundBlue
        let selectedView = UIView()
        selectedView.backgroundColor = .tableViewCellSelectedColor
        selectedBackgroundView = selectedView
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 4
        contentView.addSubview(stackView)
    }
    
    func setupConstraints() {
        // Fixes auto layout error in debugger where encapsulated height is slightly higher than 90
        let heightAnchorConstraint = stackView.heightAnchor.constraint(equalToConstant: 90)
        heightAnchorConstraint.priority = .defaultHigh
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            heightAnchorConstraint
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        notifyMaterialSelection()
    }
    
    func configurePicker(_ picker: CategoryPicker, data: [Material] = []) {
        if picker == .first {
            picker1Data = data
            picker1.dataSource = self
            picker1.delegate = self
            
            if !stackView.subviews.contains(picker1) {
                stackView.addArrangedSubview(picker1)
            }
            picker1.reloadAllComponents()
            NotificationHandler.post(.RecipeSlateCategoryItemDidChange, object: picker1Data.first)
        } else {
            picker2Data = data
            picker2.dataSource = self
            picker2.delegate = self
            
            if !stackView.subviews.contains(picker2) {
                stackView.addArrangedSubview(picker2)
            }
            picker2.reloadAllComponents()
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: false)
        notifyMaterialSelection()
    }
}

extension DetailCategoryIngredientCell: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerView == picker1 ? picker1Data.count : picker2Data.count
    }
}

extension DetailCategoryIngredientCell: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        
        if pickerView == picker1 {
            label.text = picker1Data[row].name
        } else {
            label.text = picker2Data[row].name
        }
        
        return label
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        notifyMaterialSelection()
    }
    
    private func notifyMaterialSelection() {
        var selectedMaterials: [Material] = []
        if let item1 = picker1Data.item(at: picker1.selectedRow(inComponent: 0)) {
            selectedMaterials.append(item1)
        }
        if let item2 = picker2Data.item(at: picker2.selectedRow(inComponent: 0)) {
           selectedMaterials.append(item2)
        }
        NotificationHandler.post(.RecipeSlateCategoryItemDidChange, object: selectedMaterials)
    }
}
