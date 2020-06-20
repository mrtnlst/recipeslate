//
//  DetailResaleCell.swift
//  Recipe Slate
//
//  Created by Martin List on 18.06.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import UIKit

class DetailResaleCell: UITableViewCell {
    
    static let identifier = "Detail-Resale-Cell"
    private var icon = UIImageView()
    public var resaleLabel = UILabel()
    private var stackView = UIStackView()
    private var item: Listable!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
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
        backgroundColor = .backgroundBlue
        let selectedView = UIView()
        selectedView.backgroundColor = .backgroundBlue
        selectedBackgroundView = selectedView
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        contentView.addSubview(stackView)
        
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.image = UIImage(named: "detail-rupee")
        icon.contentMode = .scaleAspectFit
        stackView.addArrangedSubview(icon)
        
        resaleLabel.translatesAutoresizingMaskIntoConstraints = false
        resaleLabel.font = UIFont.preferredFont(forTextStyle: .body)
        resaleLabel.textColor = .secondaryTextColor
        resaleLabel.textAlignment = .left
        resaleLabel.numberOfLines = 1
        resaleLabel.lineBreakMode = .byTruncatingTail
        stackView.addArrangedSubview(resaleLabel)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            icon.heightAnchor.constraint(equalToConstant: 20),
            icon.widthAnchor.constraint(equalTo: heightAnchor)
        ])
    }
    
    @objc func updateResaleLabel(_ notification: Notification) {
        guard let materials = notification.object as? [Material] else { return }
        if let meal = item as? Meal {
            configureResaleLabel(ResaleHandler.resaleValue(for: meal, and: materials))
        }
    }
    
    func setItem(_ item: Listable) {
        self.item = item
        if let meal = item as? Meal {
            configureResaleLabel(ResaleHandler.resaleValue(for: meal, and: []))
        }
        if let material = item as? Material {
            configureResaleLabel(material.saleValue ?? 0)
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
