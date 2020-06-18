//
//  ResaleHandler.swift
//  Recipe Slate
//
//  Created by Martin List on 18.06.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import UIKit

class ResaleHandler: NSObject {

    static func resaleValue(for meal: Meal, and categories: [Material]) -> String {
        
        if meal.name == "Fairy Tonic" { return "2 Rupees" }
        
        var ingredients = materialData.filter({ meal.mainIngredients.contains($0.name) })
        ingredients.append(contentsOf: categories)
        
        var value = Double(ingredients.compactMap({ $0.saleValue }).reduce(0, +))
    
        switch ingredients.count {
        case 1:
            value = 1.5 * value
        case 2:
            value = 1.75 * value
        case 3:
            value = 2.05 * value
        case 4:
            value = 2.4 * value
        case 5:
            value = 2.8 * value
        default:
            break
        }
        value = ceil(floor(value) / 10.0) * 10
        return "\(Int(value)) Rupees"
    }
}
