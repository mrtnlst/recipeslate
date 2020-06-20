//
//  DetailPotencyCell.swift
//  Recipe Slate
//
//  Created by Martin List on 19.06.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import UIKit

class DetailPotencyCell: UITableViewCell {
    
    static let identifier = "Detail-Potency-Cell"
    public var verticalStackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        backgroundColor = .backgroundBlue
        let selectedView = UIView()
        selectedView.backgroundColor = .backgroundBlue
        selectedBackgroundView = selectedView
        
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.alignment = .leading
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 4
        contentView.addSubview(verticalStackView)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            verticalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            verticalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            verticalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
    }
    
    func setPotency(_ potencies: [Potency]) {
        for potency in potencies {
            let horizontalStackView = UIStackView()
            horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
            horizontalStackView.axis = .horizontal
            horizontalStackView.alignment = .leading
            horizontalStackView.spacing = 5
            verticalStackView.addArrangedSubview(horizontalStackView)
            
            let label = UILabel()
            label.text = potency.potencyDescription
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.preferredFont(forTextStyle: .body)
            label.textColor = .secondaryTextColor
            label.textAlignment = .left
            label.numberOfLines = 1
            label.lineBreakMode = .byTruncatingTail
            horizontalStackView.addArrangedSubview(label)
            
            for _ in 0..<potency.level {
                let icon = UIImageView(image: potency.potencyIcon)
                icon.translatesAutoresizingMaskIntoConstraints = false
                icon.contentMode = .scaleAspectFit
                icon.heightAnchor.constraint(equalToConstant: 20).isActive = true
                icon.widthAnchor.constraint(equalTo: icon.heightAnchor).isActive = true
                horizontalStackView.addArrangedSubview(icon)
            }
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: false)
    }
}
