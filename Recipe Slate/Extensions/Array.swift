//
//  Array.swift
//  Recipe Slate
//
//  Created by Martin List on 18.06.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import Foundation

extension Array {

    func item(at index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
