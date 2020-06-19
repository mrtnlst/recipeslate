//
//  Meal.swift
//  Recipe Slate
//
//  Created by Martin List on 14/03/2017.
//  Copyright © 2017 Martin List. All rights reserved.
//

import Foundation
import UIKit

struct Meal: Listable, Sectionable {
    var name: String
    var mainIngredients: [String]
    var categoryIngredients: [MaterialCategory]
    var sections: [DetailTableViewSections] {
        var sections: [DetailTableViewSections] = [.title, .heart, .effect, .resaleValue]
        
        if !mainIngredients.isEmpty {
            sections.append(.mainIngredient)
        }
        if !categoryIngredients.isEmpty {
            sections.append(.categoryIngredient)
        }
        return sections
    }
    
    init(name: String, mainIngredients: [String], categoryIngredients: [MaterialCategory]) {
        self.name = name
        self.mainIngredients = mainIngredients
        self.categoryIngredients = categoryIngredients
    }
}
