//
//  SortingOption.swift
//  Recipe Slate
//
//  Created by martin on 10.01.21.
//  Copyright © 2021 Martin List. All rights reserved.
//

import UIKit

enum SortingOption: String, CaseIterable {
    case alphabet = "Alphabet"
    case effect = "Effect"
    case resaleValue = "Resale Value"
    
    var icon: UIImage? {
        switch self {
        case .alphabet:
            return UIImage(systemName: "textformat.abc")
        case .effect:
            return UIImage(named: "bar-effects")
        case .resaleValue:
            return UIImage(named: "detail-rupee")
        }
    }
}
