//
//  Itemize.swift
//  Recipe Slate
//
//  Created by Martin List on 23.06.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import UIKit

protocol Itemize: Guidable {
    
    var rowContainers: [UILayoutGuide] { get set }
}

extension Itemize where Self: UITableViewCell {
    
    func setupRowContainer() -> UILayoutGuide {
        let rowContainer = UILayoutGuide()
        contentView.addLayoutGuide(rowContainer)
        
        if let formerContainer = rowContainers.last {
            NSLayoutConstraint.activate([
                rowContainer.topAnchor.constraint(equalTo: formerContainer.bottomAnchor, constant: 8),
            ])
        } else {
            NSLayoutConstraint.activate([
                rowContainer.topAnchor.constraint(equalTo: container.topAnchor),
            ])
        }
        
        NSLayoutConstraint.activate([
                           
            rowContainer.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            rowContainer.trailingAnchor.constraint(equalTo: container.trailingAnchor),
        ])
        
        return rowContainer
    }
}
