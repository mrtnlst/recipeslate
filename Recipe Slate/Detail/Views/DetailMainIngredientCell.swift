//
//  DetailMainIngredientCell.swift
//  Recipe Slate
//
//  Created by Martin List on 16.06.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import UIKit

class DetailMainIngredientCell: UITableViewCell, DetailCellStyle, Itemize {
    
    static let identifier = "Detail-Main-Ingredient-Cell"
    var container = UILayoutGuide()
    var rowContainers = [UILayoutGuide]()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        applyCellStyle()
        setupContainer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Creates row of label and icons based on UILayoutGuide containers.
    /// - Parameters:
    ///   - label: label that begins the row
    ///   - icons: array of UIImageViews
    ///   - last: indicates whether row is the last
    func setupConstraints(for label: UILabel, and icon: UIImageView, last: Bool) {
        let rowContainer = setupRowContainer()
        rowContainers.append(rowContainer)
        
        if last {
            NSLayoutConstraint.activate([
                rowContainer.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            ])
        }
        
        NSLayoutConstraint.activate([
            icon.leadingAnchor.constraint(equalTo: rowContainer.leadingAnchor),
            icon.widthAnchor.constraint(equalTo: icon.heightAnchor),
            icon.centerYAnchor.constraint(equalTo: label.centerYAnchor),
            
            label.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 5),
            label.topAnchor.constraint(equalTo: rowContainer.topAnchor),
            label.bottomAnchor.constraint(equalTo: rowContainer.bottomAnchor),
        ])
    }
    
    func setIngredients(_ ingredients: [String]) {
        for (index, ingredient) in ingredients.enumerated() {
            let label = defaultLabel()
            label.text = ingredient
            contentView.addSubview(label)
            
            let icon = defaultIcon()
            icon.image = EffectsHandler.obtainImage(for: ingredient)
            icon.tintColor = .secondaryTextColor
            contentView.addSubview(icon)
            
            setupConstraints(for: label, and: icon, last: index == ingredients.count - 1)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: false)
    }
}
