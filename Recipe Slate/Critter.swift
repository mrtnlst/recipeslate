//
//  Critter.swift
//  Link's Recipes
//
//  Created by Martin List on 22/03/2017.
//  Copyright © 2017 Martin List. All rights reserved.
//

import Foundation

struct Critter {
    var name: String
    var category: String
    var effect: String
    var duration: TimeInterval?
    var amount: Float?
    var potency: Int?
    
    init(name: String, category: String, effect: String, duration: TimeInterval? = nil, amount: Float? = nil, potency: Int? = nil) {
        self.name = name
        self.category = category
        self.duration = duration
        self.effect = effect
        self.amount = amount
        self.potency = potency
    }
}
