//
//  SectionPresentable.swift
//  Recipe Slate
//
//  Created by Martin List on 15.06.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import UIKit

enum SortType: Int {
    case alphabetically = 0
    case effect
}

typealias DataSource = ListDataSource & UITableViewDataSource

protocol ListDataSource {
    
    var items: [Listable] { get }
    
    var sections: [[Listable]] { get set  }
    
    var filteredResults: [Listable] { get set }
    
    var sectionIndexTitles: [String] { get set }
}

extension ListDataSource {
    
    mutating func createSections(by sortType: SortType) {
        let itemsForSections = filteredResults.isEmpty ? items : filteredResults
        switch sortType {
        case .alphabetically:
            sectionIndexTitles = Array(Set(itemsForSections.compactMap { $0.titleFirstLetter }))
            sectionIndexTitles.sort()
            sections = sectionIndexTitles.map { firstLetter in
                return itemsForSections
                    .filter { $0.titleFirstLetter == firstLetter }
                    .sorted { $0.name < $1.name }
            }
        case .effect:
            sectionIndexTitles = Array(Set(itemsForSections.compactMap { $0.effectName.uppercased() }))
            sectionIndexTitles.sort()
            sections = sectionIndexTitles.map { firstLetter in
                return itemsForSections
                    .filter { $0.effectName.uppercased() == firstLetter }
                    .sorted { $0.name < $1.name }
            }
        }
        
    }
    
    func getCorrectCellItem(path: IndexPath) -> Listable {
        return !filteredResults.isEmpty ? filteredResults[path.row] : sections[path.section][path.row]
    }
    
    mutating func filterContentForSearchText(_ searchText: String) {
        return filteredResults = items.filter({  $0.name.lowercased().contains(searchText.lowercased()) })
    }
}
