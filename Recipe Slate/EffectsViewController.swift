//
//  EffectsViewController.swift
//
//  Created by martin on 02.04.17.
//  Copyright © 2017 Martin List. All rights reserved.
//

import UIKit

class EffectsViewController: UITableViewController, UISearchResultsUpdating, UISearchBarDelegate {

    var effects:[Effect] = effectData
    var sortedFirstLetters: [String] = []
    var sections: [[Effect]] = [[]]
    
    var filteredResults = [Effect]()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set background for space above search bar.
        tableView.backgroundView = UIView()
        searchController.searchBar.backgroundImage = UIImage()
        
        // Move searchbar benath navigationbar.
        let point = CGPoint(x: 0, y:(self.navigationController?.navigationBar.frame.size.height)!)
        self.tableView.setContentOffset(point, animated: true)
        
        let firstLetters = effects.map { $0.titleFirstLetter }
        let uniqueFirstLetters = Array(Set(firstLetters))
        
        sortedFirstLetters = uniqueFirstLetters.sorted()
        sections = sortedFirstLetters.map { firstLetter in
            return effects
                .filter { $0.titleFirstLetter == firstLetter }
                .sorted { $0.effectName < $1.effectName}
        }
        setupSearchVC()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "EffectCell", for: indexPath)
        
        // Changing the selection color for a cell to a darker tone.
        let selectedView = UIView()
        selectedView.backgroundColor = UIColor(red: 54/255, green: 68/255, blue:     76/255, alpha: 1.0)
        cell.selectedBackgroundView = selectedView
        
//        let effect = sections[indexPath.section][indexPath.row]
        let effect = getCorrectCellItem(path: indexPath)
        
        if let nameLabel = cell.viewWithTag(100) as? UILabel {
            nameLabel.text = effect.effectName
        }
        
        if let effectImage = cell.viewWithTag(101) as? UIImageView{
            effectImage.image = UIImage(named: effect.effectName)
        }
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let number = indexPath.row
        print(number)
        self.performSegue(withIdentifier: "showEffects", sender: indexPath);
        
        // Prevent horrible bug.
        self.searchController.searchBar.endEditing(true)
//        self.searchController.isActive = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showEffects" {
            let destinatenViewController = segue.destination as! EffectTableViewController
            let indexPath = self.tableView.indexPathForSelectedRow
//            let selectedCell = sections[(indexPath?.section)!][(indexPath?.row)!]
            let selectedCell = getCorrectCellItem(path: indexPath!)
            destinatenViewController.effectCell = selectedCell
            
            // Hiding tab bar, when in DetailViewController.
            destinatenViewController.hidesBottomBarWhenPushed = true
        }
        
    }
    
    // MARK: SearchController.
    func filterContentForSearchText(_ searchText: String)
    {
        filteredResults = effects.filter { effect in
            return effect.effectName.lowercased().contains(searchText.lowercased())
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
    
    func getCorrectCellItem(path: IndexPath) -> Effect
    {
        let effect: Effect
        if searchController.isActive {
            effect = filteredResults[path.row]
        } else {
            effect = sections[path.section][path.row]
        }
        return effect
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }


}
