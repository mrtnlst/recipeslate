//
//  FavoritesViewController.swift
//  Recipe Slate
//
//  Created by martin on 12.04.17.
//  Copyright © 2017 Martin List. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController, UISearchResultsUpdating, UISearchBarDelegate {
    
    var favorites: [String] {
        UserDefaults.standard.object(forKey: "favorites") as? [String] ?? []
    }
    var meals: [Meal] {
        return mealData.filter({ favorites.contains($0.name) })
    }
    var sortedFirstLetters: [String] = []
    var sections: [[Meal]] = [[]]
    
    var filteredResults = [Meal]()
    let searchController = UISearchController(searchResultsController: nil)
    
    var tableView = ListTableView()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(FavoritesViewController.refreshTable(_:)),
                                               name: NSNotification.Name(rawValue: "refresh"), object: nil)
        
        setupViews()
        setupConstraints()
        createSections()
        setupSearch()
    }
    
    func setupViews() {
        title = "Favorites"
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
    
    func createSections() {
        let firstLetters = meals.map { $0.titleFirstLetter }
        let uniqueFirstLetters = Array(Set(firstLetters))
        
        sortedFirstLetters = uniqueFirstLetters.sorted()
        sections = sortedFirstLetters.map { firstLetter in
            return meals
                .filter { $0.titleFirstLetter == firstLetter }
                .sorted { $0.name < $1.name }
        }
    }
    
    @objc func refreshTable(_ notification: Notification) {
        createSections()
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func checkForMealEffect(meal: Meal) -> UIImage {
        var check = false
        
        let mainCheck = checkMainIngredients(meal: meal)
        if mainCheck == true {
            check = true
        }
        
        let categoryCheck = checkCategoryIngredients(meal: meal)
        if categoryCheck == true {
            check = true
        }
        
        if check {
            return UIImage(named: "Effect") ?? UIImage()
        } else {
            return UIImage(named: "fullHeart") ?? UIImage()

        }
    }
    
    func checkMainIngredients(meal: Meal) -> Bool{
        for ingredient in meal.mainIngredients {
            guard let material = materialData.first(where: { $0.name == ingredient }) else { continue }
            if material.effect?.type != .duration {
                return true
            }
        }
        return false
    }
    
    func checkCategoryIngredients(meal: Meal) -> Bool{
        
        for ingredient in meal.categoryIngredients {
            guard let material = materialData.first(where: { (material) -> Bool in
                return material.category.first(where: { ingredient == $0 }) != nil && material.effect?.type != .duration
            }) else { continue }
            if material.effect?.type != .duration {
                return true
            }
        }
        return false
    }
    
    // MARK: SearchController.
    func filterContentForSearchText(_ searchText: String){
        filteredResults = meals.filter { meal in
            return meal.name.lowercased().contains(searchText.lowercased())
        }
        tableView.reloadData()
    }
    
    func setupSearch() {
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        searchController.searchBar.tintColor = UIColor.white
        searchController.searchBar.keyboardAppearance = UIKeyboardAppearance.dark
        
        // Set input text to white color in search field.
        let searchBarTextAttributes: [NSAttributedString.Key : AnyObject] = [NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue): UIColor.white]
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = searchBarTextAttributes
    }
    
    public func updateSearchResults(for searchController: UISearchController){
        let searchBar = searchController.searchBar
        // Set light statusbar theme.
        setNeedsStatusBarAppearanceUpdate()
        
        print("*updateSearchResults - \(String(describing: searchBar.text))")
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    func getCorrectCellItem(path: IndexPath) -> ItemPresentable {
        return searchController.isActive ? filteredResults[path.row] : sections[path.section][path.row]
    }
}

extension FavoritesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if searchController.isActive {
            return ""
        }
        return sortedFirstLetters[section]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sortedFirstLetters
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if searchController.isActive {
            return 1
        }
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive {
            return filteredResults.count
        }
        return sections[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ElementTableViewCell.identifier,
                                                       for: indexPath) as? ElementTableViewCell else { fatalError() }
        
        let item = getCorrectCellItem(path: indexPath)
        cell.label.text = item.name
        if let meal = item as? Meal {
            cell.icon.image = checkForMealEffect(meal: meal)
        }
        return cell
    }
}

extension FavoritesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = .tableHeaderViewColor

        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = .white
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        let item = getCorrectCellItem(path: indexPath)
        let detailVC = DetailViewController(item: item)
        detailVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(detailVC, animated: true)
        
        // Prevent horrible bug.
        self.searchController.searchBar.endEditing(true)
    }
}
