//
//  DetailHeartCell.swift
//  Recipe Slate
//
//  Created by Martin List on 13.06.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import UIKit

class DetailHeartCell: UITableViewCell {
    
    static let identifier = "Detail-Hearts-Cell"
    public var valueLabel = UILabel()
    private var icon = UIImageView()
    private var stackView = UIStackView()
    private var item: Listable!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
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
        backgroundColor = .backgroundBlue
        let selectedView = UIView()
        selectedView.backgroundColor = .backgroundBlue
        selectedBackgroundView = selectedView
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 3
        contentView.addSubview(stackView)
        
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.image = UIImage(named: "detail-heart-full")
        icon.contentMode = .scaleAspectFit
        stackView.addArrangedSubview(icon)
        
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.font = UIFont.preferredFont(forTextStyle: .body)
        valueLabel.textColor = .secondaryTextColor
        valueLabel.textAlignment = .left
        valueLabel.numberOfLines = 1
        valueLabel.lineBreakMode = .byTruncatingTail
        stackView.addArrangedSubview(valueLabel)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            icon.heightAnchor.constraint(equalToConstant: 20),
            icon.widthAnchor.constraint(equalTo: heightAnchor)
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
