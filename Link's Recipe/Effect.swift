//
//  Effect.swift
//  Link's Recipes
//
//  Created by Martin List on 20/03/2017.
//  Copyright © 2017 Martin List. All rights reserved.
//

import Foundation

struct Effect {
    var effectName: String
    var amount: Float?
    var duration: String?
    var effectIngredient: String
    
    init(effectName: String, amount: Float? = nil, duration: String? = nil, effectIngredient: String) {
        self.effectName = effectName
        self.amount = amount
        self.duration = duration
        self.effectIngredient = effectIngredient
   
    }
}
