//
//  DetailDishesCell.swift
//  Recipe Slate
//
//  Created by Martin List on 22.06.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import UIKit

class DetailDishesCell: UITableViewCell {

    static let identifier = "Detail-Meal-Cell"
    private var icon = UIImageView()
    public var label = UILabel()
    private var item: Listable!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        backgroundColor = .backgroundBlue
        let selectedView = UIView()
        selectedView.backgroundColor = .tableViewCellSelectedColor
        selectedBackgroundView = selectedView
        
        if #available(iOS 13.0, *) {
            let accessoryIcon = UIImageView(image: UIImage(systemName: "chevron.right"))
            accessoryIcon.tintColor = .secondaryTextColor
            accessoryView = accessoryIcon
        }

        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.tintColor = .gray
        icon.contentMode = .scaleAspectFit
        contentView.addSubview(icon)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.textColor = .secondaryTextColor
        label.textAlignment = .left
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        contentView.addSubview(label)
    }
    
    func setupConstraints() {
        let margins = contentView.layoutMarginsGuide
        let container = UILayoutGuide()
        contentView.addLayoutGuide(container)
        
        NSLayoutConstraint.activate([
            icon.heightAnchor.constraint(equalToConstant: 20),
            icon.widthAnchor.constraint(equalTo: icon.heightAnchor),
            icon.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            icon.centerYAnchor.constraint(equalTo: label.centerYAnchor),
            
            label.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 5),
            label.topAnchor.constraint(equalTo: container.topAnchor),
            label.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            
            container.topAnchor.constraint(equalTo: margins.topAnchor),
            container.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            container.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
        ])
    }
        
    func setItem(_ item: Listable) {
        self.item = item
        
        guard let material = item as? Material else { return }
        
        if material.isElixirIngredient {
            label.text = "View elixirs with \(item.name)"
            icon.image = UIImage(named: "detail-elixir")
        } else {
            icon.image = UIImage(named: "detail-meal")
            label.text = "View meals with \(item.name)"
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: false)
    }
}
