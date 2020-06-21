//
//  DetailLocationCell.swift
//  Recipe Slate
//
//  Created by Martin List on 19.06.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import UIKit

class DetailLocationCell: UITableViewCell {
    
    static let identifier = "Detail-Location-Cell"
    private var icon = UIImageView()
    public var locationLabel = UILabel()
    
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
        
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.image = UIImage(named: "detail-map")
        icon.tintColor = .cream
        icon.contentMode = .scaleAspectFit
        contentView.addSubview(icon)
        
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.font = UIFont.preferredFont(forTextStyle: .body)
        locationLabel.textColor = .secondaryTextColor
        locationLabel.textAlignment = .left
        locationLabel.numberOfLines = 1
        locationLabel.lineBreakMode = .byTruncatingTail
        contentView.addSubview(locationLabel)
    }
    
    func setupConstraints() {
        let margins = contentView.layoutMarginsGuide
        let container = UILayoutGuide()
        contentView.addLayoutGuide(container)
        
        NSLayoutConstraint.activate([
            icon.heightAnchor.constraint(equalToConstant: 20),
            icon.widthAnchor.constraint(equalTo: icon.heightAnchor),
            icon.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            icon.centerYAnchor.constraint(equalTo: locationLabel.centerYAnchor),
            
            locationLabel.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 5),
            locationLabel.topAnchor.constraint(equalTo: container.topAnchor),
            locationLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            
            container.topAnchor.constraint(equalTo: margins.topAnchor),
            container.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            container.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
        ])
    }
    
    func setItem(_ item: Listable) {
        if let material = item as? Material {
            locationLabel.text = material.location
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: false)
    }
}
