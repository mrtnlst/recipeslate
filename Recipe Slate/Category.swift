//
//  Category.swift
//  Link's Recipes
//
//  Created by Martin List on 25/03/2017.
//  Copyright © 2017 Martin List. All rights reserved.
//

import Foundation

struct Category {
    var mainCategory: String
    var subCategory: String?
    var subSubCategory: String?
    var subSubSubCategory: String?
    var subSubSubSubCategory: String?
    
    init(mainCategory: String, subCategory: String? = nil, subSubCategory: String? = nil, subSubSubCategory: String? = nil , subSubSubSubCategory: String? = nil) {
        self.mainCategory = mainCategory
        self.subCategory = subCategory
        self.subSubCategory = subSubCategory
        self.subSubSubCategory = subSubSubCategory
        self.subSubSubSubCategory = subSubSubSubCategory

    }
}
