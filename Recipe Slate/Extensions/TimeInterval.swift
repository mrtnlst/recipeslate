//
//  TimeInterval.swift
//  Recipe Slate
//
//  Created by Martin List on 22.06.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import Foundation

extension TimeInterval {
    
    func durationToString() -> String {
        
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.allowedUnits = [ .minute, .second ]
        formatter.zeroFormattingBehavior = [ .pad ]
        
        var formattedDuration = formatter.string(from: self)
        formattedDuration?.append(" min")
        return formattedDuration!
    }
}
