//
//  DetailPotencyCell.swift
//  Recipe Slate
//
//  Created by Martin List on 19.06.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import UIKit

class DetailPotencyCell: UITableViewCell {
    
    static let identifier = "Detail-Potency-Cell"
    
    var container = UILayoutGuide()
    var rowContainers = [UILayoutGuide]()
    
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
    
    /// Creates row of label and icons based on UILayoutGuide containers.
    /// - Parameters:
    ///   - label: label that begins the row
    ///   - icons: array of UIImageViews
    ///   - last: indicates whether row is the last
    func setupConstraints(for label: UILabel, and icons: [UIImageView], last: Bool) {
        let rowContainer = UILayoutGuide()
        let iconContainer = UILayoutGuide()
        contentView.addLayoutGuide(iconContainer)
        contentView.addLayoutGuide(rowContainer)
        
        if let formerContainer = rowContainers.last {
            NSLayoutConstraint.activate([
                rowContainer.topAnchor.constraint(equalTo: formerContainer.bottomAnchor),
            ])
        } else {
            NSLayoutConstraint.activate([
                rowContainer.topAnchor.constraint(equalTo: container.topAnchor),
            ])
        }
        
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
            
            rowContainer.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            rowContainer.trailingAnchor.constraint(equalTo: container.trailingAnchor),
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
            let label = UILabel()
            label.text = potency.potencyDescription
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.preferredFont(forTextStyle: .body)
            label.textColor = .secondaryTextColor
            label.textAlignment = .left
            label.numberOfLines = 1
            label.lineBreakMode = .byTruncatingTail
            contentView.addSubview(label)
            
            var icons = [UIImageView]()
            for _ in 0..<potency.level {
                let icon = UIImageView(image: potency.potencyIcon)
                icon.translatesAutoresizingMaskIntoConstraints = false
                icon.contentMode = .scaleAspectFit
                icon.heightAnchor.constraint(equalToConstant: 20).isActive = true
                icon.widthAnchor.constraint(equalTo: icon.heightAnchor).isActive = true
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
