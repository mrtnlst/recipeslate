//
//  DetailPickerView.swift
//  Recipe Slate
//
//  Created by Martin List on 21.06.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import UIKit

class DetailPickerView: UIPickerView {
    
    init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        
        if #available(iOS 14.0, *) {
            
        } else {
            subviews[1].backgroundColor = UIColor.init(white: 1.0, alpha: 0.2)
            subviews[2].backgroundColor = UIColor.init(white: 1.0, alpha: 0.2)
        }
    }
}
