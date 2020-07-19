//
//  DetailTitleCell.swift
//  Recipe Slate
//
//  Created by Martin List on 13.06.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import UIKit

class DetailTitleCell: UITableViewCell {

    static let identifier = "Detail-Title-Cell"
    public var title = UILabel()
    private var stackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        backgroundColor = .defaultBackground
        let selectedView = UIView()
        selectedView.backgroundColor = .defaultBackground
        selectedBackgroundView = selectedView
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        contentView.addSubview(stackView)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.preferredFont(forTextStyle: .body)
        title.textColor = .secondaryTextColor
        title.textAlignment = .left
        title.numberOfLines = 0
        title.lineBreakMode = .byWordWrapping
        stackView.addArrangedSubview(title)
    }
    
    func setupConstraints() {
        let margins = contentView.layoutMarginsGuide
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: margins.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            stackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
        ])
    }
    
    func setItem(item: Listable) {
        if let elixir = item as? Elixir {
            title.text = elixir.effectDescription
        } else {
            title.text = item.name
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: false)
    }
}
