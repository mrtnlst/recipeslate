//
//  Material.swift
//  Recipe Slate
//
//  Created by Martin List on 24/03/2017.
//  Copyright © 2017 Martin List. All rights reserved.
//

import Foundation

enum MaterialCategory: String {
    case misc = "Misc"
    case mushroom = "Mushroom"
    case seafood = "Seafood"
    case fish = "Fish"
    case porgy = "Porgy"
    case seafoodCurry = "Seafood Curry"
    case exceptPoryOrSalmon = "Except Porgy or Salmon"
    case snail = "Snail"
    case crab = "Crab"
    case crabOrSnail = "Crab or Snail"
    case vegetables = "Vegetables"
    case carrot = "Carrot"
    case carrotOrPumpkin = "Carrot or Pumpkin"
    case exceptPumpkin = "Except Pumpkin"
    case exceptCarrotOrPumpkin = "except Carrot or Pumpkin"
    case flowersAndHerbs = "Flower and Herbs"
    case radish = "Radish"
    case meat = "Meat"
    case mammal = "Mammal"
    case poultry = "Poultry"
    case fruit = "Fruit"
    case appleAndWildberry = "Apple and Wildberry"
    case besidesApple = "Besides Apple"
    case besidesAppleAndWildberry = "Besides Apple and Wildberry"
    case nut = "Nut"
    case critter = "Critter"
    case monsterPart = "Monster Part"
}

struct Material: Listable, Sectionable, Hashable {
    
    var name: String
    var category: [MaterialCategory]
    var hearts: Float?
    var effect: Effect?
    var saleValue: Int?
    var location: String?
    var potency: Int?
    var sections: [DetailTableViewSections] {
        return [.title, .effect, .resaleValue]
    }
    
    init(materialName: String, category: [MaterialCategory], hearts: Float? = nil, effect: Effect? = nil, saleValue: Int? = nil, location: String? = nil, potency: Int? = nil) {
        self.name = materialName
        self.category = category
        self.hearts = hearts
        self.effect = effect
        self.saleValue = saleValue
        self.location = location
        self.potency = potency
    }
    
    static func == (lhs: Material, rhs: Material) -> Bool {
        return lhs.name == rhs.name
    }
}
