//
//  DetailPotencyCell.swift
//  Recipe Slate
//
//  Created by Martin List on 19.06.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import UIKit

class DetailPotencyCell: UITableViewCell, DetailCellStyle, Itemize {
    
    static let identifier = "Detail-Potency-Cell"
    
    internal var container = UILayoutGuide()
    internal var rowContainers = [UILayoutGuide]()
    
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
    func setupConstraints(for label: UILabel, and icons: [UIImageView], last: Bool) {
        let rowContainer = setupRowContainer()
        let iconContainer = UILayoutGuide()
        contentView.addLayoutGuide(iconContainer)

        if last {
            NSLayoutConstraint.activate([
                rowContainer.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            ])
        }
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: rowContainer.leadingAnchor),
            label.topAnchor.constraint(equalTo: rowContainer.topAnchor),
            label.bottomAnchor.constraint(equalTo: rowContainer.bottomAnchor),
            
            iconContainer.leadingAnchor.constraint(equalTo: label.trailingAnchor),
            iconContainer.trailingAnchor.constraint(equalTo: rowContainer.trailingAnchor),
            iconContainer.bottomAnchor.constraint(equalTo: rowContainer.bottomAnchor),
            iconContainer.topAnchor.constraint(equalTo: rowContainer.topAnchor),
        ])
        
        rowContainers.append(rowContainer)
        
        for (index, icon) in icons.enumerated() {
            if index == 0 {
                NSLayoutConstraint.activate([
                    icon.leadingAnchor.constraint(equalTo: iconContainer.leadingAnchor, constant: 5)
                ])
            } else {
                NSLayoutConstraint.activate([
                    icon.leadingAnchor.constraint(equalTo: icons[index - 1].trailingAnchor, constant: 5)
                ])
            }
            
            NSLayoutConstraint.activate([
                icon.heightAnchor.constraint(equalToConstant: 20),
                icon.widthAnchor.constraint(equalTo: icon.heightAnchor),
                icon.centerYAnchor.constraint(equalTo: iconContainer.centerYAnchor),
            ])
        }
    }
    
    func setPotency(_ potencies: [Potency]) {
        
        for (index, potency) in potencies.enumerated() {
            let label = defaultLabel()
            label.text = potency.potencyDescription
            contentView.addSubview(label)
            
            var icons = [UIImageView]()
            for _ in 0..<potency.level {
                let icon = defaultIcon()
                icon.image = potency.potencyIcon
                contentView.addSubview(icon)
                icons.append(icon)
            }
            setupConstraints(for: label, and: icons, last: index == potencies.count - 1)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: false)
    }
}
