//
//  Utility.swift
//  Recipe Slate
//
//  Created by martin on 19.07.17.
//  Copyright © 2017 Martin List. All rights reserved.
//

import Foundation
import UIKit

class Utility {
//    static func createAlphabeticalSection<T>(arrayToSort: [T]){
//        
//        var sortedFirstLetters: [String] = []
//        var sections: [[T]] = [[]]
//        
//        let firstLetters = arrayToSort.map { $0.titleFirstLetter }
//        let uniqueFirstLetters = Array(Set(firstLetters))
//        
//        sortedFirstLetters = uniqueFirstLetters.sorted()
//        sections = sortedFirstLetters.map { firstLetter in
//            return arrayToSort
//                .filter { $0.titleFirstLetter == firstLetter }
//                .sorted { $0.name < $1.name }
//        }
//    }

    static func setLargeTitles(navigationBar: UINavigationBar, navigationItem: UINavigationItem, backButtonTitle: String){
        if #available(iOS 11.0, *) {
            navigationBar.prefersLargeTitles = true
            navigationBar.sizeToFit()

            navigationBar.largeTitleTextAttributes = [
                NSAttributedStringKey.foregroundColor: UIColor.white,
            ]
            
            navigationItem.backBarButtonItem?.title = backButtonTitle
            
        } else {
            // Fallback on earlier versions
        }
    }
    
    static func setDetailViewTitles(navigationItem: UINavigationItem){
        if #available(iOS 11.0, *) {
            navigationItem.largeTitleDisplayMode = .never
        } else {
            // Fallback on earlier versions
        }
    }
}
