//
//  ArmorSet.swift
//  Recipe Slate
//
//  Created by martin on 31.12.17.
//  Copyright © 2017 Martin List. All rights reserved.
//

import Foundation

struct ArmorSet {
    var setName: String
    var setPieces: [String]
    var defaultEffect: String?
    var setEffect: String?
    
    
    init(setName: String, setPieces: [String], defaultEffect: String? = nil, setEffect: String? = nil) {
        self.setName = setName
        self.setPieces = setPieces
        self.defaultEffect = defaultEffect
        self.setEffect = setEffect
    }
    
    var titleFirstLetter: String {
        return String(self.setName[self.setName.startIndex]).uppercased()
    }
}
