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
            return UIImage(named: "fullHeart") ?? UIImage()
            
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
