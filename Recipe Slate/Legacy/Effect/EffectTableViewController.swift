//
//  EffectTableViewController.swift
//  Recipe Slate
//
//  Created by martin on 19.04.17.
//  Copyright © 2017 Martin List. All rights reserved.
//

import UIKit

class EffectTableViewController: UITableViewController, UISearchResultsUpdating, UISearchBarDelegate {

    var effectCell: Effect?
    
    var meals:[Meal] = mealData
    var materials:[Material] = materialData
    var effect:[Meal] = []
    var favorites: [String] = []

    
    var sortedFirstLetters: [String] = []
    var sections: [[Meal]] = [[]]
    
    var filteredResults = [Meal]()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = effectCell?.type.rawValue
        
        // Setup refresh if item was favorites changed.
        NotificationCenter.default.addObserver(self, selector: #selector(EffectTableViewController.refreshTable(_:)), name: NSNotification.Name(rawValue: "refresh"), object: nil)
        
        // Gather the userDefaults of all favorites.
        fillFavoritesData()

        // Set new large navigationbar titles
        Utility.setDetailViewTitles(navigationItem: navigationItem)
        navigationItem.backBarButtonItem?.title = effectCell?.type.rawValue

        findEffectInMeals()
        
        let firstLetters = effect.map { $0.titleFirstLetter }
        let uniqueFirstLetters = Array(Set(firstLetters))
        
        sortedFirstLetters = uniqueFirstLetters.sorted()
        sections = sortedFirstLetters.map { firstLetter in
            return effect
                .filter { $0.titleFirstLetter == firstLetter }
                .sorted { $0.name < $1.name }
        }
        
        //Setting up searchBar.
        if #available(iOS 11.0, *) {
            navigationItem.searchController = searchController
            setupSearch()
        }
        else {
            oldSearch()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if searchController.isActive {
            return ""
        }
        return sortedFirstLetters[section]
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sortedFirstLetters
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        if searchController.isActive {
            return 1
        }
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive {
            return filteredResults.count
        }
        return sections[section].count
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        // Customizing the color of the section headers.
        (view as! UITableViewHeaderFooterView).backgroundView?.backgroundColor = UIColor(red: 35/255, green: 43/255, blue: 49/255, alpha: 1.0)
        (view as! UITableViewHeaderFooterView).textLabel?.textColor = UIColor.white
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealCell", for: indexPath)
        
        // Changing the selection color for a cell to a darker tone.
        let selectedView = UIView()
        selectedView.backgroundColor = UIColor(red: 54/255, green: 68/255, blue:     76/255, alpha: 1.0)
        cell.selectedBackgroundView = selectedView
        
        let effect: Meal = getCorrectCellItem(path: indexPath)
        
        // Resetting imageView.
        if let starImage = cell.viewWithTag(102) as? UIImageView{
            starImage.image = .none
        }
        
        // Show a star next to a favorited item.
        if isItemAFavorite(name: effect.name){
            if let starImage = cell.viewWithTag(102) as? UIImageView{
                starImage.image = UIImage(named: "Favorite")
            }
        }
        
        if let nameLabel = cell.viewWithTag(100) as? UILabel {
            nameLabel.text = effect.name
        }
        
        return cell
    }
    
    func findEffectInMeals(){
        
        for meal in mealData{
            var status = 0
            
            if meal.name == "Creamy Heart Soup"{
                status = 3
            }
            else {
                status = findMainIngredientWithChosenEffect(meal: meal)
            }
            
            // Status 0, 2 means you have to check category ingredients for effects.
            // Status 1, 3 means, that there already is the effect in main ingredient or it cancels each other out.
            switch status{
                case 0, 2:
                    findEffectInCategoryIngredients(meal: meal)
                case 1, 3: break
                default: break
            }
        }
    }
    
    func findMainIngredientWithChosenEffect(meal: Meal) -> Int{
        // First bool for ingredient matched, second for same effect name.
        var status:Int = 0
    
        for mainIngredient in meal.mainIngredients {
            for material in materialData {
                
                if mainIngredient == material.name {
                    
                    if material.effect?.type == effectCell?.type {
                        effect.append(meal)
                        status = 1
                    }
                    else if material.effect?.type == .duration{
                        status = 2
                    }
                    else {
                        status = 3
                    }
                }
            }
        }

        return status
    }
    
    func findEffectInCategoryIngredients(meal: Meal){
        for categoryIngredient in meal.categoryIngredients{
            for material in materialData{
                for category in material.category{
                    if categoryIngredient == category && material.effect?.type == effectCell?.type {
                        effect.append(meal)
                        return
                    }
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let number = indexPath.row
        print(number)
        self.performSegue(withIdentifier: "showMealDetail", sender: indexPath);
        
        // Prevent horrible bug.
        self.searchController.searchBar.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMealDetail" {
            let destinatenViewController = segue.destination as! MealDetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow
            let selectedCell = getCorrectCellItem(path: indexPath!)
            destinatenViewController.mealCell = selectedCell
            destinatenViewController.selectedEffect = effectCell?.type
            
            // Hiding tab bar, when in DetailViewController.
            destinatenViewController.hidesBottomBarWhenPushed = true
        }
        
    }
    
    // MARK: SearchController.
    func filterContentForSearchText(_ searchText: String){
        filteredResults = effect.filter { meal in
            return meal.name.lowercased().contains(searchText.lowercased())
        }
        tableView.reloadData()
    }
    
    func setupSearch(){
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
    
    func oldSearch(){
        // Set background for space above search bar.
        tableView.backgroundView = UIView()
        searchController.searchBar.backgroundImage = UIImage()
        
        // Move searchbar benath navigationbar.
        let point = CGPoint(x: 0, y:(self.navigationController?.navigationBar.frame.size.height)!)
        self.tableView.setContentOffset(point, animated: true)
        
        // Correct color for cancel button and cursor.
        searchController.searchBar.tintColor = UIColor.black
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor.white], for: UIControl.State.normal)
        
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.keyboardAppearance = UIKeyboardAppearance.dark
        self.searchController.searchBar.endEditing(false)
    }
    
    public func updateSearchResults(for searchController: UISearchController){
        let searchBar = searchController.searchBar
        
        // Set light statusbar theme.
        setNeedsStatusBarAppearanceUpdate()
        
        print("*updateSearchResults - \(String(describing: searchBar.text))")
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    func getCorrectCellItem(path: IndexPath) -> Meal{
        let meal: Meal
        if searchController.isActive {
            meal = filteredResults[path.row]
        } else {
            meal = sections[path.section][path.row]
        }
        return meal
    }

    func isItemAFavorite(name: String) -> Bool{
        for item in favorites{
            if item == name{
                return true
            }
        }
        return false
    }
    
    @objc func refreshTable(_ notification: Notification) {
        
        print("Received Notification")
        
        fillFavoritesData()
        
        // Creating alphabetical sections.
        let firstLetters = effect.map { $0.titleFirstLetter }
        let uniqueFirstLetters = Array(Set(firstLetters))
        
        sortedFirstLetters = uniqueFirstLetters.sorted()
        sections = sortedFirstLetters.map { firstLetter in
            return effect
                .filter { $0.titleFirstLetter == firstLetter }
                .sorted { $0.name < $1.name }
        }
        tableView.reloadData()
    }
    
    func fillFavoritesData(){
        
        let defaults = UserDefaults.standard
        if let favoritesDefaults = defaults.object(forKey: "favorites"){
            favorites = favoritesDefaults as! [String]
        }
    }
}