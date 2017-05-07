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
    var potencyLevel1: Int?
    var potencyLevel2: Int?
    
    init(effectName: String, amount: Float? = nil, duration: TimeInterval? = nil, potencyLevel1: Int? = nil, potencyLevel2: Int? = nil) {
        self.effectName = effectName
        self.amount = amount
        self.duration = duration
        self.potencyLevel1 = potencyLevel1
        self.potencyLevel2 = potencyLevel2
   
    }
    var titleFirstLetter: String {
        return String(self.effectName[self.effectName.startIndex]).uppercased()
    }
}
