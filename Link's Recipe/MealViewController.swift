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
        
        // Setting imageViews for hearts.
        
        if meal.hearts >= 0.00{
            //Setting the image for fullHeart.
            if let heartsRestoredImage = cell.viewWithTag(101) as? UIImageView{
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
        self.performSegue(withIdentifier: "showDetail", sender: indexPath);
        
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let destinatenViewController = segue.destination as! DetailViewController
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
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
