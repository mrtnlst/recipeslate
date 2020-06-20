//
//  DetailEffectCell.swift
//  Recipe Slate
//
//  Created by Martin List on 16.06.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import UIKit

class DetailEffectCell: UITableViewCell {
    
    static let identifier = "Detail-Effect-Cell"
    
    var effectName = UILabel()
    var effectDuration = UILabel()
    var effectIcon = UIImageView()
    var item: Listable!
    var effectNoneConstraint: NSLayoutConstraint!
    var effectAvailableConstraint: NSLayoutConstraint!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
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
        backgroundColor = .backgroundBlue
        let selectedView = UIView()
        selectedView.backgroundColor = .backgroundBlue
        selectedBackgroundView = selectedView
        
        effectIcon.translatesAutoresizingMaskIntoConstraints = false
        effectIcon.contentMode = .scaleAspectFit
        contentView.addSubview(effectIcon)
        
        effectDuration.translatesAutoresizingMaskIntoConstraints = false
        effectDuration.font = UIFont.preferredFont(forTextStyle: .body)
        effectDuration.textColor = .secondaryTextColor
        effectDuration.textAlignment = .left
        effectDuration.numberOfLines = 1
        effectDuration.lineBreakMode = .byTruncatingTail
        contentView.addSubview(effectDuration)
        
        effectName.translatesAutoresizingMaskIntoConstraints = false
        effectName.font = UIFont.preferredFont(forTextStyle: .body)
        effectName.textColor = .secondaryTextColor
        effectName.textAlignment = .left
        effectName.numberOfLines = 1
        effectName.lineBreakMode = .byTruncatingTail
        contentView.addSubview(effectName)
    }
    
    func setupConstraints() {
        let margins = contentView.layoutMarginsGuide
        let container = UILayoutGuide()
        contentView.addLayoutGuide(container)
        
        NSLayoutConstraint.activate([
            effectIcon.heightAnchor.constraint(equalToConstant: 20),
            effectIcon.widthAnchor.constraint(equalTo: effectIcon.heightAnchor),
            effectIcon.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            effectIcon.centerYAnchor.constraint(equalTo: effectDuration.centerYAnchor),
            
            effectDuration.leadingAnchor.constraint(equalTo: effectIcon.trailingAnchor, constant: 5),
            effectDuration.topAnchor.constraint(equalTo: container.topAnchor),
            effectDuration.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            
            effectName.topAnchor.constraint(equalTo: container.topAnchor),
            effectName.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            
            container.topAnchor.constraint(equalTo: margins.topAnchor),
            container.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            container.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
        ])
        
        // Adds possibility to move effectNameLabel when it displays .none
        effectNoneConstraint = effectName.leadingAnchor.constraint(equalTo: effectIcon.trailingAnchor, constant: 5)
        effectAvailableConstraint = effectName.leadingAnchor.constraint(equalTo: effectDuration.trailingAnchor, constant: 5)
    }
    
    // MARK: - Effect
    
    @objc func updateEffect(_ notification: Notification) {
        guard let materials = notification.object as? [Material] else { return }
        configureEffectLabels(EffectsHandler.calculateEffect(for: (item as? Meal)?.mainIngredients ?? [], and: materials))
    }
    
    func setItem(_ item: Listable) {
        self.item = item
        if let meal = item as? Meal {
            configureEffectLabels(EffectsHandler.calculateEffect(for: meal.mainIngredients, and: []))
        }
        if let material = item as? Material {
            configureEffectLabels(material.effect)
        }
    }
    
    func configureEffectLabels(_ effect: Effect?) {
        
        let newEffectName = effect?.type.rawValue
        let newEffectImage = UIImage(named: "\(effect?.type.rawValue ?? "Effect")")
        
        var newEffectDuration: String
        
        let amountEffects: [EffectType] = [.restoresStamina, .extendsStamina, .temporaryHearts]
        if amountEffects.contains(where: { $0 == effect?.type}) {
            newEffectDuration = "\(effect?.amount ?? 0)"
        } else {
            newEffectDuration = "+\(effect?.duration ?? 0)s"
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
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: false)
    }
}
