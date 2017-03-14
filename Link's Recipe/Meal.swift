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
    var minNumberOfIngredients: Int
    var ingredientNames: Ingredients
    
    init(name: String, hearts: Float, minNumberOfIngredients: Int, ingredientNames: Ingredients ) {
        self.name = name
        self.hearts = hearts
        self.minNumberOfIngredients = minNumberOfIngredients
        self.ingredientNames = ingredientNames
    }
}
