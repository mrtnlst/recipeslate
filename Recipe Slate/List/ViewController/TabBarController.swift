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
        let favoritesVC = ListViewController(dataSource: FavoriteListDataSource())
        favoritesVC.title = "Favorites"
        favoritesVC.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(named: "bar-favorite"), selectedImage: nil)
        NotificationCenter.default.addObserver(favoritesVC,
                                               selector: #selector(favoritesVC.refreshTable),
                                               name: NSNotification.Name(rawValue: "refresh"), object: nil)
        
        let mealVC = ListViewController(dataSource: MealListDataSource())
        mealVC.title = "Meals"
        mealVC.tabBarItem = UITabBarItem(title: "Meals", image: UIImage(named: "bar-meal"), selectedImage: nil)
        NotificationCenter.default.addObserver(mealVC,
                                               selector: #selector(mealVC.refreshTable),
                                               name: NSNotification.Name(rawValue: "refresh"), object: nil)
        
        let elixirVC = ListViewController(dataSource: ElixirListDataSource())
        elixirVC.title = "Elixirs"
        elixirVC.tabBarItem = UITabBarItem(title: "Meals", image: UIImage(named: "bar-elixir"), selectedImage: nil)
        
        let effectVC = ListViewController(dataSource: EffectListDataSource())
        effectVC.title = "Effects"
        effectVC.tabBarItem = UITabBarItem(title: "Effects", image: UIImage(named: "bar-effects"), selectedImage: nil)
        
        let materialVC = ListViewController(dataSource: MaterialListDataSource())
        materialVC.title = "Materials"
        materialVC.tabBarItem = UITabBarItem(title: "Materials", image: UIImage(named: "bar-food"), selectedImage: nil)
        
        viewControllers = [favoritesVC, mealVC, elixirVC, effectVC, materialVC].map { NavigationController(rootViewController: $0) }
    }
}
