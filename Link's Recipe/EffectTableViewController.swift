//
//  EffectTableViewController.swift
//  Recipe Slate
//
//  Created by martin on 19.04.17.
//  Copyright © 2017 Martin List. All rights reserved.
//

import UIKit

class EffectTableViewController: UITableViewController {

    var effectCell: Effect?
    
    var meals:[Meal] = mealData
    var materials:[Material] = materialData
    var effect:[Meal] = []
    
    var sortedFirstLetters: [String] = []
    var sections: [[Meal]] = [[]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = effectCell?.effectName

        
        findEffectInMeals()
        
        let firstLetters = effect.map { $0.titleFirstLetter }
        let uniqueFirstLetters = Array(Set(firstLetters))
        
        sortedFirstLetters = uniqueFirstLetters.sorted()
        sections = sortedFirstLetters.map { firstLetter in
            return effect
                .filter { $0.titleFirstLetter == firstLetter }
                .sorted { $0.name < $1.name }
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealCell", for: indexPath)
        
        // Changing the selection color for a cell to a darker tone.
        let selectedView = UIView()
        selectedView.backgroundColor = UIColor(red: 54/255, green: 68/255, blue:     76/255, alpha: 1.0)
        cell.selectedBackgroundView = selectedView
        
        let effect = sections[indexPath.section][indexPath.row]
        
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
    
        for material in materialData{
            
            if meal.firstIngredient == material.materialName{

                if material.effect?.effectName == effectCell?.effectName{
                    effect.append(meal)
                    status = 1
                }
                else if material.effect?.effectName == "Duration"{
                    status = 2
                }
                else {
                    status = 3
                }
            }
            if meal.secondIngredient == material.materialName{
                
                if material.effect?.effectName == effectCell?.effectName{
                    effect.append(meal)
                    status = 1
                }
                else if material.effect?.effectName == "Duration"{
                    status = 2
                }
                else {
                    status = 3
                }
            }
            if meal.thirdIngredient == material.materialName{
                
                if material.effect?.effectName == effectCell?.effectName{
                    effect.append(meal)
                    status = 1
                }
                else if material.effect?.effectName == "Duration"{
                    status = 2
                }
                else {
                    status = 3
                }
            }
            if meal.fourthIngredient == material.materialName{
                
                if material.effect?.effectName == effectCell?.effectName{
                    effect.append(meal)
                    status = 1
                }
                else if material.effect?.effectName == "Duration"{
                    status = 2
                }
                else {
                    status = 3
                }
            }
            if meal.fifthIngredient == material.materialName{
                
                if material.effect?.effectName == effectCell?.effectName{
                    effect.append(meal)
                    status = 1
                }
                else if material.effect?.effectName == "Duration"{
                    status = 2
                }
                else {
                    status = 3
                }
            }
        }
        return status
    }
    
    func findEffectInCategoryIngredients(meal: Meal){
        
        if meal.firstCategory != nil{
            for items in materialData{
                for tag in items.category{
                
                    if meal.firstCategory == tag && items.effect?.effectName == effectCell?.effectName{
                        effect.append(meal)
                        return
                                            //            print(items.materialName)
                    }
                }
            }
        }
        
        if meal.secondCategory != nil{
            for items in materialData{
                for tag in items.category{
                    
                    if meal.secondCategory == tag && items.effect?.effectName == effectCell?.effectName{
                        effect.append(meal)
                        return
                        //            print(items.materialName)
                    }
                }
            }
        }
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
            destinatenViewController.selectedEffect = effectCell?.effectName
            
            // Hiding tab bar, when in DetailViewController.
            destinatenViewController.hidesBottomBarWhenPushed = true
        }
        
    }
}
