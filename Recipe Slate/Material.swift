//
//  Material.swift
//  Link's Recipes
//
//  Created by Martin List on 24/03/2017.
//  Copyright © 2017 Martin List. All rights reserved.
//

import Foundation

struct Material {
    var materialName: String
    var category: Category
    var hearts: Float?
    var effect: Effect?
    
    init(materialName: String, category: Category, hearts: Float? = nil, effect: Effect? = nil) {
        self.materialName = materialName
        self.category = category
        self.hearts = hearts
        self.effect = effect
        
    }
}
