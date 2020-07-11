//
//  DetailElixirPotencyCell.swift
//  Recipe Slate
//
//  Created by Martin List on 11.07.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import UIKit

class DetailElixirPotencyCell: UITableViewCell, DetailCellStyle, Guidable {
    
    static let identifier = "Detail-Elxir-Potency-Cell"
    
    internal var container = UILayoutGuide()
    private var item: Potency?
    private var levelLabel = UILabel()
    private var icon = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        applyCellStyle()
        setupContainer()
        setupViews()
        setupConstraints()
        NotificationCenter.default.addObserver(self, selector: #selector(updatePotency),
                                               name: .RecipeSlateCategoryItemDidChange, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        icon = defaultIcon()
        icon.image = EffectType.none.icon
        contentView.addSubview(icon)
        
        levelLabel = defaultLabel()
        levelLabel.text = "To be calculated"
        contentView.addSubview(levelLabel)
    }
 
    func setupConstraints() {
        NSLayoutConstraint.activate([
            icon.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            icon.centerYAnchor.constraint(equalTo: levelLabel.centerYAnchor),
            
            levelLabel.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 5),
            levelLabel.topAnchor.constraint(equalTo: container.topAnchor),
            levelLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor),
        ])
    }
    
    @objc func updatePotency(_ notification: Notification) {
        guard let materials = notification.object as? [Material] else { return }
        guard let mainMaterial = materials.filter({ $0.effect?.type != .duration }).first else { return }
        setPotency(EffectsHandler.calculatePotency(for: mainMaterial))
    }
    
    func setItem(_ item: Listable) {
        if let material = item as? Material {
            setPotency(EffectsHandler.calculatePotency(for: material))
        }
    }
    
    func setPotency(_ potencies: [Potency]) {
        guard let potency = potencies.last else { return }
        
        levelLabel.text = "Level \(potency.level)"
        icon.image = potency.potencyIcon
        
        if let item = item, item.level != potency.level {
            icon.addBounceAnimation()
        }
        item = potency
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: false)
    }
}
