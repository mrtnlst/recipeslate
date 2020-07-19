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
        backgroundColor = .defaultBackground
        separatorColor = .clear
        autoresizingMask = .flexibleHeight
        translatesAutoresizingMaskIntoConstraints = false
        contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        register(DetailTitleCell.self, forCellReuseIdentifier: DetailTitleCell.identifier)
        register(DetailMealHeartCell.self, forCellReuseIdentifier: DetailMealHeartCell.identifier)
        register(DetailEffectCell.self, forCellReuseIdentifier: DetailEffectCell.identifier)
        register(DetailMealMainIngredientCell.self, forCellReuseIdentifier: DetailMealMainIngredientCell.identifier)
        register(DetailMealPickerCell.self, forCellReuseIdentifier: DetailMealPickerCell.identifier)
        register(DetailResaleCell.self, forCellReuseIdentifier: DetailResaleCell.identifier)
        register(DetailMaterialPotencyCell.self, forCellReuseIdentifier: DetailMaterialPotencyCell.identifier)
        register(DetailMaterialLocationCell.self, forCellReuseIdentifier: DetailMaterialLocationCell.identifier)
        register(DetailDishesCell.self, forCellReuseIdentifier: DetailDishesCell.identifier)
        register(DetailMaterialHeartCell.self, forCellReuseIdentifier: DetailMaterialHeartCell.identifier)
        register(DetailElixirPickerCell.self, forCellReuseIdentifier: DetailElixirPickerCell.identifier)
        register(DetailElixirPotencyCell.self, forCellReuseIdentifier: DetailElixirPotencyCell.identifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
