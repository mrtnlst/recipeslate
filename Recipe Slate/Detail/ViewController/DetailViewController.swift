//
//  DetailViewController.swift
//  Recipe Slate
//
//  Created by Martin List on 13.06.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, FavoriteProtocol {
    
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
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
        ])
    }
    
    @objc func toggleFavorite() {
        let cell = tableView.visibleCells.first(where: { $0.reuseIdentifier == DetailTitleCell.identifier }) as? DetailTitleCell
        var favoriteArray = favorites
        
        if favorites.contains(where: { $0 == item.name }) {
            favoriteArray.removeAll(where: { $0 == item.name })
            cell?.setFavoriteState(.none)
        } else {
            favoriteArray.append(item.name)
            cell?.setFavoriteState(.favorite)
        }
        UserDefaults.standard.set(favoriteArray, forKey: "favorites")
        NotificationCenter.default.post(name: Notification.Name(rawValue: "refresh"), object: nil, userInfo: nil)
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
            return configureTitleCell(tableView, indexPath: indexPath, with: item)
        case .heart:
            return configureHeartCell(tableView, indexPath: indexPath, with: item)
        case .effect:
            return configureEffectCell(tableView, indexPath: indexPath, with: item)
        case .resaleValue:
            return configureResaleCell(tableView, indexPath: indexPath, with: item)
        case .mainIngredient:
            return configureMainIngredientCell(tableView, indexPath: indexPath, with: item)
        case .categoryIngredient:
            return configureCategoryIngredientCell(tableView, indexPath: indexPath, with: item)
        }
    }
    
    func configureTitleCell(_ tableView: UITableView, indexPath: IndexPath, with item: Listable) -> DetailTitleCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailTitleCell.identifier,
                                                       for: indexPath) as? DetailTitleCell else { fatalError() }
        cell.title.text = item.name
        
        if let meal = item as? Meal {
            if favorites.contains(where: { $0 == meal.name }) {
                cell.setFavoriteState(.favorite)
            }
            cell.button.addTarget(self, action: #selector(toggleFavorite), for: .touchUpInside)
        }
        return cell
    }
    
    func configureHeartCell(_ tableView: UITableView, indexPath: IndexPath, with item: Listable) -> DetailHeartCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailHeartCell.identifier,
            
                                                       for: indexPath) as? DetailHeartCell else { fatalError() }
        cell.setItem(item)

        return cell
    }
    
    func configureEffectCell(_ tableView: UITableView, indexPath: IndexPath, with item: Listable) -> DetailEffectCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailEffectCell.identifier,
                                                       for: indexPath) as? DetailEffectCell else { fatalError() }
        cell.setItem(item)
        return cell
    }
    
    func configureMainIngredientCell(_ tableView: UITableView, indexPath: IndexPath, with item: Listable) -> DetailMainIngredientCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailMainIngredientCell.identifier,
                                                       for: indexPath) as? DetailMainIngredientCell else { fatalError() }
        if let meal = item as? Meal {
            cell.setIngredients(meal.mainIngredients)
        }
        return cell
    }
    
    func configureCategoryIngredientCell(_ tableView: UITableView, indexPath: IndexPath, with item: Listable) -> DetailCategoryIngredientCell {
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
    
    func configureResaleCell(_ tableView: UITableView, indexPath: IndexPath, with item: Listable) -> DetailResaleCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailResaleCell.identifier,
                                                       for: indexPath) as? DetailResaleCell else { fatalError() }
        cell.setItem(item)
        return cell
    }
}


extension DetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = .backgroundBlue

        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = .white
    }
    
}
