//
//  SegmentedControl.swift
//  Recipe Slate
//
//  Created by Martin List on 16.07.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import UIKit

class SegmentedControl: UISegmentedControl {

    // MARK: - Life cycle
    
    init() {
        super.init(frame: .zero)
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UI

    private func configureViews() {
        insertSegment(withTitle: "ABC", at: 0, animated: false)
        insertSegment(withTitle: "Effect", at: 1, animated: false)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .defaultBackground
        selectedSegmentTintColor = .segmentedControlViewColor
        selectedSegmentIndex = 0
        
        setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .normal)
        setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .selected)
    }

}

