//
//  UIBarButtonItem.swift
//  Recipe Slate
//
//  Created by Martin List on 16.07.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
    static func barButton(with buttonImage: String, target: Any, selector: Selector) -> UIBarButtonItem {
        let image = UIImage(named: buttonImage)
       
        let aboutButton = UIButton(type: .system)
        aboutButton.addTarget(target, action: selector, for: .touchUpInside)
        aboutButton.translatesAutoresizingMaskIntoConstraints = false
        aboutButton.setImage(image, for: .normal)
        
        NSLayoutConstraint.activate([
            aboutButton.heightAnchor.constraint(equalToConstant: 32),
            aboutButton.widthAnchor.constraint(equalToConstant: 32),
        ])
        return UIBarButtonItem(customView: aboutButton)
    }
}
