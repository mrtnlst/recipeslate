//
//  Meal.swift
//  Link's Recipes
//
//  Created by Martin List on 14/03/2017.
//  Copyright © 2017 Martin List. All rights reserved.
//

import Foundation
import UIKit

struct Meal {
    var name: String
    var hearts: Float
    var duration: String?
    var effect: String?
    var ingredientNames: Ingredients
    var tag = "Meal"
    
    init(name: String, hearts: Float, duration: String? = nil, effect: String? = nil, ingredientNames: Ingredients ) {
        self.name = name
        self.hearts = hearts
        self.duration = duration
        self.effect = effect
        self.ingredientNames = ingredientNames
    }
    
    var titleFirstLetter: String {
        return String(self.name[self.name.startIndex]).uppercased()
    }
}
