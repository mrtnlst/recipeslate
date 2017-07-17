//
//  Elixir.swift
//  Recipe Slate
//
//  Created by Martin List on 15/03/2017.
//  Copyright © 2017 Martin List. All rights reserved.
//

import Foundation
import UIKit

struct Elixir {
    var name: String
    var category: String
    var effect: String

    
    init(name: String, category: String, effect: String) {
        self.name = name
        self.category = category
        self.effect = effect
    }
    
    var titleFirstLetter: String {
        return String(self.name[self.name.startIndex]).uppercased()
    }
}
