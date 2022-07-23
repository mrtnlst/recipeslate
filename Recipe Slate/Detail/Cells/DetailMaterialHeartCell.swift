//
//  DetailMaterialHeartCell.swift
//  Recipe Slate
//
//  Created by Martin List on 01.07.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import UIKit

class DetailMaterialHeartCell: UITableViewCell, DetailCellStyle, Guidable, Itemize {
    
    static let identifier = "Detail-Material-Heart-Cell"
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
    ///   - amount: amount label that begins the row
    ///   - icon: UIImageView of heart
    ///   - last: indicates whether row is the last
    ///   - hasEffect:indicated whether an effect icon is shown
    func setupConstraints(for amount: UILabel, and icon: UIImageView, last: Bool, hasEffect: Bool) {
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
            icon.centerYAnchor.constraint(equalTo: amount.centerYAnchor),
            
            amount.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 5),
            amount.topAnchor.constraint(equalTo: rowContainer.topAnchor),
            amount.bottomAnchor.constraint(equalTo: rowContainer.bottomAnchor),
        ])
        
        if hasEffect {
            let frozenIcon = defaultIcon()
            frozenIcon.image = EffectType.heat.icon
            frozenIcon.tintColor = EffectType.heat.iconColor
            contentView.addSubview(frozenIcon)
            
            NSLayoutConstraint.activate([
                frozenIcon.leadingAnchor.constraint(equalTo: amount.trailingAnchor, constant: 5),
                frozenIcon.widthAnchor.constraint(equalTo: icon.heightAnchor),
                frozenIcon.centerYAnchor.constraint(equalTo: amount.centerYAnchor),
            ])
        }
    }
    
    func setItem(_ item: Listable) {
        if let material = item as? Material {
            let hearts = material.heartCategories
            
            for (index, heart) in hearts.enumerated() {
                let amountLabel = defaultLabel()
                amountLabel.text = heart.heartsText + " " + heart.type.rawValue + " " + (heart.heatEffectText ?? "")
                contentView.addSubview(amountLabel)
                
                let icon = defaultIcon()
                icon.image = UIImage(systemName: "heart.fill")
                icon.tintColor = heart.type.heartColor
                contentView.addSubview(icon)
                
                setupConstraints(for: amountLabel, and: icon, last: index == hearts.count - 1, hasEffect: heart.heatEffectText != nil)
            }
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: false)
    }
}
