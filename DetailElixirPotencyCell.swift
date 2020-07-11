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
    private var item: Elixir?
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
        setPotency(EffectsHandler.calculatePotencyLevel(for: materials))
    }
    
    func setItem(_ item: Listable) {
        self.item = item as? Elixir
    }
    
    func setPotency(_ level: Int) {
        let text = "Level \(level)"
        icon.image = item?.effect.icon
        
        if text != levelLabel.text {
            levelLabel.text = "Level \(level)"
            icon.addBounceAnimation()
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: false)
    }
}
