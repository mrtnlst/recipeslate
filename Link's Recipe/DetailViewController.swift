//
//  DetailViewController.swift
//  Link's Recipes
//
//  Created by Martin List on 14/03/2017.
//  Copyright © 2017 Martin List. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var effectsLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    
    @IBOutlet weak var firstIngredientLabel: UILabel!
    @IBOutlet weak var secondIngredientLabel: UILabel!
    @IBOutlet weak var thirdIngredientLabel: UILabel!
    @IBOutlet weak var fourthIngredientLabel: UILabel!
    @IBOutlet weak var fifthIngredientLabel: UILabel!
    
    var mealCell: Meal?
    var elixirCell: Elixir?
    var foodCell: Food?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (mealCell != nil){
            setLabels(type: "Meal")
            setHearts(heartValueOfCellItem: (mealCell?.hearts)!)
            
            if mealCell?.effect != nil{
                setEffects(effectOfCellItem: (mealCell?.effect)!)
            }
            if mealCell?.heartsAdded != nil {
                setAddedHearts(heartsAdded: (mealCell?.heartsAdded)!)
            }
        }
        if (elixirCell != nil){
            setLabels(type: "Elixir")
            setEffects(effectOfCellItem: (elixirCell?.effect)!)
        }
        if (foodCell != nil){
            setLabels(type: "Food")
            setHearts(heartValueOfCellItem: (foodCell?.hearts)!)
            
            if foodCell?.effect != nil{
                setEffects(effectOfCellItem: (foodCell?.effect)!)
            }
        }

    }

    func setLabels(type: String){
        
        if type == "Meal" {
            
            nameLabel.text = mealCell?.name
            
            if ((mealCell?.effect) != nil){
                effectsLabel.text = mealCell?.effect
                effectsLabel.font = UIFont.italicSystemFont(ofSize: 18.0)
            } else {
                effectsLabel.text = "None"
                effectsLabel.textColor = .gray
                effectsLabel.font = UIFont.italicSystemFont(ofSize: 18.0)}
            
            if ((mealCell?.duration) != nil){
                durationLabel.text = mealCell?.duration
                durationLabel.font = UIFont.italicSystemFont(ofSize: 18.0)
            } else {
                durationLabel.text = "None"
                durationLabel.textColor = .gray
                durationLabel.font = UIFont.italicSystemFont(ofSize: 18.0)}
            
            firstIngredientLabel.text = mealCell?.ingredientNames.firstIngredient
            firstIngredientLabel.font = UIFont.italicSystemFont(ofSize: 17.0)
            
            secondIngredientLabel.text = mealCell?.ingredientNames.secondIngredient
            secondIngredientLabel.font = UIFont.italicSystemFont(ofSize: 17.0)
            
            thirdIngredientLabel.text = mealCell?.ingredientNames.thirdIngredient
            thirdIngredientLabel.font = UIFont.italicSystemFont(ofSize: 17.0)
            
            fourthIngredientLabel.text = mealCell?.ingredientNames.fourthIngredient
            fourthIngredientLabel.font = UIFont.italicSystemFont(ofSize: 17.0)
            
            fifthIngredientLabel.text = mealCell?.ingredientNames.fifthIngredient
            fifthIngredientLabel.font = UIFont.italicSystemFont(ofSize: 17.0)
        }
        if type == "Elixir" {
        
            nameLabel.text = elixirCell?.name
            effectsLabel.text = elixirCell?.effect
            effectsLabel.font = UIFont.italicSystemFont(ofSize: 18.0)

            if let heartsRestoredLabel = view.viewWithTag(100) as? UILabel {
                heartsRestoredLabel.text = "None "
                heartsRestoredLabel.textColor = .gray
                heartsRestoredLabel.font = UIFont.italicSystemFont(ofSize: 18.0)
            }
            

            if ((elixirCell?.duration) != nil){
                durationLabel.text = elixirCell?.duration
                durationLabel.font = UIFont.italicSystemFont(ofSize: 18.0)

            } else {
                durationLabel.text = "None"
                durationLabel.textColor = .gray
                durationLabel.font = UIFont.italicSystemFont(ofSize: 18.0)
            }
            
            firstIngredientLabel.text = elixirCell?.ingredientNames.firstIngredient
            firstIngredientLabel.font = UIFont.italicSystemFont(ofSize: 17.0)
           
            secondIngredientLabel.text = elixirCell?.ingredientNames.secondIngredient
            secondIngredientLabel.font = UIFont.italicSystemFont(ofSize: 17.0)

            thirdIngredientLabel.text = elixirCell?.ingredientNames.thirdIngredient
            thirdIngredientLabel.font = UIFont.italicSystemFont(ofSize: 17.0)

            fourthIngredientLabel.text = elixirCell?.ingredientNames.fourthIngredient
            fourthIngredientLabel.font = UIFont.italicSystemFont(ofSize: 17.0)

            fifthIngredientLabel.text = elixirCell?.ingredientNames.fifthIngredient
            fifthIngredientLabel.font = UIFont.italicSystemFont(ofSize: 17.0)

        }
        if type == "Food" {
            nameLabel.text = foodCell?.name
            
            // Checking, whether effects or duration are nil.
            if foodCell?.effect != nil{
                effectsLabel.text = foodCell?.effect
                effectsLabel.font = UIFont.italicSystemFont(ofSize: 18.0)
            } else{
                effectsLabel.text = "None"
                effectsLabel.textColor = .gray
                effectsLabel.font = UIFont.italicSystemFont(ofSize: 18.0)
            }
            if foodCell?.duration != nil{
                durationLabel.text = foodCell?.duration
                durationLabel.font = UIFont.italicSystemFont(ofSize: 18.0)

            } else{
                durationLabel.text = "None"
                durationLabel.textColor = .gray
                durationLabel.font = UIFont.italicSystemFont(ofSize: 18.0)
            }
            
            firstIngredientLabel.text = foodCell?.ingredientNames.firstIngredient
            firstIngredientLabel.font = UIFont.italicSystemFont(ofSize: 17.0)
            
            secondIngredientLabel.text = foodCell?.ingredientNames.secondIngredient
            secondIngredientLabel.font = UIFont.italicSystemFont(ofSize: 17.0)
            
            thirdIngredientLabel.text = foodCell?.ingredientNames.thirdIngredient
            thirdIngredientLabel.font = UIFont.italicSystemFont(ofSize: 17.0)
            
            fourthIngredientLabel.text = foodCell?.ingredientNames.fourthIngredient
            fourthIngredientLabel.font = UIFont.italicSystemFont(ofSize: 17.0)
            
            fifthIngredientLabel.text = foodCell?.ingredientNames.fifthIngredient
            fifthIngredientLabel.font = UIFont.italicSystemFont(ofSize: 17.0)
        }
    }
    
    func calcHeartsImages(heartsValue: Float) -> (fullHearts: Int, decimalHearts: Float){
        let fullHearts = Int(heartsValue)
        let decimalHearts = heartsValue - Float(fullHearts)
        
        return(fullHearts, decimalHearts)
    }
    
    func setHearts(heartValueOfCellItem: Float){
        let hearts = calcHeartsImages(heartsValue: heartValueOfCellItem)
        let imageForDecimalHeart: String
        
        // Position for the secondHeart, if neccesary.
        var position: Int = 102
        
        // If full hearts have to be displayed.
        if hearts.fullHearts > 0{
            
            // If full health is restored, the label displays "full".
            if hearts.fullHearts == 100 {
                if let heartsRestoredLabel = view.viewWithTag(100) as? UILabel {
                    heartsRestoredLabel.text = "full "
                    
                    heartsRestoredLabel.font = UIFont.italicSystemFont(ofSize: 18.0)
                }
            } else {
                
                // Every other case, the label displays the number of restored full hearts.
                if let heartsRestoredLabel = view.viewWithTag(100) as? UILabel {
                    heartsRestoredLabel.text = String(format: "%d\t", (hearts.fullHearts))
                    
                    heartsRestoredLabel.font = UIFont.italicSystemFont(ofSize: 18.0)
                }
            }
            
            // Setting the image for fullHeart.
            if let heartsRestoredImage = view.viewWithTag(101) as? UIImageView{
                heartsRestoredImage.image = UIImage(named: "fullHeart")
            }
        }
        else {
            
            // If no full heart image has to be displayed.
            if let heartsRestoredLabel = view.viewWithTag(100) as? UILabel {
                heartsRestoredLabel.text = ""
            }
            
            // The decimal heart can move to the first imageView.
            position = 101
            if let heartsRestoredImage = view.viewWithTag(101) as? UIImageView{
                heartsRestoredImage.image = UIImage(named: "emptyHeart")
            }
        }
        
        // If a decimal heart has to be displayed.
        if hearts.decimalHearts > 0{
            
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
                if let firstHeart = view.viewWithTag(position) as? UIImageView{
                    firstHeart.image = UIImage(named: imageForDecimalHeart)}
            }
        } else {
            
            // If no decimal heart has to be displayed, remove the second imageView
            if let heartsRestoredImage = view.viewWithTag(102) as? UIImageView{
                heartsRestoredImage.removeFromSuperview()
            }
        }
    }
    
    func setAddedHearts(heartsAdded: Int){
        
        // Setting the added hearts.
        if let heartsAddedLabel = view.viewWithTag(200) as? UILabel {
            heartsAddedLabel.text = String(format: "%d ", (mealCell?.heartsAdded)!)
            heartsAddedLabel.font = UIFont.italicSystemFont(ofSize: 18.0)
        }
        if let heartsAddedImage = view.viewWithTag(201) as? UIImageView{
            heartsAddedImage.image = UIImage(named: "fullYellowHeart")
        }
    }
    
    func setEffects(effectOfCellItem: String?){
        print("Inside setEffects")
        
        if effectOfCellItem == "Cold Resistance" {
            if let effect = view.viewWithTag(1) as? UIImageView{
                effect.image = UIImage(named: "coldResistance")}
        }
        if effectOfCellItem == "Heat Resistance" {
            if let effect = view.viewWithTag(1) as? UIImageView{
                effect.image = UIImage(named: "heatResistance")}
        }
        if effectOfCellItem == "Restores Stamina" {
            if let effect = view.viewWithTag(1) as? UIImageView{
                effect.image = UIImage(named: "fullStamina")}
        }
        if effectOfCellItem == "Speed Up" {
            if let effect = view.viewWithTag(1) as? UIImageView{
                effect.image = UIImage(named: "speedUp")}
        }
    }
}
