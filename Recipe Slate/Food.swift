//
//  Food.swift
//  Link's Recipes
//
//  Created by Martin List on 17/03/2017.
//  Copyright © 2017 Martin List. All rights reserved.
//

import Foundation
import UIKit

struct Food {
    var name: String
    var hearts: Float
    var ingredientNames: [String]
    var firstEffect: Effect?

    
    init(name: String, hearts: Float, effect: String? = nil, duration: String? = nil, ingredientNames: [String], firstEffect: Effect? = nil) {
        self.name = name
        self.hearts = hearts
        self.ingredientNames = ingredientNames
        self.firstEffect = firstEffect
    }
    
    var titleFirstLetter: String {
        return String(self.name[self.name.startIndex]).uppercased()
    }
}

