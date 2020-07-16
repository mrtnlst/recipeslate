//
//  EffectHandler.swift
//  Recipe Slate
//
//  Created by Martin List on 15.06.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import Foundation
import UIKit

class EffectsHandler: NSObject {
    
    // MARK: - Material
    
    static func icon(for material: Material) -> UIImage? {
        if let effect = material.effect, effect.type != .duration {
            return effect.type.icon
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
        
        return Hearts(numberOfHearts: hearts * 2, fullRestore: fullRestore, type: .raw)
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
    
    static func obtainImage(for materialName: String) -> UIImage {
        if let image = UIImage(named: materialName) {
            return image
        }
        let materialCategory = materialData.filter({ $0.name == materialName }).first?.category.first
        return materialCategory?.icon() ?? UIImage()
    }
    
    /// Calculates effect for elixir materials.
    /// - Parameter materials: array of materials
    /// - Returns: Effect object 
    static func calculateEffect(for materials: [Material]) -> Effect {
        guard let mainMaterial = materials.filter({ $0.effect?.type != .duration }).first else { return Effect(type: .none) }
        let amount = calculateEffectAmount(of: materials)
        
        if amount > 0 {
            return Effect(type: mainMaterial.effect?.type ?? .none, amount: amount, duration: nil, potencyLevel1: nil, potencyLevel2: nil)
        }
        
        let duration = calculateEffectDuration(for: materials)
        
        return Effect(type: mainMaterial.effect?.type ?? .none, amount: nil, duration: duration, potencyLevel1: nil, potencyLevel2: nil)
    }
    
    static func calculateEffectAmount(of materials: [Material]) -> Float {
        let critter = materials.first(where: { $0.category.contains(.critter) })
        let occurences = materials.filter({ $0 == critter }).count
        if critter?.name == "Energetic Rhino Beetle" {
            switch occurences {
            case 1:
                return 1.6
            case 2, 3, 4:
                return 3
            default:
                return 0
            }
        }
        else if critter?.name == "Restless Cricket" {
            switch occurences {
            case 1:
                return 0.2
            case 2:
                return 0.4
            case 3:
                return 0.8
            case 4:
                return 1.0
            default:
                return 0
            }
        } else {
            return materials.compactMap({ $0.effect?.amount }).reduce(0, +)
        }
    }
    
    static func calculateEffectDuration(for materials: [Material]) -> Double {
        var duration = materials.compactMap({ $0.effect?.duration }).reduce(0, +)
        
        if duration > 1800 {
            duration = 1800
        }
        return duration
    }
    
    // MARK: - Potency
    
    static func calculatePotencyLevel(for materials: [Material]) -> Int {
        guard let mainMaterial = materials.filter({ $0.effect?.type != .duration }).first,
              let effect = mainMaterial.effect else { return 1 }

        let potency = materials.compactMap({ $0.potency }).reduce(0, +)
        
        if let level2 = effect.potencyLevel2, potency >= level2 {
            return 3
        }
        if let level1 = effect.potencyLevel1, potency >= level1 {
            return 2
        }
        return 1
    }
    
    static func calculatePossiblePotencies(for material: Material) -> [Potency] {
        guard let materialPotency = material.potency,
              let effectPotencyLv1 = material.effect?.potencyLevel1,
              materialPotency > 1 else {
            return [Potency(amount: 0, type: material.effect?.type ?? .none, level: 1)]
        }
        
        var potencies: [Potency] = []
        
        for amount in 1...5 {
            if amount * materialPotency >= effectPotencyLv1 {
                potencies.append(Potency(amount: amount, type: material.effect?.type ?? .none, level: 2))
                break
            }
        }
        
        guard let effectPotencyLv2 = material.effect?.potencyLevel2 else { return potencies }
        for amount in 1...5 {
            if amount * materialPotency >= effectPotencyLv2 {
                potencies.append(Potency(amount: amount, type: material.effect?.type ?? .none, level: 3))
                break
            }
        }
        return potencies
    }
}
