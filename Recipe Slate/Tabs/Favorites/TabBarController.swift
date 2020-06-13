//
//  TabBarController.swift
//  Recipe Slate
//
//  Created by Martin List on 13.06.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBar()
        setupViewControllers()
    }
    
    func setupTabBar() {
        tabBar.barTintColor = .tabBarColor
        tabBar.tintColor = .white
    }
    
    func setupViewControllers() {
        let favoritesVC = FavoritesViewController()
        favoritesVC.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(named: "bar-favorite"), selectedImage: nil)
        
        viewControllers = [favoritesVC].map { NavigationController(rootViewController: $0) }
    }
}
