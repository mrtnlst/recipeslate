//
//  HeartsHandler.swift
//  Recipe Slate
//
//  Created by Martin List on 13.06.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import UIKit

struct Hearts {
    var numberOfHearts: Float
    var fullRestore: Bool
}

class HeartsHandler: NSObject {
    
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
}
