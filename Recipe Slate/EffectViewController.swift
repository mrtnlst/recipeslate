//
//  EffectViewController.swift
//  Link's Recipes
//
//  Created by martin on 02.04.17.
//  Copyright © 2017 Martin List. All rights reserved.
//

import UIKit

class EffectViewController: UITableViewController {

    var effects:[Effect] = effectData
    var sortedFirstLetters: [String] = []
    var sections: [[Effect]] = [[]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let firstLetters = effects.map { $0.titleFirstLetter }
        let uniqueFirstLetters = Array(Set(firstLetters))
        
        sortedFirstLetters = uniqueFirstLetters.sorted()
        sections = sortedFirstLetters.map { firstLetter in
            return effects
                .filter { $0.titleFirstLetter == firstLetter }
                .sorted { $0.effectName < $1.effectName}
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sortedFirstLetters[section]
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sortedFirstLetters
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
        
        let effect = sections[indexPath.section][indexPath.row]
        
        if let nameLabel = cell.viewWithTag(100) as? UILabel {
            nameLabel.text = effect.effectName
        }
        
        if let effectImage = cell.viewWithTag(101) as? UIImageView{
            effectImage.image = UIImage(named: effect.effectName)
        }
        
        return cell
        
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
//        let number = indexPath.row
//        print(number)
//        self.performSegue(withIdentifier: "showElixirDetail", sender: indexPath);
//        
//    }
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showElixirDetail" {
//            let destinatenViewController = segue.destination as! ElixirDetailViewController
//            let indexPath = self.tableView.indexPathForSelectedRow
//            let selectedCell = sections[(indexPath?.section)!][(indexPath?.row)!]
//            destinatenViewController.elixirCell = selectedCell
//            
//            // Hiding tab bar, when in DetailViewController.
//            destinatenViewController.hidesBottomBarWhenPushed = true
//        }
//        
//    }

}
