//
//  ElixirViewController.swift
//  Recipe Slate
//
//  Created by Martin List on 15/03/2017.
//  Copyright © 2017 Martin List. All rights reserved.
//

import UIKit

class ElixirViewController: UITableViewController, UISearchResultsUpdating, UISearchBarDelegate {

    var elixirs:[Elixir] = elixirData
    var sortedFirstLetters: [String] = []
    var sections: [[Elixir]] = [[]]
    var selectedMaterial: Material?
    
    var filteredResults = [Elixir]()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set new large navigationbar titles
        Utility.setLargeTitles(navigationBar: navigationController!.navigationBar, navigationItem: navigationItem, backButtonTitle: "Elixirs")

        // Creating alphabetical sections.
        let firstLetters = elixirs.map { $0.titleFirstLetter }
        let uniqueFirstLetters = Array(Set(firstLetters))
        
        sortedFirstLetters = uniqueFirstLetters.sorted()
        sections = sortedFirstLetters.map { firstLetter in
            return elixirs
                .filter { $0.titleFirstLetter == firstLetter }
                .sorted { $0.name < $1.name }
        }
        
        // Hide about button, if necessary.
        if selectedMaterial != nil {
            navigationItem.rightBarButtonItem = nil
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "ElixirCell", for: indexPath)
        
        // Changing the selection color for a cell to a darker tone.
        let selectedView = UIView()
        selectedView.backgroundColor = UIColor(red: 54/255, green: 68/255, blue:     76/255, alpha: 1.0)
        cell.selectedBackgroundView = selectedView
   
        let elixir: Elixir = getCorrectCellItem(path: indexPath)
        
        if let nameLabel = cell.viewWithTag(100) as? UILabel {
            nameLabel.text = elixir.name
        }
        
        if let effectImage = cell.viewWithTag(101) as? UIImageView{
            effectImage.image = UIImage(named: elixir.effect)
        }
        
        return cell

    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let number = indexPath.row
        print(number)
        self.performSegue(withIdentifier: "showElixirDetail", sender: indexPath);
       
        // Prevent horrible bug.
        self.searchController.searchBar.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "showElixirDetail" {
            let destinatenViewController = segue.destination as! ElixirDetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow

            let selectedCell = getCorrectCellItem(path: indexPath!)

            destinatenViewController.elixirCell = selectedCell
            if selectedMaterial != nil {
                destinatenViewController.selectedMaterial = selectedMaterial
            }
            
            // Hiding tab bar, when in DetailViewController.
            destinatenViewController.hidesBottomBarWhenPushed = true
        }
    }

    // MARK: SearchController.
    func filterContentForSearchText(_ searchText: String){
        filteredResults = elixirs.filter { elixir in
            return elixir.name.lowercased().contains(searchText.lowercased())
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
    
    func getCorrectCellItem(path: IndexPath) -> Elixir{
        let elixir: Elixir
        if searchController.isActive {
            elixir = filteredResults[path.row]
        } else {
            elixir = sections[path.section][path.row]
        }
        return elixir
    }
}
