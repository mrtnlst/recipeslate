//
//  EffectDataSource.swift
//  Recipe Slate
//
//  Created by Martin List on 15.06.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import Foundation
import UIKit

class EffectDataSource: NSObject, DataSourceProtocol {
    
    var items: [ItemPresentable] {
        return effectData
    }
    var sortedFirstLetters: [String] = []
    var sections: [[ItemPresentable]] = [[]]
    var filteredResults = [ItemPresentable]()
}

extension EffectDataSource: UITableViewDataSource {
    
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
        if let effect = item as? Effect {
            cell.effectIcon.image = UIImage(named: effect.type.rawValue)
        }
        return cell
    }
}
