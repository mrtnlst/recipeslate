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
    var ingredientNames: Ingredients
    var firstEffect: Effect?
    var secondEffect: Effect?
    var thirdEffect: Effect?
    
    init(name: String, hearts: Float, ingredientNames: Ingredients, firstEffect: Effect? = nil, secondEffect: Effect? = nil, thirdEffect: Effect? = nil) {
        self.name = name
        self.hearts = hearts
        self.ingredientNames = ingredientNames
        self.firstEffect = firstEffect
        self.secondEffect = secondEffect
        self.thirdEffect = thirdEffect
    }
    
    var titleFirstLetter: String {
        return String(self.name[self.name.startIndex]).uppercased()
    }
}
