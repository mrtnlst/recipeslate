//
//  DetailViewController.swift
//  Recipe Slate
//
//  Created by Martin List on 13.06.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var tableView: DetailTableView = DetailTableView()
    var item: ItemPresentable
    var favorites: [String] {
        UserDefaults.standard.object(forKey: "favorites") as? [String] ?? []
    }
    
    init(item: ItemPresentable) {
        self.item = item
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
        switch section {
        case 0:
            return "Name"
        case 1:
            return "Hearts"
        default:
            return ""
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
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
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailHeartsCell.identifier,
                                                           for: indexPath) as? DetailHeartsCell else { fatalError() }
            if let meal = item as? Meal {
                cell.setHearts(EffectsHandler.calculateHearts(for: meal))
            }
            return cell
        default:
            fatalError()
        }
    }
    
}

extension DetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = .backgroundBlue

        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.init(white: 1.0, alpha: 0.6)
        header.textLabel?.font = UIFont.systemFont(ofSize: 12, weight: .medium)
    }
    
}
