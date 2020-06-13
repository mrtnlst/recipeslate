//
//  Meal.swift
//  Recipe Slate
//
//  Created by Martin List on 14/03/2017.
//  Copyright © 2017 Martin List. All rights reserved.
//

import Foundation
import UIKit

struct Meal: ItemPresentable {
    var name: String
    var mainIngredients: [String]
    var categoryIngredients: [MaterialCategory]
    
    init(name: String, mainIngredients: [String], categoryIngredients: [MaterialCategory]) {
        self.name = name
        self.mainIngredients = mainIngredients
        self.categoryIngredients = categoryIngredients
    }
    
    var titleFirstLetter: String {
        return String(self.name[self.name.startIndex]).uppercased()
    }
}
