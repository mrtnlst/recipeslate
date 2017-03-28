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
    var duration: TimeInterval?
    
    init(effectName: String, amount: Float? = nil, duration: TimeInterval? = nil) {
        self.effectName = effectName
        self.amount = amount
        self.duration = duration
   
    }
}
