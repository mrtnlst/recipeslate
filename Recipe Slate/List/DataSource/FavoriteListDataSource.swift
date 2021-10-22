//
//  FavoriteListDataSource.swift
//  Recipe Slate
//
//  Created by Martin List on 15.06.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import UIKit

class FavoriteListDataSource: NSObject, ListDataSource, FavoriteProtocol {
    var items: [Listable] {
        var items: [Listable] = mealData.filter({ favorites.contains($0.name) })
        items.append(contentsOf: materialData.filter({ favorites.contains($0.name) }))
        items.append(contentsOf: elixirData.filter({ favorites.contains($0.name )}))
        return items
    }
    var sectionIndexTitles: [String] = []
    var sections: [[Listable]] = [[]]
    var filteredResults = [Listable]()
    var isSearchActive: Bool = false    
}

extension FavoriteListDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        isSearchActive ? "" : sectionIndexTitles[section]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionIndexTitles.compactMap({ title in
            if title.rangeOfCharacter(from: CharacterSet.decimalDigits) != nil {
                if let number = title.split(separator: " ").first {
                    return String(number)
                }
                return nil
            }
            return String(title.prefix(1))
        })
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        isSearchActive ? 1 : sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        isSearchActive ? filteredResults.count : sections[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ElementTableViewCell.identifier,
                                                       for: indexPath) as? ElementTableViewCell else { fatalError() }
        
        let item = getCorrectCellItem(path: indexPath)
        cell.label.text = item.name
        if let meal = item as? Meal {
            cell.effectIcon.image = EffectsHandler.mealListItemImage(meal: meal)
        }
        if let material = item as? Material {
            cell.effectIcon.image = material.effect?.type.icon
        }
        if let elixir = item as? Elixir {
            cell.effectIcon.image = elixir.effect.icon
        }
        return cell
    }
}

