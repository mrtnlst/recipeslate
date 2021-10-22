//
//  SectionPresentable.swift
//  Recipe Slate
//
//  Created by Martin List on 15.06.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import UIKit

typealias DataSource = ListDataSource & UITableViewDataSource

protocol ListDataSource {
    
    var items: [Listable] { get }
    
    var sections: [[Listable]] { get set  }
    
    var filteredResults: [Listable] { get set }
    
    var sectionIndexTitles: [String] { get set }
    
    var isSearchActive: Bool { get set }
}

extension ListDataSource {
    
    mutating func createSections(by option: SortingOption) {
        
        let itemsForSections = isSearchActive ? filteredResults : items
        switch option {
        case .alphabet:
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
                    .sorted { (item1, item2) -> Bool in
                        if let item1 = item1 as? Material, let item2 = item2 as? Material {
                            if item1.potency != nil && item2.potency != nil {
                                return item1.potency ?? 0 > item2.potency ?? 0
                            }
                            if item1.effect?.amount != nil && item2.effect?.amount != nil {
                                return item1.effect?.amount ?? 0 > item2.effect?.amount ?? 0
                            }
                            return item1.effect?.duration ?? 0 > item2.effect?.duration ?? 0
                        }
                        return item1.name < item2.name
                    }
            }
        case .resaleValue:
            let sectionTitles: [Range<Int>] = [.init(uncheckedBounds: (lower: 1, upper: 5)),
                                               .init(uncheckedBounds: (lower: 5, upper: 20)),
                                               .init(uncheckedBounds: (lower: 20, upper: 50)),
                                               .init(uncheckedBounds: (lower: 50, upper: 100)),
                                               .init(uncheckedBounds: (lower: 100, upper: 300)),
                                               .init(uncheckedBounds: (lower: 300, upper: 5000))
            ]
            sectionIndexTitles = sectionTitles.map( { "\($0.lowerBound) to \($0.upperBound) Rupees" })
            sections = sectionTitles.map { range in
                return itemsForSections
                    .filter {
                        range.contains($0.baseResaleValue ?? 0)
                    }
                    .sorted { (item1, item2) -> Bool in
                        return item1.baseResaleValue ?? 0 < item2.baseResaleValue ?? 0
                    }
            }
        }
        
    }
    
    func getCorrectCellItem(path: IndexPath) -> Listable {
        return isSearchActive ? filteredResults[path.row] : sections[path.section][path.row]
    }
    
    mutating func filterContentForSearchText(_ searchText: String) {
        return filteredResults = items.filter({  $0.name.lowercased().contains(searchText.lowercased()) })
    }
}
