//
//  Potency.swift
//  Recipe Slate
//
//  Created by Martin List on 19.06.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import Foundation
import UIKit

struct Potency {
    
    private var amount: Int
    private var type: EffectType
    
    var level: Int
    var potencyDescription: String {
        if amount == 0 {
            return "Maximum potency: level 1."
        }
        return "Add \(amount) for potency level \(level)."
    }
    var potencyIcon: UIImage {
        return UIImage(named: type.rawValue) ?? UIImage()
    }
    
    init(amount: Int, type: EffectType, level: Int) {
        self.amount = amount
        self.type = type
        self.level = level
    }
}
