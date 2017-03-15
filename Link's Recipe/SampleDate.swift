//
//  SampleDate.swift
//  Link's Recipes
//
//  Created by Martin List on 14/03/2017.
//  Copyright © 2017 Martin List. All rights reserved.
//

import Foundation

let mealData = [
//    Meal(name:"Roasted Apple", hearts: 0.75,
//         duration: nil, effect: nil,
//         ingredientNames: Ingredients(firstIngredient: "Apple")),

    Meal(name:"Roasted Apple", hearts: 0.75, duration: "1:20 min",
         ingredientNames: Ingredients(firstIngredient: "Apple")),
    
    Meal(name:"Baked Palm Fruit",
         hearts: 1.5, duration: nil, effect: nil,
         ingredientNames: Ingredients(firstIngredient: "Palm Fruit"))
]

let elixirData = [
    Elixir(name:"Spicy Elixir", duration: "2:10 min", hearts: 3.0, effect: "Cold resistance",
           ingredientNames: Ingredients(firstIngredient: "Sizzlewing Butterfly", secondIngredient: "Bokoblin Fang")),
]

