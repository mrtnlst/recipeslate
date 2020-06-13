//
//  DetailHeartsCell.swift
//  Recipe Slate
//
//  Created by Martin List on 13.06.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import UIKit

class DetailHeartsCell: UITableViewCell {

    static let identifier = "Detail-Hearts-Cell"
    public var valueLabel = UILabel()
    private var icon = UIImageView()
    
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
        icon.image = UIImage(named: "detail-heart-full")
        icon.contentMode = .scaleAspectFit
        contentView.addSubview(icon)
        
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        valueLabel.textColor = .white
        valueLabel.textAlignment = .left
        valueLabel.numberOfLines = 1
        valueLabel.lineBreakMode = .byTruncatingTail
        contentView.addSubview(valueLabel)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            valueLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            valueLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            valueLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            valueLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            valueLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            icon.heightAnchor.constraint(equalToConstant: 25),
            icon.widthAnchor.constraint(equalToConstant: 25),
            icon.centerYAnchor.constraint(equalTo: valueLabel.centerYAnchor),
            icon.leadingAnchor.constraint(equalTo: valueLabel.trailingAnchor, constant: 0),
        ])
    }
    
    func setHearts(_ hearts: Hearts) {
        valueLabel.text = hearts.fullRestore == true ? "full" : "\(hearts.numberOfHearts)"
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: false)
    }
}
