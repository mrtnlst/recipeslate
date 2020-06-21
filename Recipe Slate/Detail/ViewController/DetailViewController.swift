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
    
    init(item: Listable, sections: [DetailTableViewSections]) {
        self.item = item
        self.sections = sections
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
        let image = favorites.contains(where: { $0 == item.name })
            ? UIImage(named: "detail-favorite")
            : UIImage(named: "detail-unfavorite")
       
        favoriteButton = UIButton(type: .system)
        favoriteButton.addTarget(self, action: #selector(toggleFavorite), for: .touchUpInside)
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        favoriteButton.setImage(image, for: .normal)
        
        let barButton = UIBarButtonItem(customView: favoriteButton)
        
        NSLayoutConstraint.activate([
            favoriteButton.heightAnchor.constraint(equalToConstant: 32),
            favoriteButton.widthAnchor.constraint(equalToConstant: 32),
        ])
        
        navigationItem.rightBarButtonItem = barButton
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
        case .title:
            return configureTitleCell(tableView, indexPath: indexPath)
        case .heart:
            return configureHeartCell(tableView, indexPath: indexPath)
        case .effect:
            return configureEffectCell(tableView, indexPath: indexPath)
        case .resaleValue:
            return configureResaleCell(tableView, indexPath: indexPath)
        case .mainIngredient:
            return configureMainIngredientCell(tableView, indexPath: indexPath)
        case .categoryIngredient:
            return configureCategoryIngredientCell(tableView, indexPath: indexPath)
        case .potency:
            return configurePotencyCell(tableView, indexPath: indexPath)
        case .location:
            return configureLocationCell(tableView, indexPath: indexPath)
        }
    }
    
    func configureTitleCell(_ tableView: UITableView, indexPath: IndexPath) -> DetailTitleCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailTitleCell.identifier,
                                                       for: indexPath) as? DetailTitleCell else { fatalError() }
        cell.title.text = item.name
    
        return cell
    }
    
    func configureHeartCell(_ tableView: UITableView, indexPath: IndexPath) -> DetailHeartCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailHeartCell.identifier,
            
                                                       for: indexPath) as? DetailHeartCell else { fatalError() }
        cell.setItem(item)

        return cell
    }
    
    func configureEffectCell(_ tableView: UITableView, indexPath: IndexPath) -> DetailEffectCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailEffectCell.identifier,
                                                       for: indexPath) as? DetailEffectCell else { fatalError() }
        cell.setItem(item)
        return cell
    }
    
    func configureMainIngredientCell(_ tableView: UITableView, indexPath: IndexPath) -> DetailMainIngredientCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailMainIngredientCell.identifier,
                                                       for: indexPath) as? DetailMainIngredientCell else { fatalError() }
        if let meal = item as? Meal {
            cell.setIngredients(meal.mainIngredients)
        }
        return cell
    }
    
    func configureCategoryIngredientCell(_ tableView: UITableView, indexPath: IndexPath) -> DetailCategoryIngredientCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailCategoryIngredientCell.identifier,
                                                       for: indexPath) as? DetailCategoryIngredientCell else { fatalError() }
        if let meal = item as? Meal {
            let c1 = materialData.filter({ $0.category.contains(where: { meal.categoryIngredients.first == $0 }) })
            cell.configurePicker(.first, data: c1)
            if meal.categoryIngredients.count > 1 {
                let c2 = materialData.filter({ $0.category.contains(where: { meal.categoryIngredients.last == $0 }) })
                cell.configurePicker(.second, data: c2)
            }
        }
        return cell
    }
    
    func configureResaleCell(_ tableView: UITableView, indexPath: IndexPath) -> DetailResaleCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailResaleCell.identifier,
                                                       for: indexPath) as? DetailResaleCell else { fatalError() }
        cell.setItem(item)
        return cell
    }
    
    func configurePotencyCell(_ tableView: UITableView, indexPath: IndexPath) -> DetailPotencyCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailPotencyCell.identifier,
                                                       for: indexPath) as? DetailPotencyCell else { fatalError() }
        if let material = item as? Material {
            cell.setPotency(EffectsHandler.calculatePotency(for: material))
        }
        
        return cell
    }
    
    func configureLocationCell(_ tableView: UITableView, indexPath: IndexPath) -> DetailLocationCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailLocationCell.identifier,
                                                       for: indexPath) as? DetailLocationCell else { fatalError() }
        cell.setItem(item)
        return cell
    }
}


extension DetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if sections[indexPath.section] == .categoryIngredient {
            return 100
        }
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = .backgroundBlue

        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = .white
    }
    
}
