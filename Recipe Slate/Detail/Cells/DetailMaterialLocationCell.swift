//
//  DetailMaterialLocationCell.swift
//  Recipe Slate
//
//  Created by Martin List on 19.06.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import UIKit

class DetailMaterialLocationCell: UITableViewCell, DetailCellStyle, Guidable {
    
    static let identifier = "Detail-Material-Location-Cell"
    private var icon = UIImageView()
    public var locationLabel = UILabel()
    internal var container = UILayoutGuide()
     
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupContainer()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        applyCellStyle()
        
        icon = defaultIcon()
        icon.image = UIImage(named: "detail-map")
        icon.tintColor = .cream
        contentView.addSubview(icon)
        
        locationLabel = defaultLabel()
        locationLabel.numberOfLines = 3
        contentView.addSubview(locationLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            icon.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            icon.centerYAnchor.constraint(equalTo: locationLabel.centerYAnchor),
            
            locationLabel.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 5),
            locationLabel.topAnchor.constraint(equalTo: container.topAnchor),
            locationLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor),
        ])
    }
    
    func setItem(_ item: Listable) {
        if let material = item as? Material {
            locationLabel.text = material.location
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: false)
    }
}
