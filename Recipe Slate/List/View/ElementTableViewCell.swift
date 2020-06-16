//
//  ElementTableViewCell.swift
//  Recipe Slate
//
//  Created by Martin List on 13.06.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import UIKit

class ElementTableViewCell: UITableViewCell {

    var effectIcon = UIImageView()
    var favoriteIcon = UIImageView()
    var iconContainer = UIView()
    var label = UILabel()
    var isFavorite: Bool = false {
        didSet {
            favoriteIcon.isHidden = !isFavorite
        }
    }
    static let identifier = "Element-Cell"
    
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
        
        iconContainer.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(iconContainer)
        
        effectIcon.translatesAutoresizingMaskIntoConstraints = false
        effectIcon.contentMode = .scaleAspectFit
        iconContainer.addSubview(effectIcon)
        
        favoriteIcon.translatesAutoresizingMaskIntoConstraints = false
        favoriteIcon.contentMode = .scaleAspectFit
        favoriteIcon.image = UIImage(named: "detail-favorite")
        favoriteIcon.isHidden = !isFavorite
        addSubview(favoriteIcon)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        contentView.addSubview(label)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            iconContainer.heightAnchor.constraint(equalToConstant: 20),
            iconContainer.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            effectIcon.topAnchor.constraint(equalTo: iconContainer.topAnchor),
            effectIcon.bottomAnchor.constraint(equalTo: iconContainer.bottomAnchor),
            effectIcon.centerXAnchor.constraint(equalTo: iconContainer.centerXAnchor),
            
            favoriteIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            favoriteIcon.heightAnchor.constraint(equalToConstant: 20),
            favoriteIcon.trailingAnchor.constraint(equalTo: iconContainer.leadingAnchor, constant: -10)
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        isFavorite = false
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: false)
    }
}
