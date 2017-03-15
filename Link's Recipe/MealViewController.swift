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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return meals.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealCell", for: indexPath)

        let meal = meals[indexPath.row] as Meal
       
        if let nameLabel = cell.viewWithTag(100) as? UILabel {
            nameLabel.text = meal.name
        }
        
        let hearts = calcHeartsImages(heartsValue: meal.hearts)
        var position = 101
        let imageForDecimalHeart: String
        
        if hearts.fullHearts > 0 {
            switch(hearts.fullHearts){
            case 5:
                if let firstHeart = cell.viewWithTag(105) as? UIImageView{
                    firstHeart.image = UIImage(named: "fullHeart")}
                    position += 1
                fallthrough
            case 4:
                if let firstHeart = cell.viewWithTag(104) as? UIImageView{
                    firstHeart.image = UIImage(named: "fullHeart")}
                    position += 1
                fallthrough
            case 3:
                if let firstHeart = cell.viewWithTag(103) as? UIImageView{
                    firstHeart.image = UIImage(named: "fullHeart")}
                    position += 1
                fallthrough
            case 2:
                if let firstHeart = cell.viewWithTag(102) as? UIImageView{
                    firstHeart.image = UIImage(named: "fullHeart")}
                    position += 1
                fallthrough
            case 1:
                if let firstHeart = cell.viewWithTag(101) as? UIImageView{
                    firstHeart.image = UIImage(named: "fullHeart")}
                    position += 1
                fallthrough
                
            default: print("End Reached")
            }
            

        }
        if hearts.decimalHearts > 0 {
                switch(hearts.decimalHearts){
                case 0.75:
                    imageForDecimalHeart = "threeQuarterHeart"
                case 0.5:
                    imageForDecimalHeart = "halfHeart"
                case 0.25:
                    imageForDecimalHeart = "oneQuarterHeart"
                default:
                    print("No decimal hearts.")
                    imageForDecimalHeart = "emptyHeart"
                }
                if let firstHeart = cell.viewWithTag(position) as? UIImageView{
                    firstHeart.image = UIImage(named: imageForDecimalHeart)}
            }
        
        
        
    return cell
        
    }
//    
//    let cell = tableView.dequeueReusableCellWithIdentifier("PlayerCell", forIndexPath: indexPath) //1
//    
//    let player = players[indexPath.row] as Player //2
//    
//    if let nameLabel = cell.viewWithTag(100) as? UILabel { //3
//        nameLabel.text = player.name
//    }
//    if let gameLabel = cell.viewWithTag(101) as? UILabel {
//        gameLabel.text = player.game
//    }
//    if let ratingImageView = cell.viewWithTag(102) as? UIImageView {
//        ratingImageView.image = self.imageForRating(player.rating)
//    }
//    return cell
//}
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let number = indexPath.row
        print(number)
        self.performSegue(withIdentifier: "showDetail", sender: indexPath);
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let destinatenViewController = segue.destination as! DetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow
            let selectedCell = meals[(indexPath?.row)!] as Meal
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
