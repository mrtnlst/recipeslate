//
//  Elixir.swift
//  Recipe Slate
//
//  Created by Martin List on 15/03/2017.
//  Copyright © 2017 Martin List. All rights reserved.
//

import Foundation
import UIKit

struct Elixir: ItemPresentable {
    var name: String
    var category: EffectCategory
    var effect: EffectType

    init(name: String, category: EffectCategory, effect: EffectType) {
        self.name = name
        self.category = category
        self.effect = effect
    }
}
