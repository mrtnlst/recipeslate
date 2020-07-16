//
//  MealListDataSource.swift
//  Recipe Slate
//
//  Created by Martin List on 15.06.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import UIKit

class MealListDataSource: NSObject, ListDataSource, FavoriteProtocol {
    
    var items: [Listable] {
        if let filter = filterMaterial {
            return mealData.filter { (meal) -> Bool in
                if meal.mainIngredients.contains(filter.name) {
                    return true
                }
                if meal.categoryIngredients.contains(where: { filter.category.contains($0) }) {
                    return true
                }
                return false
            }
        }
        return mealData
    }
    var sectionIndexTitles: [String] = []
    var sections: [[Listable]] = [[]]
    var filteredResults = [Listable]()
    var filterMaterial: Material?
    
    init(with filter: Material? = nil) {
        super.init()
        filterMaterial = filter
    }
}

extension MealListDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if !filteredResults.isEmpty {
            return ""
        }
        return sectionIndexTitles[section]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionIndexTitles.map({ String($0.prefix(1)) })
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
            cell.effectIcon.image = EffectsHandler.mealListItemImage(meal: meal)
        }
        cell.isFavorite = favorites.contains(where: { $0 == item.name })
        return cell
    }
}
