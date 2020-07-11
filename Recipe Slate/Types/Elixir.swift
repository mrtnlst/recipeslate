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
    var effect: EffectType
    var sections: [DetailTableViewSections] {
        return [.effect, .elixirIngredientInfo, .elixirIngredients, .potency]
    }
    var effectDescription: String = "Use at least one critter and one monster part. Multiple parts increase the duration. You can combine 5 ingredients at most."
    
}
