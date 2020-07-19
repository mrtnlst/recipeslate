//
//  DetailViewController.swift
//  Recipe Slate
//
//  Created by Martin List on 13.06.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, FavoriteProtocol {
    
    var favoriteButton: UIButton!
    var item: Listable
    var tableView: DetailTableView = DetailTableView()
    var sections: [DetailTableViewSections] = []
    var filter: Material?
    
    init(item: Listable, sections: [DetailTableViewSections], filter: Material? = nil) {
        self.item = item
        self.sections = sections
        self.filter = filter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        title = item.name
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        setupFavoriteButton()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
        ])
    }
    
    func setupFavoriteButton() {
        let buttonImage = favorites.contains(where: { $0 == item.name }) ? "detail-favorite" : "detail-unfavorite"
        let barButton = UIBarButtonItem.barButton(with: buttonImage, target: self, selector: #selector(toggleFavorite))
        navigationItem.rightBarButtonItem = barButton
        favoriteButton = barButton.customView as? UIButton
    }
    
    @objc func toggleFavorite() {
        var favoriteArray = favorites
        
        if favorites.contains(where: { $0 == item.name }) {
            favoriteArray.removeAll(where: { $0 == item.name })
            favoriteButton.setImage(UIImage(named: "detail-unfavorite"), for: .normal)
        } else {
            favoriteArray.append(item.name)
            favoriteButton.setImage(UIImage(named: "detail-favorite"), for: .normal)
        }
        favoriteButton.imageView?.addBounceAnimation()
        UserDefaults.standard.set(favoriteArray, forKey: "favorites")
        NotificationCenter.default.post(name: .RecipeSlateFavoriteDidChange, object: nil, userInfo: nil)
    }
}

extension DetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].rawValue
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch sections[indexPath.section] {
        case .title, .elixirIngredientInfo:
            return configureTitleCell(tableView, indexPath: indexPath)
        case .heart:
            return configureMealHeartCell(tableView, indexPath: indexPath)
        case .effect:
            return configureEffectCell(tableView, indexPath: indexPath)
        case .resaleValue:
            return configureResaleCell(tableView, indexPath: indexPath)
        case .mainIngredient:
            return configureMealMainIngredientCell(tableView, indexPath: indexPath)
        case .categoryIngredient:
            return configureMealPickerCell(tableView, indexPath: indexPath)
        case .potency:
            return configureMaterialPotencyCell(tableView, indexPath: indexPath)
        case .location:
            return configureLocationCell(tableView, indexPath: indexPath)
        case .dishes:
            return configureDishesCell(tableView, indexPath: indexPath)
        case .heartList:
            return configureMaterialHeartCell(tableView, indexPath: indexPath)
        case .elixirIngredients:
            return configureElixirEffectCell(tableView, indexPath: indexPath)
        case .elixirPotency:
            return configureElixirPotencyCell(tableView, indexPath: indexPath)
        }
    }
    
    func configureTitleCell(_ tableView: UITableView, indexPath: IndexPath) -> DetailTitleCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailTitleCell.identifier,
                                                       for: indexPath) as? DetailTitleCell else { fatalError() }
        cell.setItem(item: item)
        return cell
    }
    
    func configureMealHeartCell(_ tableView: UITableView, indexPath: IndexPath) -> DetailMealHeartCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailMealHeartCell.identifier,
            
                                                       for: indexPath) as? DetailMealHeartCell else { fatalError() }
        cell.setItem(item)
        return cell
    }
    
    func configureEffectCell(_ tableView: UITableView, indexPath: IndexPath) -> DetailEffectCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailEffectCell.identifier,
                                                       for: indexPath) as? DetailEffectCell else { fatalError() }
        cell.setItem(item)
        return cell
    }
    
    func configureMealMainIngredientCell(_ tableView: UITableView, indexPath: IndexPath) -> DetailMealMainIngredientCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailMealMainIngredientCell.identifier,
                                                       for: indexPath) as? DetailMealMainIngredientCell else { fatalError() }
        cell.setItem(item)
        return cell
    }
    
    func configureMealPickerCell(_ tableView: UITableView, indexPath: IndexPath) -> DetailMealPickerCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailMealPickerCell.identifier,
                                                       for: indexPath) as? DetailMealPickerCell else { fatalError() }
        cell.setItem(item)
        cell.select(filter: filter)
        return cell
    }
    
    func configureResaleCell(_ tableView: UITableView, indexPath: IndexPath) -> DetailResaleCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailResaleCell.identifier,
                                                       for: indexPath) as? DetailResaleCell else { fatalError() }
        cell.setItem(item)
        return cell
    }
    
    func configureMaterialPotencyCell(_ tableView: UITableView, indexPath: IndexPath) -> DetailMaterialPotencyCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailMaterialPotencyCell.identifier,
                                                       for: indexPath) as? DetailMaterialPotencyCell else { fatalError() }
        if let material = item as? Material {
            cell.setPotency(EffectsHandler.calculatePossiblePotencies(for: material))
        }
        return cell
    }
    
    func configureLocationCell(_ tableView: UITableView, indexPath: IndexPath) -> DetailMaterialLocationCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailMaterialLocationCell.identifier,
                                                       for: indexPath) as? DetailMaterialLocationCell else { fatalError() }
        cell.setItem(item)
        return cell
    }
    
    func configureDishesCell(_ tableView: UITableView, indexPath: IndexPath) -> DetailDishesCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailDishesCell.identifier,
                                                       for: indexPath) as? DetailDishesCell else { fatalError() }
        cell.setItem(item)
        return cell
    }
    func configureMaterialHeartCell(_ tableView: UITableView, indexPath: IndexPath) -> DetailMaterialHeartCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailMaterialHeartCell.identifier,
                                                       for: indexPath) as? DetailMaterialHeartCell else { fatalError() }
        cell.setItem(item)
        return cell
    }
    func configureElixirEffectCell(_ tableView: UITableView, indexPath: IndexPath) -> DetailElixirPickerCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailElixirPickerCell.identifier,
                                                       for: indexPath) as? DetailElixirPickerCell else { fatalError() }
        cell.setItem(item)
        cell.select(filter: filter)
        return cell
    }
    
    func configureElixirPotencyCell(_ tableView: UITableView, indexPath: IndexPath) -> DetailElixirPotencyCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailElixirPotencyCell.identifier,
                                                       for: indexPath) as? DetailElixirPotencyCell else { fatalError() }
        cell.setItem(item)
        return cell
    }
}


extension DetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = sections[indexPath.section]
        
        if section == .categoryIngredient {
            return 100
        } else if section == .elixirIngredients {
           return 250
        }
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = .backgroundBlue

        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = .white
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if sections[indexPath.section] == .dishes {
            guard let material = item as? Material else { return }
            var viewController: UIViewController
            
            if material.isElixirIngredient && !material.hasDurationEffect {
                guard let elixir = elixirData.first(where: { $0.effect == material.effect?.type}) else { return }
                viewController = DetailViewController(item: elixir, sections: elixir.sections, filter: material)
            } else {
                let dataSource: DataSource = material.isElixirIngredient
                    ? ElixirListDataSource()
                    : MealListDataSource(with: material)
                viewController = ListViewController(dataSource: dataSource, filter: material)
                viewController.title = material.isElixirIngredient ? "Possible Elixirs" : "Possible Meals"
            }
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
