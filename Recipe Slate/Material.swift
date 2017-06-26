//
//  Material.swift
//  Recipe Slate
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
    var saleValue: Int?
    var location: String?
    var potency: Int?
    
    init(materialName: String, category: [String], hearts: Float? = nil, effect: Effect? = nil, saleValue: Int? = nil, location: String? = nil, potency: Int? = nil) {
        self.materialName = materialName
        self.category = category
        self.hearts = hearts
        self.effect = effect
        self.saleValue = saleValue
        self.location = location
        self.potency = potency
    }
    
    var titleFirstLetter: String {
        return String(self.materialName[self.materialName.startIndex]).uppercased()
    }
}
