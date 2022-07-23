//
//  Listable.swift
//  Recipe Slate
//
//  Created by Martin List on 13.06.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import Foundation

protocol Listable {
 
    var name: String { get }
    var effectName: String { get }
}

extension Listable {
    
    var titleFirstLetter: String {
        String(name[name.startIndex]).uppercased()
    }
    
    var effectFirstLetter: String {
        String(effectName[effectName.startIndex]).uppercased()
    }
}


