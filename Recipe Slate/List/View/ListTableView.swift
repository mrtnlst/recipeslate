//
//  ListTableView.swift
//  Recipe Slate
//
//  Created by Martin List on 13.06.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import UIKit

class ListTableView: UITableView {

    init() {
        super.init(frame: .zero, style: .plain)
        backgroundColor = .defaultBackground
        separatorColor = .seperatorColor
        sectionIndexColor = .white
        keyboardDismissMode = .interactive
        autoresizingMask = .flexibleHeight
        translatesAutoresizingMaskIntoConstraints = false
        register(ElementTableViewCell.self, forCellReuseIdentifier: ElementTableViewCell.identifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
