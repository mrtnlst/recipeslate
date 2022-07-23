//
//  DetailResaleCell.swift
//  Recipe Slate
//
//  Created by Martin List on 18.06.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import UIKit

class DetailResaleCell: UITableViewCell, DetailCellStyle, Guidable {
    
    static let identifier = "Detail-Resale-Cell"
    private var icon = UIImageView()
    public var resaleLabel = UILabel()
    private var item: Listable!
    internal var container = UILayoutGuide()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupContainer()
        setupConstraints()
        NotificationCenter.default.addObserver(self, selector: #selector(updateResaleLabel),
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
        icon.image = UIImage(named: "rupee")
        contentView.addSubview(icon)
        
        resaleLabel = defaultLabel()
        contentView.addSubview(resaleLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            icon.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            icon.centerYAnchor.constraint(equalTo: resaleLabel.centerYAnchor),
            
            resaleLabel.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 5),
            resaleLabel.topAnchor.constraint(equalTo: container.topAnchor),
            resaleLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor),
        ])
    }
    
    @objc func updateResaleLabel(_ notification: Notification) {
        guard let materials = notification.object as? [Material] else { return }
        if let meal = item as? Meal {
            configureResaleLabel(ResaleHandler.resaleValue(for: meal, and: materials))
        }
        if let _ = item as? Elixir {
            configureResaleLabel(ResaleHandler.resaleValue(for: materials))
        }
    }
    
    func setItem(_ item: Listable) {
        self.item = item
        if let meal = item as? Meal {
            configureResaleLabel(ResaleHandler.resaleValue(for: meal, and: []))
        } else if let material = item as? Material {
            configureResaleLabel(material.saleValue ?? 0)
        } else {
            configureResaleLabel(ResaleHandler.resaleValue(for: []))
        }
    }
    
    private func configureResaleLabel(_ value: Int) {
        let newLabelText = "\(value) Rupees"
        guard newLabelText != resaleLabel.text else { return }
        
        icon.alpha = 1.0
        icon.addBounceAnimation()
        resaleLabel.text = newLabelText
        
        switch value {
        case 1...4:
            icon.tintColor = .rupeeGreen
        case 5...19:
            icon.tintColor = .rupeeBlue
        case 20...49:
            icon.tintColor = .rupeeRed
        case 50...99:
            icon.tintColor = .rupeePurple
        case 100...299:
            icon.tintColor = .rupeeSilver
        case 299...:
            icon.tintColor = .rupeeGold
        default:
            icon.tintColor = .rupeeSilver
            icon.alpha = 0.6
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: false)
    }
}
