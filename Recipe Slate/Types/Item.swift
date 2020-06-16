//
//  Item.swift
//  Recipe Slate
//
//  Created by Martin List on 13.06.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import Foundation

protocol Item {
 
    var name: String { get }
}

extension Item {
    
    var titleFirstLetter: String {
        return String(name[name.startIndex]).uppercased()
    }
}


