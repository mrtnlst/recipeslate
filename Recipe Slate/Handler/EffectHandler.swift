//
//  EffectHandler.swift
//  Recipe Slate
//
//  Created by Martin List on 15.06.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import Foundation
import UIKit

struct Hearts {
    var numberOfHearts: Float
    var fullRestore: Bool
}

class EffectsHandler: NSObject {
    
    // MARK: - Material
    
    static func icon(for material: Material) -> UIImage? {
        if let effect = material.effect, effect.type != .duration {
            return UIImage(named: effect.type.rawValue)
        }
        if material.hearts != nil {
            return UIImage(named: "detail-heart-full")
        }
        return nil
    }
    
    // MARK: - Hearts
    
    /// Calculates hearts for main and category ingredients
    /// - Parameters:
    ///   - mainIngredients: main ingredients as an array of String
    ///   - categories: category ingredients as an array of Material
    /// - Returns: Hearts object
    static func calculateHearts(for mainIngredients: [String], and categories: [Material]) -> Hearts {
        var ingredients = materialData.filter({ mainIngredients.contains($0.name) })
        ingredients.append(contentsOf: categories)
        
        let fullRestore = ingredients.contains(where: { $0.effect?.type == .temporaryHearts })
        let hearts = ingredients.compactMap({ $0.hearts }).reduce(0, +)
        
        return Hearts(numberOfHearts: hearts * 2, fullRestore: fullRestore)
    }
    
    // MARK: - Effects
    
    /// Checks whether meal ingredients can produce an effect besides duration and temporary hearts.
    /// - Parameter meal: object of type Meal to check
    /// - Returns: UIImage with effect or heart icon
    static func checkForMealEffect(meal: Meal) -> UIImage {
        var materials = meal.categoryIngredients.map({ obtainMaterials(for: $0) }).reduce([], +)
        materials.append(contentsOf: materialData.filter({ meal.mainIngredients.contains($0.name) }))
        
        let heartEffects: [EffectType] = [.none, .duration, .temporaryHearts]
        let haveHeartSupportingEffect = materials.allSatisfy({ heartEffects.contains($0.effect?.type ?? .none) })
        if haveHeartSupportingEffect {
            return UIImage(named: "detail-heart-full") ?? UIImage()
        }
        return UIImage(named: "Effect") ?? UIImage()
    }
    
    /// Calculates effect for given main and category ingredients.
    /// - Parameters:
    ///   - mainIngredients: main ingredients as an array of String
    ///   - categories: category ingredients as an array of Material
    /// - Returns: Effect object
    static func calculateEffect(for mainIngredients: [String], and categories: [Material]) -> Effect {
        
        // Create joined array of type Material
        var ingredients = materialData.filter({ mainIngredients.contains($0.name) })
        ingredients.append(contentsOf: categories)

        // Create effects array and split it by type.
        let effects = ingredients.compactMap({ $0.effect })
        let effectsOfTypeDuration = effects.filter({ $0.type == EffectType.duration })
        let effectsExceptDuration = effects.filter({ !effectsOfTypeDuration.contains($0) })
        
        // Calculate duration of all effects of the same type.
        var duration = effectsOfTypeDuration.compactMap({ $0.duration }).reduce(0, +)
        
        // Check whether all effects, besides duration are the same.
        let allEffectsHaveEqualType = effectsExceptDuration.allSatisfy({ $0.type == effectsExceptDuration.first?.type })

        // If all effects have the same type or there's less than 1 effect.
        if effectsExceptDuration.count < 2 || allEffectsHaveEqualType {
            
            // If remaining effect is just duration, display no effect.
            guard let effect = effectsExceptDuration.first, effect.type != .duration else {
                return Effect(type: .none)
            }
            
            // Finish calculations.
            duration += effectsExceptDuration.compactMap({ $0.duration }).reduce(0, +)
            let amount = effectsExceptDuration.compactMap({ $0.amount }).reduce(0, +)
            
            return Effect(type: effectsExceptDuration.first?.type ?? .duration, amount: amount,
                          duration: duration, potencyLevel1: nil, potencyLevel2: nil)
        }
        // If effects cancel each other one out, return effect type .none
        return Effect(type: .none)
    }
    
    static func obtainMaterials(for materialCategory: MaterialCategory?) -> [Material] {
        return materialData.filter({ $0.category.contains(where: { materialCategory == $0 }) })
    }
}
