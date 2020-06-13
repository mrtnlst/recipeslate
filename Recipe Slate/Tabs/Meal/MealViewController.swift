//
//  MealViewController.swift
//  Recipe Slate
//
//  Created by Martin List on 14/03/2017.
//  Copyright © 2017 Martin List. All rights reserved.
//

import UIKit

class MealViewController: UITableViewController, UISearchResultsUpdating, UISearchBarDelegate {
    
    var meals:[Meal] = mealData
    var sortedFirstLetters: [String] = []
    var sections: [[Meal]] = [[]]
    var favorites: [String] = []
    
    var filteredResults = [Meal]()
    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup refresh if item was favorites changed.
         NotificationCenter.default.addObserver(self, selector: #selector(MealViewController.refreshTable(_:)), name: NSNotification.Name(rawValue: "refresh"), object: nil)
        
        // Gather the userDefaults of all favorites.
        fillFavoritesData()

        // Set new large navigationbar titles
        Utility.setLargeTitles(navigationBar: navigationController!.navigationBar, navigationItem: navigationItem, backButtonTitle: "Meals")
        
        // Creating alphabetical sections.
        let firstLetters = meals.map { $0.titleFirstLetter }
        let uniqueFirstLetters = Array(Set(firstLetters))
        
        sortedFirstLetters = uniqueFirstLetters.sorted()
        sections = sortedFirstLetters.map { firstLetter in
            return meals
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
        
        let meal: Meal = getCorrectCellItem(path: indexPath)
       
        if let nameLabel = cell.viewWithTag(100) as? UILabel {
            nameLabel.text = meal.name
        }
        
        // Resetting imageViews.
        if let heartsImage = cell.viewWithTag(101) as? UIImageView{
            heartsImage.image = .none
        }
        if let starImage = cell.viewWithTag(102) as? UIImageView{
            starImage.image = .none
        }
        
        // Show a star next to a favoritted item.
        if isItemAFavorite(name: meal.name){
            if let starImage = cell.viewWithTag(102) as? UIImageView{
                starImage.image = UIImage(named: "Favorite")
            }
        }
        
        //Setting the image for fullHeart.
        if let heartsRestoredImage = cell.viewWithTag(101) as? UIImageView{
            let check = checkForMealEffect(meal: meal)
            if check == true {
                heartsRestoredImage.image = UIImage(named: "Effect")
            }
            else {
                heartsRestoredImage.image = UIImage(named: "fullHeart")
            }
        }
        return cell
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

            // Hiding tab bar, when in DetailViewController.
            destinatenViewController.hidesBottomBarWhenPushed = true
        }
    }
    
    func checkForMealEffect(meal: Meal) -> Bool{
        var check = false
        
        let mainCheck = checkMainIngredients(meal: meal)
        if mainCheck == true{
            check = true
        }
        
        let categoryCheck = checkCategoryIngredients(meal: meal)
        if categoryCheck == true {
            check = true
        }
        return check
    }
    
    func checkMainIngredients(meal: Meal) -> Bool{
        var check = false
        
        for mainIngredient in meal.mainIngredients {
            for material in materialData {
                if mainIngredient == material.name {
                    if material.effect?.type != .duration {
                        check = true
                    }
                }
            }
        }
        return check
    }
    
    func checkCategoryIngredients(meal: Meal) -> Bool{
        var check = false
        
        for categoryIngredient in meal.categoryIngredients{
            for material in materialData{
                for category in material.category{
                    if categoryIngredient == category && material.effect?.type != .duration{
                        check = true
                    }
                }
            }
        }
        return check
    }
    
    // MARK: SearchController.
    func filterContentForSearchText(_ searchText: String){
        filteredResults = meals.filter { meal in
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
        let firstLetters = meals.map { $0.titleFirstLetter }
        let uniqueFirstLetters = Array(Set(firstLetters))
        
        sortedFirstLetters = uniqueFirstLetters.sorted()
        sections = sortedFirstLetters.map { firstLetter in
            return meals
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setPlaceholderColor(textField: UITextField, placeholderText: String) {
        textField.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
    }
}
