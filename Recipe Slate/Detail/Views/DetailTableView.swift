//
//  DetailTableView.swift
//  Recipe Slate
//
//  Created by Martin List on 13.06.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import UIKit

class DetailTableView: UITableView {

    init() {
        super.init(frame: .zero, style: .plain)
        backgroundColor = .backgroundBlue
        separatorColor = .clear
        autoresizingMask = .flexibleHeight
        translatesAutoresizingMaskIntoConstraints = false
        register(DetailTitleCell.self, forCellReuseIdentifier: DetailTitleCell.identifier)
        register(DetailHeartCell.self, forCellReuseIdentifier: DetailHeartCell.identifier)
        register(DetailEffectCell.self, forCellReuseIdentifier: DetailEffectCell.identifier)
        register(DetailMainIngredientCell.self, forCellReuseIdentifier: DetailMainIngredientCell.identifier)
        register(DetailCategoryIngredientCell.self, forCellReuseIdentifier: DetailCategoryIngredientCell.identifier)
        register(DetailResaleCell.self, forCellReuseIdentifier: DetailResaleCell.identifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
