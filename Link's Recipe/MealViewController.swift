//
//  MealViewController.swift
//  Link's Recipes
//
//  Created by Martin List on 14/03/2017.
//  Copyright © 2017 Martin List. All rights reserved.
//

import UIKit

class MealViewController: UITableViewController {
    
    var meals:[Meal] = mealData
    var sortedFirstLetters: [String] = []
    var sections: [[Meal]] = [[]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Creating alphabetical sections.
        let firstLetters = meals.map { $0.titleFirstLetter }
        let uniqueFirstLetters = Array(Set(firstLetters))
        
        sortedFirstLetters = uniqueFirstLetters.sorted()
        sections = sortedFirstLetters.map { firstLetter in
            return meals
                .filter { $0.titleFirstLetter == firstLetter }
                .sorted { $0.name < $1.name }
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sortedFirstLetters[section]
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sortedFirstLetters
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealCell", for: indexPath)
        
        // Changing the selection color for a cell to a darker tone.
        let selectedView = UIView()
        selectedView.backgroundColor = UIColor(red: 54/255, green: 68/255, blue:     76/255, alpha: 1.0)
        cell.selectedBackgroundView = selectedView
        
        let meal = sections[indexPath.section][indexPath.row]

       
        if let nameLabel = cell.viewWithTag(100) as? UILabel {
            nameLabel.text = meal.name
        }
        
        // Resetting imageViews.
//        if let effectImage = cell.viewWithTag(103) as? UIImageView{
//            effectImage.image = .none}
        if let heartsImage = cell.viewWithTag(101) as? UIImageView{
            heartsImage.image = .none}
//        if let heartsYellowImage = cell.viewWithTag(102) as? UIImageView{
//            heartsYellowImage.image = .none}
        
        
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
        
        
        // Setting the added hearts.
//        if meal.heartsAdded != nil {
//            if let heartsAddedImage = cell.viewWithTag(102) as? UIImageView{
//                heartsAddedImage.image = UIImage(named: "fullYellowHeart")
//            }
//        }
        
        // Setting effect imageView.
//        if meal.effect == "Cold Resistance" {
//            if let effect = cell.viewWithTag(103) as? UIImageView{
//                effect.image = UIImage(named: "coldResistance")}
//        }
//        if meal.effect == "Heat Resistance" {
//            if let effect = cell.viewWithTag(103) as? UIImageView{
//                effect.image = UIImage(named: "heatResistance")}
//        }
//        if meal.effect == "Speed Up" {
//            if let effect = cell.viewWithTag(103) as? UIImageView{
//                effect.image = UIImage(named: "speedUp")}
//        }
//        if meal.effect == "Restores Stamina" {
//            if let effect = cell.viewWithTag(103) as? UIImageView{
//                effect.image = UIImage(named: "fullStamina")}
//        }
//        if meal.effect == "Overfills Stamina" {
//            if let effect = cell.viewWithTag(103) as? UIImageView{
//                effect.image = UIImage(named: "staminaAdded")}
//        }
        
    return cell
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let number = indexPath.row
        print(number)
        self.performSegue(withIdentifier: "showMealDetail", sender: indexPath);
        
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMealDetail" {
            let destinatenViewController = segue.destination as! MealDetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow
            let selectedCell = sections[(indexPath?.section)!][(indexPath?.row)!]
            destinatenViewController.mealCell = selectedCell
            
            // Hiding tab bar, when in DetailViewController.
            destinatenViewController.hidesBottomBarWhenPushed = true
        }
        
    }
    
    func calcHeartsImages(heartsValue: Float) -> (fullHearts: Int, decimalHearts: Float){
        let fullHearts = Int(heartsValue)
        let decimalHearts = heartsValue - Float(fullHearts)
        
        return(fullHearts, decimalHearts)
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
        
        for material in materialData{
            if meal.firstIngredient == material.materialName{
                if material.effect?.effectName != "Duration"{
                   check = true
                }
            }
            if meal.secondIngredient == material.materialName{
                if material.effect?.effectName != "Duration"{
                    check = true
                }
            }
            if meal.thirdIngredient == material.materialName{
                if material.effect?.effectName != "Duration"{
                    check = true
                }
            }
            if meal.fourthIngredient == material.materialName{
                if material.effect?.effectName != "Duration"{
                    check = true
                }
            }
            if meal.fifthIngredient == material.materialName{
                if material.effect?.effectName != "Duration"{
                    check = true
                }
            }
        }
        return check
    }
    
    func checkCategoryIngredients(meal: Meal) -> Bool{
        var check = false
        if meal.firstCategory != nil{
            for items in materialData{
                for tag in items.category{
                    
                    if meal.firstCategory == tag && items.effect?.effectName != "Duration"{
                        check = true
                    }
                }
            }
        }
        
        if meal.secondCategory != nil{
            for items in materialData{
                for tag in items.category{
                    
                    if meal.secondCategory == tag && items.effect?.effectName != "Duration"{
                        check = true
                    }
                }
            }
        }
        return check
    }
}
