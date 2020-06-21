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
    private var container = UILayoutGuide()
    var picker1 = DetailPickerView()
    var picker2 = DetailPickerView()
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
        selectedView.backgroundColor = .backgroundBlue
        selectedBackgroundView = selectedView
    }
    
    func setupConstraints() {
        let margins = contentView.layoutMarginsGuide
        contentView.addLayoutGuide(container)
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: margins.topAnchor),
            container.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            container.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
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
            contentView.addSubview(picker1)
            
            NSLayoutConstraint.activate([
                picker1.topAnchor.constraint(equalTo: container.topAnchor),
                picker1.bottomAnchor.constraint(equalTo: container.bottomAnchor),
                picker1.leadingAnchor.constraint(equalTo: container.leadingAnchor),
                picker1.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            ])
            picker1.reloadAllComponents()
        } else {
            picker2Data = data
            picker2.dataSource = self
            picker2.delegate = self
            contentView.addSubview(picker2)
            
            NSLayoutConstraint.activate([
                picker1.trailingAnchor.constraint(equalTo: container.centerXAnchor),
                
                picker2.topAnchor.constraint(equalTo: container.topAnchor),
                picker2.bottomAnchor.constraint(equalTo: container.bottomAnchor),
                picker2.leadingAnchor.constraint(equalTo: container.centerXAnchor),
                picker2.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            ])
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
