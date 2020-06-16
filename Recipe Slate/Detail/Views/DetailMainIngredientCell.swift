//
//  DetailMainIngredientCell.swift
//  Recipe Slate
//
//  Created by Martin List on 16.06.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import UIKit

class DetailMainIngredientCell: UITableViewCell {
    
    static let identifier = "Detail-Main-Ingredient-Cell"
    public var stackView = UIStackView()
    
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
        selectedView.backgroundColor = .tableViewCellSelectedColor
        selectedBackgroundView = selectedView
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .leading
        stackView.axis = .vertical
        stackView.spacing = 4
        contentView.addSubview(stackView)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
    }
    
    func setIngredients(_ ingredients: [String]) {
        for ingredient in ingredients {
            let label = UILabel()
            label.text = ingredient
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
            label.textColor = .white
            label.textAlignment = .left
            label.numberOfLines = 1
            label.lineBreakMode = .byTruncatingTail
            stackView.addArrangedSubview(label)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: false)
    }
}
