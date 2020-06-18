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
    
    var stackView = UIStackView()
    var effectName = UILabel()
    var effectDuration = UILabel()
    var effectIcon = UIImageView()
    var item: Item!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateEffect),
                                               name: NSNotification.Name(rawValue: "set-effect"), object: nil)
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
        
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackView)
        
        effectName.translatesAutoresizingMaskIntoConstraints = false
        effectName.font = UIFont.preferredFont(forTextStyle: .body)
        effectName.textColor = .secondaryTextColor
        effectName.textAlignment = .left
        effectName.numberOfLines = 1
        effectName.lineBreakMode = .byTruncatingTail
        stackView.addArrangedSubview(effectName)
        
        effectIcon.translatesAutoresizingMaskIntoConstraints = false
        effectIcon.contentMode = .scaleAspectFit
        stackView.addArrangedSubview(effectIcon)
        
        effectDuration.translatesAutoresizingMaskIntoConstraints = false
        effectDuration.font = UIFont.preferredFont(forTextStyle: .body)
        effectDuration.textColor = .secondaryTextColor
        effectDuration.textAlignment = .left
        effectDuration.numberOfLines = 1
        effectDuration.lineBreakMode = .byTruncatingTail
        stackView.addArrangedSubview(effectDuration)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
        ])
    }
    
    // MARK: - Effect
    
    @objc func updateEffect(_ notification: Notification) {
        guard let material = notification.object as? Material else { return }
        configureEffectLabels(EffectsHandler.calculateEffect(for: (item as? Meal)?.mainIngredients ?? [], and: [material]))
    }
    
    func setItem(_ item: Item) {
        self.item = item
        if let meal = item as? Meal {
            configureEffectLabels(EffectsHandler.calculateEffect(for: meal.mainIngredients, and: []))
        }
    }
    
    func configureEffectLabels(_ effect: Effect?) {

        effectIcon.isHidden = effect?.type == EffectType.none
        effectDuration.isHidden = effect?.type == EffectType.none
        effectName.text = effect?.type.rawValue
        
        if effect?.type == EffectType.none { return }
        
        effectIcon.image = UIImage(named: "\(effect?.type.rawValue ?? "")")

        let amountEffects: [EffectType] = [.restoresStamina, .extendsStamina, .temporaryHearts]
        if amountEffects.contains(where: { $0 == effect?.type}) {
            effectDuration.text = "\(effect?.amount ?? 0)"
        } else {
            effectDuration.text = "+\(effect?.duration ?? 0)s"
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: false)
    }
}
