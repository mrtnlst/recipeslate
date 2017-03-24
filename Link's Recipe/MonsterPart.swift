//
//  MonsterPart.swift
//  Link's Recipes
//
//  Created by Martin List on 23/03/2017.
//  Copyright © 2017 Martin List. All rights reserved.
//

import Foundation

struct MonsterPart {
    var name: String
    var duration: TimeInterval
    
    init(name: String, duration: TimeInterval) {
        self.name = name
        self.duration = duration
    }
}
