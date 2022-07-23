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
        return barButton(with: UIImage(named: buttonImage), target: target, selector: selector)
    }
    
    static func barButton(with buttonImage: UIImage?, target: Any, selector: Selector) -> UIBarButtonItem {
        let button = UIButton(type: .system)
        button.addTarget(target, action: selector, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(buttonImage, for: .normal)
        button.tintColor = .white
        return UIBarButtonItem(customView: button)
    }
}
