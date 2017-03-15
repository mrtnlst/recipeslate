//
//  Elixir.swift
//  Link's Recipes
//
//  Created by Martin List on 15/03/2017.
//  Copyright © 2017 Martin List. All rights reserved.
//

import Foundation
import UIKit

struct Elixir {
    var name: String
    var hearts: Float?
    var duration: String
    var effect: String
    var ingredientNames: Ingredients
    var tag = "Elixir"
    
    init(name: String, duration: String, hearts: Float? = nil, effect: String, ingredientNames: Ingredients ) {
        self.name = name
        self.hearts = hearts
        self.duration = duration
        self.effect = effect
        self.ingredientNames = ingredientNames
    }
}
