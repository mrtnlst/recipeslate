//
//  Material.swift
//  Recipe Slate
//
//  Created by Martin List on 24/03/2017.
//  Copyright © 2017 Martin List. All rights reserved.
//

import Foundation
import UIKit

enum MaterialCategory: String {
    case misc = "Misc"
    case mushroom = "Mushroom"
    case seafood = "fish"
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
    
    func icon() -> UIImage? {
        switch self {
        case .fish, .seafood, .seafoodCurry, .porgy, .exceptPoryOrSalmon:
            return UIImage(named: "category-fish")
        case .misc:
            return UIImage(named: "category-misc")
        case .snail:
            return UIImage(named: "category-snail")
        case .crab, .crabOrSnail:
            return UIImage(named: "category-crab")
        case .vegetables, .carrot, .exceptPumpkin, .carrotOrPumpkin, .exceptCarrotOrPumpkin, .flowersAndHerbs, .radish:
            return UIImage(named: "category-vegetables")
        case .fruit, .appleAndWildberry, .besidesApple, .besidesAppleAndWildberry:
            return UIImage(named: "category-fruit")
        case .nut:
            return UIImage(named: "category-nut")
        case .critter:
            return UIImage(named: "category-critter")
        case .monsterPart:
            return UIImage(named: "category-monsterpart")
        case .meat, .mammal, .poultry:
            return UIImage(named: "category-meat")
        case .mushroom:
            return UIImage(named: "category-mushroom")
        }
    }
}

struct Material: Listable, Sectionable, Hashable {
    
    var name: String
    var category: [MaterialCategory]
    var effectName: String {
        return effect?.type.rawValue ?? EffectType.none.rawValue
    }
    var hearts: Float?
    var effect: Effect?
    var saleValue: Int?
    var location: String?
    var potency: Int?
    var sections: [DetailTableViewSections] {
        var sections: [DetailTableViewSections] = [.effect, .potency, .resaleValue, .location, .dishes]
        
        if !heartCategories.isEmpty {
            sections.insert(.heartList, at: 0)
        }
        
        if [.duration, .temporaryHearts, .extendsStamina, .restoresStamina].contains(effect?.type) {
            sections.removeAll(where: { $0 == .potency })
        }
        
        if effect == nil {
            sections.removeAll(where: { $0 == .potency })
            sections.removeAll(where: { $0 == .effect })
        }
        return sections
    }
    var isElixirIngredient: Bool {
        return category.contains(.critter) || category.contains(.monsterPart)
    }
    var hasDurationEffect: Bool {
        return effect?.type == .duration
    }
    var heartCategories: [Hearts] {
        let fullRestore = effect?.type == EffectType.temporaryHearts
        var categories: [Hearts] = []
        
        if let hearts = hearts, name != "Wood" && name != "Silent Princess" {
            let heartsException: Float? = ["Acorn", "Chickaloo Tree Nut"].contains(name) ? 0.25 : nil
            categories.append(Hearts(numberOfHearts: heartsException ?? hearts, fullRestore: false, type: .raw))
        }
        if let roastedItem = roastedFoodData.first(where: { $0.ingredientNames.contains(name) }) {
            categories.append(Hearts(numberOfHearts: roastedItem.hearts, fullRestore: false, type: .roasted))
        }
        if let frozenItem = frozenFoodData.first(where: { $0.ingredientNames.contains(name) }) {
            categories.append(Hearts(numberOfHearts: frozenItem.hearts, fullRestore: false, type: .frozen))
        }
                
        if let hearts = hearts {
            categories.append(Hearts(numberOfHearts: name == "Fairy" ? 7 : hearts * 2,
                                     fullRestore: fullRestore, type: .cooked))
            
        }
        return categories
    }
    
    var baseResaleValue: Int? {
        saleValue ?? 0
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
