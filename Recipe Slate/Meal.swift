//
//  Meal.swift
//  Recipe Slate
//
//  Created by Martin List on 14/03/2017.
//  Copyright © 2017 Martin List. All rights reserved.
//

import Foundation
import UIKit

struct Meal {
    var name: String
    var firstIngredient: String?
    var secondIngredient: String?
    var thirdIngredient: String?
    var fourthIngredient: String?
    var fifthIngredient: String?
    
    var mainIngredients: [String]?
    var categoryIngredients: [String]?

    var firstCategory: String?
    var secondCategory: String?
    var thirdCategory: String?
    var fourthCategory: String?
    
    init(name: String, mainIngredients: [String]? = nil, categoryIngredients: [String]? = nil, firstIngredient: String? = nil, secondIngredient: String? = nil, thirdIngredient: String? = nil, fourthIngredient: String? = nil, fifthIngredient: String? = nil, firstCategory: String? = nil, secondCategory: String? = nil, thirdCategory: String? = nil, fourthCategory: String? = nil) {
        self.name = name
        self.mainIngredients = mainIngredients
        self.categoryIngredients = categoryIngredients
        self.firstIngredient = firstIngredient
        self.secondIngredient = secondIngredient
        self.thirdIngredient = thirdIngredient
        self.fourthIngredient = fourthIngredient
        self.fifthIngredient = fifthIngredient
        
        self.firstCategory = firstCategory
        self.secondCategory = secondCategory
        self.thirdCategory = thirdCategory
        self.fourthCategory = fourthCategory
    
    }
    
    var titleFirstLetter: String {
        return String(self.name[self.name.startIndex]).uppercased()
    }
}
