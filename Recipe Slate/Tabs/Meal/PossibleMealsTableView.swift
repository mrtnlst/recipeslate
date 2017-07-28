//
//  PossibleMealsTableView.swift
//  Recipe Slate
//
//  Created by martin on 16.07.17.
//  Copyright © 2017 Martin List. All rights reserved.
//

import Foundation
import UIKit

class PossibleMealsTableView: UITableViewController, UISearchResultsUpdating, UISearchBarDelegate {
    
    var chosenMaterial: Material?

    var meals:[Meal] = mealData
    var materials:[Material] = materialData
    var favorites: [String] = []
    var possibleMeals: [Meal] = []
    
    
    var sortedFirstLetters: [String] = []
    var sections: [[Meal]] = [[]]
    
    var filteredResults = [Meal]()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = chosenMaterial?.materialName
        
        // Setup refresh if item was favorites changed.
        NotificationCenter.default.addObserver(self, selector: #selector(PossibleMealsTableView.refreshTable(_:)), name: NSNotification.Name(rawValue: "refresh"), object: nil)
        
        // Gather the userDefaults of all favorites.
        fillFavoritesData()
        
        // Set background for space above search bar.
        tableView.backgroundView = UIView()
        searchController.searchBar.backgroundImage = UIImage()
        
        // Move searchbar benath navigationbar.
        let point = CGPoint(x: 0, y:(self.navigationController?.navigationBar.frame.size.height)!)
        self.tableView.setContentOffset(point, animated: true)
        
        findPossibleMeals()
        
        let firstLetters = possibleMeals.map { $0.titleFirstLetter }
        let uniqueFirstLetters = Array(Set(firstLetters))
        
        sortedFirstLetters = uniqueFirstLetters.sorted()
        sections = sortedFirstLetters.map { firstLetter in
            return possibleMeals
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
        
        // Show a star next to a favoritted item.
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
    
    func findPossibleMeals(){
        
        for meal in mealData{
            if meal.mainIngredients != nil {
                for mainIngredient in meal.mainIngredients!{
                    if mainIngredient == chosenMaterial?.materialName{
                        possibleMeals.append(meal)
                    }
                }
            }
            if meal.categoryIngredients != nil {
                for categoryIngredient in meal.categoryIngredients!{
                    for category in (chosenMaterial?.category)! {
                        if categoryIngredient == category{
                            possibleMeals.append(meal)
                        }
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
            destinatenViewController.selectedMaterial = chosenMaterial
            
            // Hiding tab bar, when in DetailViewController.
            destinatenViewController.hidesBottomBarWhenPushed = true
        }
        
    }
    
    // MARK: SearchController.
    func filterContentForSearchText(_ searchText: String){
        filteredResults = possibleMeals.filter { meal in
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
        let searchBarTextAttributes: [String : AnyObject] = [NSAttributedStringKey.foregroundColor.rawValue: UIColor.white]
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = searchBarTextAttributes
    }
    
    func oldSearch(){
        // Set background for space above search bar.
        tableView.backgroundView = UIView()
        searchController.searchBar.backgroundImage = UIImage()
        
        // Move searchbar benath navigationbar.
        let point = CGPoint(x: 0, y:(self.navigationController?.navigationBar.frame.size.height)!)
        self.tableView.setContentOffset(point, animated: true)
        
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
        let firstLetters = possibleMeals.map { $0.titleFirstLetter }
        let uniqueFirstLetters = Array(Set(firstLetters))
        
        sortedFirstLetters = uniqueFirstLetters.sorted()
        sections = sortedFirstLetters.map { firstLetter in
            return possibleMeals
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
