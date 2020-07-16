//
//  Effect.swift
//  Recipe Slate
//
//  Created by Martin List on 20/03/2017.
//  Copyright © 2017 Martin List. All rights reserved.
//

import UIKit

enum EffectCategory: String {
    case spicy = "Spicy"
    case hasty = "Hasty"
    case chilly = "Chilly"
    case electro = "Electro"
    case enduring = "Enduring"
    case energizing = "Energizing"
    case fireproof = "Fireproof"
    case hearty = "Hearty"
    case sneaky = "Sneaky"
    case tough = "Tough"
    case mighty = "Mighty"
}

enum EffectType: String {
    case attack = "Attack Up"
    case defense = "Defense Up"
    case speed = "Speed Up"
    case stealth = "Increased Stealth"
    case heat = "Heat Resistance"
    case cold = "Cold Resistance"
    case electricity = "Electricity Resistance"
    case fire = "Fire Resistance"
    case restoresStamina = "Restores Stamina"
    case extendsStamina = "Overfills Stamina"
    case temporaryHearts = "Temporary Hearts"
    case duration = "Duration Increase"
    case none = "No Effect"
    case someEffect = "Effect"
}

extension EffectType {
    var icon: UIImage? {
        switch self {
        case .attack:
            return UIImage(named: "attack-up")
        case .defense:
            return UIImage(named: "defense-up")
        case .speed:
            return UIImage(named: "speed-up")
        case .stealth:
            return UIImage(named: "increased-stealth")
        case .heat:
            return UIImage(named: "heat-resistance")
        case .cold:
            return UIImage(named: "cold-resistance")
        case .electricity:
            return UIImage(named: "electricity-resistance")
        case .fire:
            return UIImage(named: "fire-proof")
        case .restoresStamina:
            return UIImage(named: "restores-stamina")
        case .extendsStamina:
            return UIImage(named: "extends-stamina")
        case .temporaryHearts:
            return UIImage(named: "heart-temporary")
        case .duration:
            return UIImage(named: "duration-up")
        case .none, .someEffect:
            return UIImage(named: "effect")
        }
    }
}

struct Effect: Listable, Hashable {
    var type: EffectType
    var name: String {
        return type.rawValue
    }
    var effectName: String {
        return type.rawValue
    }
    var amount: Float?
    var duration: TimeInterval?
    var potencyLevel1: Int?
    var potencyLevel2: Int?
    
    init(type: EffectType, amount: Float? = nil, duration: TimeInterval? = nil, potencyLevel1: Int? = nil, potencyLevel2: Int? = nil) {
        self.type = type
        self.amount = amount
        self.duration = duration
        self.potencyLevel1 = potencyLevel1
        self.potencyLevel2 = potencyLevel2
   
    }
}
