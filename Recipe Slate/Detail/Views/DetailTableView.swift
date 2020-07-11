//
//  DetailTableView.swift
//  Recipe Slate
//
//  Created by Martin List on 13.06.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import UIKit

enum DetailTableViewSections: String {
    case title = "NAME"
    case heart = "HEARTS"
    case effect = "EFFECT"
    case resaleValue = "RESALE VALUE"
    case mainIngredient = "MAIN INGREDIENTS"
    case categoryIngredient = "CATEGORY INGREDIENTS"
    case potency = "POTENCY"
    case location = "LOCATION"
    case dishes = "POSSIBLE DISHES"
    case heartList = "HEART VALUES"
    case elixirIngredientInfo = "COOKING INFO"
    case elixirIngredients = "POSSIBLE INGREDIENTS"
    case elixirPotency = "POTENCY LEVEL"
}

class DetailTableView: UITableView {

    init() {
        super.init(frame: .zero, style: .plain)
        backgroundColor = .backgroundBlue
        separatorColor = .clear
        autoresizingMask = .flexibleHeight
        translatesAutoresizingMaskIntoConstraints = false
        contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        register(DetailTitleCell.self, forCellReuseIdentifier: DetailTitleCell.identifier)
        register(DetailHeartCell.self, forCellReuseIdentifier: DetailHeartCell.identifier)
        register(DetailEffectCell.self, forCellReuseIdentifier: DetailEffectCell.identifier)
        register(DetailIconTextListCell.self, forCellReuseIdentifier: DetailIconTextListCell.identifier)
        register(DetailMealPickerCell.self, forCellReuseIdentifier: DetailMealPickerCell.identifier)
        register(DetailResaleCell.self, forCellReuseIdentifier: DetailResaleCell.identifier)
        register(DetailPotencyCell.self, forCellReuseIdentifier: DetailPotencyCell.identifier)
        register(DetailLocationCell.self, forCellReuseIdentifier: DetailLocationCell.identifier)
        register(DetailDishesCell.self, forCellReuseIdentifier: DetailDishesCell.identifier)
        register(DetailHeartListCell.self, forCellReuseIdentifier: DetailHeartListCell.identifier)
        register(DetailElixirPickerCell.self, forCellReuseIdentifier: DetailElixirPickerCell.identifier)
        register(DetailElixirPotencyCell.self, forCellReuseIdentifier: DetailElixirPotencyCell.identifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
