//
//  FoodViewController.swift
//  Recipe Slate
//
//  Created by Martin List on 17/03/2017.
//  Copyright © 2017 Martin List. All rights reserved.
//

import UIKit

class MaterialViewController: UITableViewController, UISearchResultsUpdating, UISearchBarDelegate {

    var materials:[Material] = materialData
    var sortedFirstLetters: [String] = []
    var sections: [[Material]] = [[]]
    
    var filteredResults = [Material]()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set new large navigationbar titles
        Utility.setLargeTitles(navigationBar: navigationController!.navigationBar, navigationItem: navigationItem, backButtonTitle: "Materials")

        // Creating alphabetical sections.
        let firstLetters = materials.map { $0.titleFirstLetter }
        let uniqueFirstLetters = Array(Set(firstLetters))
        
        sortedFirstLetters = uniqueFirstLetters.sorted()
        sections = sortedFirstLetters.map { firstLetter in
            return materials
                .filter { $0.titleFirstLetter == firstLetter }
                .sorted { $0.materialName < $1.materialName }
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "MaterialCell", for: indexPath)
        
        // Changing the selection color for a cell to a darker tone.
        let selectedView = UIView()
        selectedView.backgroundColor = UIColor(red: 54/255, green: 68/255, blue:     76/255, alpha: 1.0)
        cell.selectedBackgroundView = selectedView
        
        let material = getCorrectCellItem(path: indexPath)
        
        if let nameLabel = cell.viewWithTag(100) as? UILabel {
            nameLabel.text = material.materialName
        }
        
        // Resetting image views.
        if let effectImage = cell.viewWithTag(107) as? UIImageView{
            effectImage.image = .none
        }
        
        // Set effect or hearts image on the right side.
        if material.effect != nil && material.effect?.effectName != "Duration"{
            if let effect = cell.viewWithTag(107) as? UIImageView{
                effect.image = UIImage(named: (material.effect?.effectName)!)
            }
        }
        else if material.hearts != nil {
            if let effect = cell.viewWithTag(107) as? UIImageView{
                effect.image = UIImage(named: "fullHeart")
            }
        }
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let number = indexPath.row
        print(number)
        self.performSegue(withIdentifier: "showDetail", sender: indexPath);
        
        // Prevent horrible bug.
        self.searchController.searchBar.endEditing(true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let destinatenViewController = segue.destination as! MaterialDetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow

            let selectedCell = getCorrectCellItem(path: indexPath!)
            destinatenViewController.materialCell = selectedCell
            
            // Hiding tab bar, when in DetailViewController.
            destinatenViewController.hidesBottomBarWhenPushed = true
        }
    }
    
    // MARK: SearchController.
    func filterContentForSearchText(_ searchText: String){
        filteredResults = materials.filter { material in
            return material.materialName.lowercased().contains(searchText.lowercased())
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
        
        // Correct color for cancel button and cursor.
        searchController.searchBar.tintColor = UIColor.black
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor:UIColor.white], for: UIControlState.normal)
        
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
    
    func getCorrectCellItem(path: IndexPath) -> Material{
        let material: Material
        if searchController.isActive {
            material = filteredResults[path.row]
        } else {
            material = sections[path.section][path.row]
        }
        return material
    }
}
