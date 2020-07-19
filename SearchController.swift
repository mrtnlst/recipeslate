//
//  SearchController.swift
//  Recipe Slate
//
//  Created by Martin List on 19.07.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import UIKit

class SearchController: UISearchController {
    
    init() {
        super.init(searchResultsController: nil)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        obscuresBackgroundDuringPresentation = false
        hidesNavigationBarDuringPresentation = true
        
        searchBar.keyboardAppearance = .dark
        searchBar.searchTextField.leftView?.tintColor = .white
        searchBar.barStyle = .black
        searchBar.searchTextField.backgroundColor = #colorLiteral(red: 0.01713882573, green: 0.3089093566, blue: 0.4661796689, alpha: 1)
        searchBar.searchTextField.tintColor = .white
        
        let clear = UIImage(systemName: "xmark.circle.fill")
        searchBar.setImage(clear, for: .clear, state: .normal)
        
        let placeholderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)
        let placeholderAttributes = [NSAttributedString.Key.foregroundColor : placeholderColor]
        let attributedPlaceholder = NSAttributedString(string: "Search", attributes: placeholderAttributes)
        searchBar.searchTextField.attributedPlaceholder = attributedPlaceholder
    }
}
