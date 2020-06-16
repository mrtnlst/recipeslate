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
    
    static func calculateHearts(for meal: Meal) -> Hearts {
        var fullRestore = false
        var hearts: Float = 0
        
        for ingredient in meal.mainIngredients {
            guard let material = materialData.first(where: { $0.name == ingredient }) else { continue }
            guard let materialHearts = material.hearts else { continue }
            hearts += materialHearts
            if material.effect?.type == .temporaryHearts {
                fullRestore = true
            }
        }
        return Hearts(numberOfHearts: hearts * 2, fullRestore: fullRestore)
    }
    
    // MARK: - Effects
    
    static func checkForMealEffect(meal: Meal) -> UIImage {
        var check = false
        
        check = checkMainIngredients(meal: meal)
        
        check = checkCategoryIngredients(meal: meal)
        
        if check {
            return UIImage(named: "Effect") ?? UIImage()
        } else {
            return UIImage(named: "detail-heart-full") ?? UIImage()
            
        }
    }
    
    static func checkMainIngredients(meal: Meal) -> Bool {
        for ingredient in meal.mainIngredients {
            guard let material = materialData.first(where: { $0.name == ingredient }) else { continue }
            if material.effect?.type != .duration {
                return true
            }
        }
        return false
    }
    
    static func checkCategoryIngredients(meal: Meal) -> Bool{
        
        for ingredient in meal.categoryIngredients {
            guard let material = materialData.first(where: { (material) -> Bool in
                return material.category.first(where: { ingredient == $0 }) != nil && material.effect?.type != .duration
            }) else { continue }
            if material.effect?.type != .duration {
                return true
            }
        }
        return false
    }
    
    static func calculateEffect(for meal: Meal) -> Effect? {
        let mainIngredients = materialData.filter({ meal.mainIngredients.contains($0.name) })
        
        let effects = Array(Set(mainIngredients.map({ $0.effect })))
        
        if effects.count == 1 {
            return effects.first ?? nil
        }
        return Effect(type: .none)
    }
}
