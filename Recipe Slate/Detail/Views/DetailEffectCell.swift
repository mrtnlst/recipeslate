//
//  DetailEffectCell.swift
//  Recipe Slate
//
//  Created by Martin List on 16.06.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import UIKit

class DetailEffectCell: UITableViewCell {

    static let identifier = "Detail-Effect-Cell"
    
    var stackView = UIStackView()
    var effectName = UILabel()
    var effectDuration = UILabel()
    var effectIcon = UIImageView()
    
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
        
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackView)
        
        effectName.translatesAutoresizingMaskIntoConstraints = false
        effectName.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        effectName.textColor = .white
        effectName.textAlignment = .left
        effectName.numberOfLines = 1
        effectName.lineBreakMode = .byTruncatingTail
        stackView.addArrangedSubview(effectName)
        
        effectIcon.translatesAutoresizingMaskIntoConstraints = false
        effectIcon.contentMode = .scaleAspectFit
        stackView.addArrangedSubview(effectIcon)
        
        effectDuration.translatesAutoresizingMaskIntoConstraints = false
        effectDuration.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        effectDuration.textColor = .white
        effectDuration.textAlignment = .left
        effectDuration.numberOfLines = 1
        effectDuration.lineBreakMode = .byTruncatingTail
        stackView.addArrangedSubview(effectDuration)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
        ])
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: false)
    }
}
