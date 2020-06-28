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

class DetailCategoryIngredientCell: UITableViewCell, DetailCellStyle, Guidable {
    
    static let identifier = "Detail-Category-Ingredient-Cell"
    internal var container = UILayoutGuide()
    var item: Listable!
    var picker1 = DetailPickerView()
    var picker2 = DetailPickerView()
    var picker1Data: [Material] = []
    var picker2Data: [Material] = []
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        applyCellStyle()
        setupContainer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        notifyMaterialSelection()
    }
    
    func setItem(item: Listable) {
        self.item = item
        if let meal = item as? Meal {
            picker1Data = materialData.filter({ $0.category.contains(where: { meal.categoryIngredients.first == $0 }) })
            
            if meal.categoryIngredients.count > 1 {
                picker2Data = materialData.filter({ $0.category.contains(where: { meal.categoryIngredients.last == $0 }) })
                configurePicker(picker1)
                configurePicker(picker2)
            } else {
                configurePicker(picker1, single: true)
            }
        }
    }
    
    func configurePicker(_ picker: UIPickerView, single: Bool? = false) {
        picker.dataSource = self
        picker.delegate = self
        contentView.addSubview(picker)
        
        var constraints = [NSLayoutConstraint]()
        
        if single ?? false {
            constraints.append(picker.trailingAnchor.constraint(equalTo: container.trailingAnchor))
        }
        constraints.append(picker.topAnchor.constraint(equalTo: container.topAnchor))
        constraints.append(picker.bottomAnchor.constraint(equalTo: container.bottomAnchor))
        
        if picker == picker1 {
            constraints.append(picker.leadingAnchor.constraint(equalTo: container.leadingAnchor))
            constraints.append(picker.centerYAnchor.constraint(equalTo: container.centerYAnchor))
        } else {
                constraints.append(picker1.trailingAnchor.constraint(equalTo: container.centerXAnchor))
                constraints.append(picker.leadingAnchor.constraint(equalTo: container.centerXAnchor))
                constraints.append(picker.trailingAnchor.constraint(equalTo: container.trailingAnchor))
        }
        NSLayoutConstraint.activate(constraints)
        
        picker.reloadAllComponents()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: false)
        notifyMaterialSelection()
    }
}

// MARK: - UIPickerViewDataSource

extension DetailCategoryIngredientCell: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerView == picker1 ? picker1Data.count : picker2Data.count
    }
}

// MARK: - UIPickerViewDelegate

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
