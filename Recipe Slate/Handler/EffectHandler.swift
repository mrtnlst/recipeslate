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
    
    
    static func icon(for material: Material) -> UIImage? {
        if let effect = material.effect, effect.type != .duration {
            return UIImage(named: effect.type.rawValue)
        }
        if material.hearts != nil {
            return UIImage(named: "detail-heart-full")
        }
        return nil
    }
    
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
    
    static func checkForMealEffect(meal: Meal) -> UIImage {
        var check = false
        
        let mainCheck = checkMainIngredients(meal: meal)
        if mainCheck == true {
            check = true
        }
        
        let categoryCheck = checkCategoryIngredients(meal: meal)
        if categoryCheck == true {
            check = true
        }
        
        if check {
            return UIImage(named: "Effect") ?? UIImage()
        } else {
            return UIImage(named: "detail-heart-full") ?? UIImage()
            
        }
    }
    
    static func checkMainIngredients(meal: Meal) -> Bool{
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
}
