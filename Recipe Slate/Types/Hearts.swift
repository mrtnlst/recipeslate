//
//  Hearts.swift
//  Recipe Slate
//
//  Created by Martin List on 01.07.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import UIKit

enum HeartsType: String {
    case raw = "Raw"
    case frozen = "Frozen"
    case cooked = "Cooked"
    case roasted = "Roasted"
}

extension HeartsType {
    var heartColor: UIColor {
        switch self {
        case .raw:
            return .raw
        case .frozen:
            return .frozen
        case .cooked:
            return .cooked
        case .roasted:
            return .roasted
        }
    }
}

struct Hearts {
    var numberOfHearts: Float
    var fullRestore: Bool
    var type: HeartsType
    
    var heartsText: String {
        return fullRestore ? "full" : "\(numberOfHearts)"
    }
    var heatEffectText: String? {
        return type == .frozen ?  "+ 1:00 min" : nil
    }
}
