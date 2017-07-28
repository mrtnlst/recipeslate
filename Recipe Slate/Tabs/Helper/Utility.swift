//
//  Utility.swift
//  Recipe Slate
//
//  Created by martin on 19.07.17.
//  Copyright © 2017 Martin List. All rights reserved.
//

import Foundation
import UIKit

class Utility {
    static func setLargeTitles(navigationBar: UINavigationBar, navigationItem: UINavigationItem, backButtonTitle: String){
        if #available(iOS 11.0, *) {
            navigationBar.prefersLargeTitles = true
            navigationBar.sizeToFit()

            navigationBar.largeTitleTextAttributes = [
                NSAttributedStringKey.foregroundColor: UIColor.white,
            ]
            
            navigationItem.backBarButtonItem?.title = backButtonTitle
            
        } else {
            // Fallback on earlier versions
        }
    }
    
    static func setDetailViewTitles(navigationItem: UINavigationItem){
        if #available(iOS 11.0, *) {
            navigationItem.largeTitleDisplayMode = .never
        } else {
            // Fallback on earlier versions
        }
    }
}
