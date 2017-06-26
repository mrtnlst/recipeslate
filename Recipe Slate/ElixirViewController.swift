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
    
    var filteredResults = [Elixir]()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set background for space above search bar.
        tableView.backgroundView = UIView()
        searchController.searchBar.backgroundImage = UIImage()
        
        // Move searchbar benath navigationbar.
        let point = CGPoint(x: 0, y:(self.navigationController?.navigationBar.frame.size.height)!)
        self.tableView.setContentOffset(point, animated: true)
        
        // Creating alphabetical sections.
        let firstLetters = elixirs.map { $0.titleFirstLetter }
        let uniqueFirstLetters = Array(Set(firstLetters))
        
        sortedFirstLetters = uniqueFirstLetters.sorted()
        sections = sortedFirstLetters.map { firstLetter in
            return elixirs
                .filter { $0.titleFirstLetter == firstLetter }
                .sorted { $0.name < $1.name }
        }

        setupSearchVC()
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
   
//        let elixir = sections[indexPath.section][indexPath.row]
        let elixir: Elixir = getCorrectCellItem(path: indexPath)
        
        if let nameLabel = cell.viewWithTag(100) as? UILabel {
            nameLabel.text = elixir.name
        }
        
        // Setting name.
        //cell.detailTextLabel?.text = elixir.effect
        
        // Resetting imageView.
//        if let effectImage = cell.viewWithTag(101) as? UIImageView{
//            effectImage.image = .none
//        }
        
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
//        self.searchController.isActive = false

        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showElixirDetail" {
            let destinatenViewController = segue.destination as! ElixirDetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow

            let selectedCell = getCorrectCellItem(path: indexPath!)

//            let selectedCell = sections[(indexPath?.section)!][(indexPath?.row)!]
            destinatenViewController.elixirCell = selectedCell
            
            // Hiding tab bar, when in DetailViewController.
            destinatenViewController.hidesBottomBarWhenPushed = true
        }
        
    }

    // MARK: SearchController.
    func filterContentForSearchText(_ searchText: String)
    {
        filteredResults = elixirs.filter { elixir in
            return elixir.name.lowercased().contains(searchText.lowercased())
        }
        tableView.reloadData()
    }
    
    func setupSearchVC()
    {
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.keyboardAppearance = UIKeyboardAppearance.dark
    }
    
    public func updateSearchResults(for searchController: UISearchController)
    {
        let searchBar = searchController.searchBar
        
        // Set light statusbar theme.
        setNeedsStatusBarAppearanceUpdate()
        
        print("*updateSearchResults - \(String(describing: searchBar.text))")
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    func getCorrectCellItem(path: IndexPath) -> Elixir
    {
        let elixir: Elixir
        if searchController.isActive {
            elixir = filteredResults[path.row]
        } else {
            elixir = sections[path.section][path.row]
        }
        return elixir
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
}
