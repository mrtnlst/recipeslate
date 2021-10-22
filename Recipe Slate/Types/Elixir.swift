//
//  Elixir.swift
//  Recipe Slate
//
//  Created by Martin List on 15/03/2017.
//  Copyright © 2017 Martin List. All rights reserved.
//

import Foundation
import UIKit

struct Elixir: Listable, Sectionable {
    
    var name: String
    var category: EffectCategory
    var effectName: String {
        return effect.rawValue
    }
    var effect: EffectType
    var sections: [DetailTableViewSections] {
        var sections: [DetailTableViewSections] = [.effect, .elixirPotency, .resaleValue, .elixirIngredientInfo, .elixirIngredients]
        
        if [.temporaryHearts, .extendsStamina, .restoresStamina].contains(effect) {
            sections.removeAll(where: { $0 == .elixirPotency })
        }
        return sections
    }
    var effectDescription: String = "Use at least one critter and one monster part. Multiple parts increase the duration. You can combine 5 ingredients at most."
    var baseResaleValue: Int?
}
