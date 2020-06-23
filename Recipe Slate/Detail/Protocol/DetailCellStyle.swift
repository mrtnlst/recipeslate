//
//  DetailCellStyle.swift
//  Recipe Slate
//
//  Created by Martin List on 23.06.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import UIKit

protocol DetailCellStyle {

    func applyCellStyle()
}

extension DetailCellStyle where Self: UITableViewCell {
    
    func applyCellStyle() {
        backgroundColor = .backgroundBlue
        let selectedView = UIView()
        selectedView.backgroundColor = .backgroundBlue
        selectedBackgroundView = selectedView
    }
    
    func defaultLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.textColor = .secondaryTextColor
        label.textAlignment = .left
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail   
        return label
    }
    
    func defaultIcon() -> UIImageView {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.contentMode = .scaleAspectFit
        icon.heightAnchor.constraint(equalToConstant: 20).isActive = true
        icon.widthAnchor.constraint(equalTo: icon.heightAnchor).isActive = true
        return icon
    }
}
