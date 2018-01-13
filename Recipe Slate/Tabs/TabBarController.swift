//
//  TabBarController.swift
//  Recipe Slate
//
//  Created by martin on 31.12.17.
//  Copyright © 2017 Martin List. All rights reserved.
//

import Foundation
import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    let tabOrderKey = "customTabBarOrder"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        loadCustomTabOrder()
    }
    
    func loadCustomTabOrder() {
        
        let defaults = UserDefaults.standard
        let standardOrderChanged = defaults.bool(forKey: tabOrderKey)
        
        if standardOrderChanged {
            print("Standard Order has changed")
            
            var viewControllers = [UIViewController]()
            var tagNumber = 0
            
            let tabBar = self as UITabBarController
            
            if let countVC = tabBar.viewControllers?.count {
                print("\(countVC) VCs in total")
                for position in stride(from: 0, to: countVC, by: 1){
                    tagNumber = defaults.integer(forKey: "tabPosition\(position)")
                    
                    print(tabBar.tabBarItem)
                    
                    for viewController in tabBar.viewControllers! {
                        if tagNumber == viewController.tabBarItem.tag {
                            viewControllers.append(viewController)
                            print("Position \(position): \(viewControllers[position].tabBarItem.title!) VC (tag \(tagNumber))")
                            break
                        }
                    }
                }
            }
            tabBar.viewControllers = viewControllers
        }
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didEndCustomizing viewControllers: [UIViewController], changed: Bool) {
        if changed {
            print("Order has changed")
            let defaults = UserDefaults.standard
            
            for position in stride(from: 0, to: viewControllers.count, by: 1){
                defaults.set(viewControllers[position].tabBarItem.tag, forKey: "tabPosition\(position)")
                print("\(viewControllers[position].tabBarItem.title!) VC (with tag: \(viewControllers[position].tabBarItem.tag)) is now in position \(position)")
            }
            defaults.set(true, forKey: tabOrderKey)
        }
        else {
            print("Nothing has changed")
        }
    }
}
