//
//  Ingredients.swift
//  Link's Recipes
//
//  Created by Martin List on 14/03/2017.
//  Copyright © 2017 Martin List. All rights reserved.
//

import Foundation

struct Ingredients {
    //var ingredientNames = Array(repeating: "Null", count: 5)
    
    var firstIngredient: String?
    var secondIngredient: String?
    var thirdIngredient: String?
    var fourthIngredient: String?
    var fifthIngredient: String?
    
    init(firstIngredient: String? = nil, secondIngredient: String? = nil, thirdIngredient: String? = nil, fourthIngredient: String? = nil, fifthIngredient: String? = nil) {
   
        self.firstIngredient = firstIngredient
        self.secondIngredient = secondIngredient
        self.thirdIngredient = thirdIngredient
        self.fourthIngredient = fourthIngredient
        self.fifthIngredient = fifthIngredient
        
//        ingredientNames.append(firstIngredient!)
//        ingredientNames.append(secondIngredient!)
//        ingredientNames.append(thirdIngredient!)
//        ingredientNames.append(fourthIngredient!)
//        ingredientNames.append(fifthIngredient!)
    }
}

//firstIngredient: String?, secondIngredient: String?, thirdIngredient: String?, fourthIngredient: String?, fifthIngredient: String?
