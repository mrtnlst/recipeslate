//
//  DetailMealHeartCell.swift
//  Recipe Slate
//
//  Created by Martin List on 13.06.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import UIKit

class DetailMealHeartCell: UITableViewCell, DetailCellStyle, Guidable {
    
    static let identifier = "Detail-Meal-Hearts-Cell"
    public var valueLabel = UILabel()
    private var icon = UIImageView()
    private var item: Listable!
    internal var container = UILayoutGuide()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupContainer()
        setupConstraints()
        NotificationCenter.default.addObserver(self, selector: #selector(updateHearts),
                                               name: .RecipeSlateCategoryItemDidChange, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        applyCellStyle()
        
        icon = defaultIcon()
        icon.image = UIImage(systemName: "heart.fill")
        icon.tintColor = HeartsType.raw.heartColor
        contentView.addSubview(icon)
        
        valueLabel = defaultLabel()
        contentView.addSubview(valueLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            icon.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            icon.centerYAnchor.constraint(equalTo: valueLabel.centerYAnchor),
            
            valueLabel.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 5),
            valueLabel.topAnchor.constraint(equalTo: container.topAnchor),
            valueLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor),
        ])
    }
    
    @objc func updateHearts(_ notification: Notification) {
        guard let materials = notification.object as? [Material] else { return }
        configureHeartsLabels(EffectsHandler.calculateHearts(for: (item as? Meal)?.mainIngredients ?? [], and: materials))
    }
    
    func setItem(_ item: Listable) {
        self.item = item
        if let meal = item as? Meal {
            configureHeartsLabels(EffectsHandler.calculateHearts(for: meal.mainIngredients, and: []))
        }
    }
    
    private func configureHeartsLabels(_ hearts: Hearts) {
        let newValueText = hearts.fullRestore == true ? "full" : "\(hearts.numberOfHearts)"
        
        if newValueText != valueLabel.text {
            valueLabel.text = newValueText
            icon.addBounceAnimation()
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: false)
    }
}
