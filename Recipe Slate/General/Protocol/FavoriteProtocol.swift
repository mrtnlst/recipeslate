//
//  FavoriteProtocol.swift
//  Recipe Slate
//
//  Created by Martin List on 16.06.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import Foundation

protocol FavoriteProtocol {
    
    var favorites: [String] { get }
}

extension FavoriteProtocol {
    
    var favorites: [String] {
        UserDefaults.standard.object(forKey: "favorites") as? [String] ?? []
    }
}
