//
//  Critter.swift
//  Recipe Slate
//
//  Created by Martin List on 22/03/2017.
//  Copyright © 2017 Martin List. All rights reserved.
//

import Foundation

struct Critter {
    var name: String
    var category: EffectCategory
    var effect: EffectType
    var duration: TimeInterval?
    var amount: Float?
    var potency: Int?
    
    init(name: String, category: EffectCategory, effect: EffectType, duration: TimeInterval? = nil, amount: Float? = nil, potency: Int? = nil) {
        self.name = name
        self.category = category
        self.duration = duration
        self.effect = effect
        self.amount = amount
        self.potency = potency
    }
}
