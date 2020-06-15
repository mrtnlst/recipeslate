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
        let favoritesVC = ListViewController(dataSource: FavoritesDataSource())
        favoritesVC.title = "Favorites"
        favoritesVC.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(named: "bar-favorite"), selectedImage: nil)
        
        let mealsVC = ListViewController(dataSource: MealsDataSource())
        mealsVC.title = "Meals"
        mealsVC.tabBarItem = UITabBarItem(title: "Meals", image: UIImage(named: "bar-meal"), selectedImage: nil)
        
        viewControllers = [favoritesVC, mealsVC].map { NavigationController(rootViewController: $0) }
    }
}
