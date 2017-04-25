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
    var category: [String]
    var hearts: Float?
    var effect: Effect?
    
    init(materialName: String, category: [String], hearts: Float? = nil, effect: Effect? = nil) {
        self.materialName = materialName
        self.category = category
        self.hearts = hearts
        self.effect = effect
        
    }
    
    var titleFirstLetter: String {
        return String(self.materialName[self.materialName.startIndex]).uppercased()
    }
}
