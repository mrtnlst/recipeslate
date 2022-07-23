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
    var image: UIImageView? {
        let imageView = UIImageView(image: icon)
        imageView.tintColor = iconColor
        return imageView
    }
    
    var icon: UIImage? {
        switch self {
        case .attack:
            return UIImage(named: "sword")
        case .defense:
            return UIImage(systemName: "shield.righthalf.filled")
        case .speed:
            return UIImage(named: "speed")
        case .stealth:
            return UIImage(named: "stealth")
        case .heat:
            return UIImage(systemName: "thermometer.sun.fill")
        case .cold:
            return UIImage(systemName: "snowflake")
        case .electricity:
            return UIImage(systemName: "bolt.fill")
        case .fire:
            return UIImage(systemName: "flame.fill")
        case .restoresStamina:
            return UIImage(named: "staminacircle")
        case .extendsStamina:
            return UIImage(named: "staminacircle")
        case .temporaryHearts:
            return UIImage(systemName: "heart.fill")
        case .duration:
            return UIImage(systemName: "clock.arrow.circlepath")
        case .none, .someEffect:
            return UIImage(systemName: "wand.and.stars")
        }
    }
    
    var iconColor: UIColor {
        switch self {
        case .attack:
            return .attackColor
        case .defense:
            return .defenseColor
        case .speed:
            return .speedColor
        case .stealth:
            return .stealthColor
        case .heat:
            return .heatColor
        case .cold:
            return .coldColor
        case .electricity:
            return .electricityColor
        case .fire:
            return .fireColor
        case .restoresStamina:
            return .restoresStaminaColor
        case .extendsStamina:
            return .extendsStaminaColor
        case .temporaryHearts:
            return .temporaryHeartsColor
        default:
            return .white
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
    var baseResaleValue: Int?
    
    init(type: EffectType, amount: Float? = nil, duration: TimeInterval? = nil, potencyLevel1: Int? = nil, potencyLevel2: Int? = nil) {
        self.type = type
        self.amount = amount
        self.duration = duration
        self.potencyLevel1 = potencyLevel1
        self.potencyLevel2 = potencyLevel2
   
    }
}
