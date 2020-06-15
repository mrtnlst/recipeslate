//
//  FavoriteDataSource.swift
//  Recipe Slate
//
//  Created by Martin List on 15.06.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import UIKit

class FavoriteDataSource: NSObject, DataSourceProtocol {
    
    var favorites: [String] {
        UserDefaults.standard.object(forKey: "favorites") as? [String] ?? []
    }
    var items: [ItemPresentable] {
        return mealData.filter({ favorites.contains($0.name) })
    }
    var sortedFirstLetters: [String] = []
    var sections: [[ItemPresentable]] = [[]]
    var filteredResults = [ItemPresentable]()
}

extension FavoriteDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if !filteredResults.isEmpty {
            return ""
        }
        return sortedFirstLetters[section]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sortedFirstLetters
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if !filteredResults.isEmpty {
            return 1
        }
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !filteredResults.isEmpty {
            return filteredResults.count
        }
        return sections[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ElementTableViewCell.identifier,
                                                       for: indexPath) as? ElementTableViewCell else { fatalError() }
        
        let item = getCorrectCellItem(path: indexPath)
        cell.label.text = item.name
        if let meal = item as? Meal {
            cell.icon.image = EffectsHandler.checkForMealEffect(meal: meal)
        }
        return cell
    }
}

