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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        isFavorite = false
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: false)
    }
}

extension ElementTableViewCell {
    
    func updateEffectIcon(with imageView: UIImageView?) {
        if let imageView = imageView {
            effectIcon.image = imageView.image
            effectIcon.tintColor = imageView.tintColor
        }
    }
}

private extension ElementTableViewCell {
    func setupViews() {
        backgroundColor = .defaultBackground
        let selectedView = UIView()
        selectedView.backgroundColor = .tableViewCellSelectedColor
        selectedBackgroundView = selectedView
        
        effectIcon.translatesAutoresizingMaskIntoConstraints = false
        effectIcon.contentMode = .scaleAspectFit
        contentView.addSubview(effectIcon)
        
        favoriteIcon.translatesAutoresizingMaskIntoConstraints = false
        favoriteIcon.contentMode = .scaleAspectFit
        favoriteIcon.image = UIImage(systemName: "star.fill")
        favoriteIcon.tintColor = .listFavorite
        favoriteIcon.isHidden = !isFavorite
        contentView.addSubview(favoriteIcon)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
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

            effectIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            effectIcon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            favoriteIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            favoriteIcon.trailingAnchor.constraint(equalTo: effectIcon.leadingAnchor, constant: -8)
        ])
    }
}
