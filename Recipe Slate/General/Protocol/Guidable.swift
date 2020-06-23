//
//  Guidable.swift
//  Recipe Slate
//
//  Created by Martin List on 23.06.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import UIKit

protocol Guidable {
    
    var container: UILayoutGuide { get set }
}

extension Guidable where Self: UITableViewCell {
    
    func setupContainer() {
        let margins = contentView.layoutMarginsGuide
        contentView.addLayoutGuide(container)
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: margins.topAnchor),
            container.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            container.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
        ])
    }
}
