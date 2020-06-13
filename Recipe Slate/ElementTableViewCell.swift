//
//  ElementTableViewCell.swift
//  Recipe Slate
//
//  Created by Martin List on 13.06.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import UIKit

class ElementTableViewCell: UITableViewCell {

    var icon = UIImageView()
    var label = UILabel()
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
        
        icon.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(icon)
        
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
            
            icon.heightAnchor.constraint(equalToConstant: 15),
            icon.widthAnchor.constraint(equalToConstant: 20),
            icon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            icon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
        ])
    }
}
