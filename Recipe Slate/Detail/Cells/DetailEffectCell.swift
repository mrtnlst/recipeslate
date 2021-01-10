//
//  DetailEffectCell.swift
//  Recipe Slate
//
//  Created by Martin List on 16.06.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import UIKit

class DetailEffectCell: UITableViewCell, DetailCellStyle, Guidable {
    
    static let identifier = "Detail-Effect-Cell"
    var effectName = UILabel()
    var effectDuration = UILabel()
    var effectIcon = UIImageView()
    var item: Listable!
    var effectNoneConstraint: NSLayoutConstraint!
    var effectAvailableConstraint: NSLayoutConstraint!
    internal var container = UILayoutGuide()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupContainer()
        setupConstraints()
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateEffect),
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
        
        effectIcon = defaultIcon()
        contentView.addSubview(effectIcon)
        
        effectDuration = defaultLabel()
        contentView.addSubview(effectDuration)
        
        effectName = defaultLabel()
        contentView.addSubview(effectName)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            effectIcon.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            effectIcon.centerYAnchor.constraint(equalTo: effectDuration.centerYAnchor),
            
            effectDuration.leadingAnchor.constraint(equalTo: effectIcon.trailingAnchor, constant: 5),
            effectDuration.topAnchor.constraint(equalTo: container.topAnchor),
            effectDuration.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            
            effectName.topAnchor.constraint(equalTo: container.topAnchor),
            effectName.bottomAnchor.constraint(equalTo: container.bottomAnchor),
        ])
        
        // Adds possibility to move effectNameLabel when it displays .none
        effectNoneConstraint = effectName.leadingAnchor.constraint(equalTo: effectIcon.trailingAnchor, constant: 5)
        effectAvailableConstraint = effectName.leadingAnchor.constraint(equalTo: effectDuration.trailingAnchor, constant: 5)
    }
    
    // MARK: - Effect
    
    @objc func updateEffect(_ notification: Notification) {
        guard let materials = notification.object as? [Material] else { return }
        if let meal = item as? Meal {
            configureEffectLabels(EffectsHandler.calculateEffect(for: meal.mainIngredients, and: materials))
        }
        if (item as? Elixir) != nil {
            configureEffectLabels(EffectsHandler.calculateEffect(for: materials))
        }
    }
    
    func setItem(_ item: Listable) {
        self.item = item
        if let meal = item as? Meal {
            configureEffectLabels(EffectsHandler.calculateEffect(for: meal.mainIngredients, and: []))
        }
        if let material = item as? Material {
            configureEffectLabels(material.effect)
        }
        if let elixir = item as? Elixir {
            configureEffectLabels(for: elixir)
        }
    }
    
    func configureEffectLabels(_ effect: Effect?) {
        
        let newEffectName = effect?.type.rawValue
        let newEffectImage = effect?.type.icon
        
        var newEffectDuration: String
        
        let amountEffects: [EffectType] = [.restoresStamina, .extendsStamina, .temporaryHearts]
        if amountEffects.contains(where: { $0 == effect?.type}) {
            newEffectDuration = "\(effect?.amount ?? 0)"
        } else if item.name == "Monster Extract" {
            newEffectDuration = "1:00/10:00/30:00 min"
        }
        else {
            newEffectDuration = (effect?.duration ?? 0).durationToString()
        }
        
        if effectName.text != newEffectName || effectDuration.text != newEffectDuration {
            effectIcon.addBounceAnimation()
            effectIcon.alpha = effect?.type == EffectType.none ? 0.6 : 1.0
            effectDuration.isHidden = effect?.type == EffectType.none
            effectName.text = newEffectName
            effectDuration.text = newEffectDuration
            effectIcon.image = newEffectImage
        }
        
        if effect?.type == EffectType.none {
            NSLayoutConstraint.deactivate([effectAvailableConstraint])
            NSLayoutConstraint.activate([effectNoneConstraint])
        } else {
            NSLayoutConstraint.deactivate([effectNoneConstraint])
            NSLayoutConstraint.activate([effectAvailableConstraint])
        }
    }
    
    func configureEffectLabels(for elixir: Elixir) {
        effectIcon.image = elixir.effect.icon
        effectName.text = elixir.effect.rawValue
        effectDuration.text = " "
        NSLayoutConstraint.deactivate([effectAvailableConstraint])
        NSLayoutConstraint.activate([effectNoneConstraint])
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: false)
    }
}
