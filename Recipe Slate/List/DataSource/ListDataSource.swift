//
//  SectionPresentable.swift
//  Recipe Slate
//
//  Created by Martin List on 15.06.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import Foundation

protocol ListDataSource {
    
    var items: [Listable] { get }
    
    var sections: [[Listable]] { get set  }
    
    var sortedFirstLetters: [String] { get set }
    
    var filteredResults: [Listable] { get set }
}

extension ListDataSource {
    
    mutating func createSections() {
        let firstLetters = items.compactMap { $0.titleFirstLetter }
        let uniqueFirstLetters = Array(Set(firstLetters))
        
        sortedFirstLetters = uniqueFirstLetters.sorted()
        sections = sortedFirstLetters.map { firstLetter in
            return items
                .filter { $0.titleFirstLetter == firstLetter }
                .sorted { $0.name < $1.name }
        }
    }
    
    func getCorrectCellItem(path: IndexPath) -> Listable {
        return !filteredResults.isEmpty ? filteredResults[path.row] : sections[path.section][path.row]
    }
    
    mutating func filterContentForSearchText(_ searchText: String) {
        filteredResults = items.filter { meal in
            return meal.name.lowercased().contains(searchText.lowercased())
        }
    }
}
