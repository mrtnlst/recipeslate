//
//  Food.swift
//  Link's Recipes
//
//  Created by Martin List on 17/03/2017.
//  Copyright © 2017 Martin List. All rights reserved.
//

import Foundation
import UIKit

struct Food {
    var name: String
    var hearts: Float
    var effect: String?
    var duration: String?
    var ingredientNames: Ingredients
    var tag = "Food"
    
    init(name: String, hearts: Float, effect: String? = nil, duration: String? = nil, ingredientNames: Ingredients ) {
        self.name = name
        self.effect = effect
        self.duration = duration
        self.hearts = hearts
        self.ingredientNames = ingredientNames
    }
    
    var titleFirstLetter: String {
        return String(self.name[self.name.startIndex]).uppercased()
    }
}

//class Name {
//    let nameTitle: String
//    let nameDetail: String
//    
//    init(nameTitle: String, nameDetail: String) {
//        self.nameTitle = nameTitle
//        self.nameDetail = nameDetail
//    }
//    
//    var titleFirstLetter: String {
//        return String(self.nameTitle[self.nameTitle.startIndex]).uppercased()
//    }
//}
