//
//  DetailDishesCell.swift
//  Recipe Slate
//
//  Created by Martin List on 22.06.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import UIKit

class DetailDishesCell: UITableViewCell, DetailCellStyle, Guidable {

    static let identifier = "Detail-Meal-Cell"
    private var icon = UIImageView()
    private var label = UILabel()
    private var item: Listable!
    internal var container = UILayoutGuide()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupContainer()
        setupConstraints()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        applyCellStyle()
        
        let accessoryIcon = UIImageView(image: UIImage(systemName: "chevron.right"))
        accessoryIcon.tintColor = .secondaryTextColor
        accessoryView = accessoryIcon

        icon = defaultIcon()
        icon.tintColor = .white
        contentView.addSubview(icon)
        
        label = defaultLabel()
        contentView.addSubview(label)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            icon.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            icon.centerYAnchor.constraint(equalTo: label.centerYAnchor),
            
            label.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 5),
            label.topAnchor.constraint(equalTo: container.topAnchor),
            label.bottomAnchor.constraint(equalTo: container.bottomAnchor),
        ])
    }
    
    func applyCellStyle() {
        backgroundColor = .defaultBackground
        let selectedView = UIView()
        selectedView.backgroundColor = .tableViewCellSelectedColor
        selectedBackgroundView = selectedView
    }
        
    func setItem(_ item: Listable) {
        self.item = item
        
        guard let material = item as? Material else { return }
        
        if material.isElixirIngredient {
            label.text = "View elixirs with \(item.name)"
            icon.image = UIImage(named: "potion")
        } else {
            icon.image = UIImage(named: "pot")
            label.text = "View meals with \(item.name)"
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: false)
    }
}
