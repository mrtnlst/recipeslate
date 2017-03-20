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
    var heartsAdded: Int?
    var staminaAdded: Float?
    var tag = "Meal"
    
    init(name: String, hearts: Float, duration: String? = nil, effect: String? = nil, ingredientNames: Ingredients, heartsAdded: Int? = nil, staminaAdded: Float? = nil) {
        self.name = name
        self.hearts = hearts
        self.duration = duration
        self.effect = effect
        self.heartsAdded = heartsAdded
        self.ingredientNames = ingredientNames
        self.staminaAdded = staminaAdded
    }
    
    var titleFirstLetter: String {
        return String(self.name[self.name.startIndex]).uppercased()
    }
}
