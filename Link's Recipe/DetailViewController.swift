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
    
    @IBOutlet weak var heartsRestoredLabel: UILabel!
    @IBOutlet weak var plusLabel: UILabel!
    @IBOutlet weak var heartsAddedLabel: UILabel!
    @IBOutlet weak var staminaAmountLabel: UILabel!
    
    var mealCell: Meal?
    var elixirCell: Elixir?
    var foodCell: Food?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Resetting labels.
        staminaAmountLabel.isHidden = true
        plusLabel.isHidden = true
        heartsAddedLabel.isHidden = true
        
        // Checking forwarded cells.
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
            } else {
                effectsLabel.text = "None"
                effectsLabel.textColor = .gray
                effectsLabel.font = UIFont.italicSystemFont(ofSize: 18.0)}
            
            if ((mealCell?.duration) != nil){
                durationLabel.text = mealCell?.duration
            } else {
                durationLabel.text = "None"
                durationLabel.textColor = .gray
                durationLabel.font = UIFont.italicSystemFont(ofSize: 18.0)}
            
            if mealCell?.staminaAdded != nil {
                staminaAmountLabel.isHidden = false
                if let staminaAmount = view.viewWithTag(2) as? UILabel{
                    staminaAmount.text = String(format: "%.1f", (mealCell?.staminaAdded)!)
                }
            }
            
            // IngredientLabels.
            firstIngredientLabel.text = mealCell?.ingredientNames.firstIngredient
            secondIngredientLabel.text = mealCell?.ingredientNames.secondIngredient
            thirdIngredientLabel.text = mealCell?.ingredientNames.thirdIngredient
            fourthIngredientLabel.text = mealCell?.ingredientNames.fourthIngredient
            fifthIngredientLabel.text = mealCell?.ingredientNames.fifthIngredient
        }
        if type == "Elixir" {
        
            nameLabel.text = elixirCell?.name
            effectsLabel.text = elixirCell?.effect

            if let heartsRestoredLabel = view.viewWithTag(100) as? UILabel {
                heartsRestoredLabel.text = "None "
                heartsRestoredLabel.textColor = .gray
                heartsRestoredLabel.font = UIFont.italicSystemFont(ofSize: 18.0)
            }
            

            if ((elixirCell?.duration) != nil){
                durationLabel.text = elixirCell?.duration

            } else {
                durationLabel.text = "None"
                durationLabel.textColor = .gray
                durationLabel.font = UIFont.italicSystemFont(ofSize: 18.0)
            }
            
            if elixirCell?.staminaAdded != nil {
                staminaAmountLabel.isHidden = false
                if let staminaAmount = view.viewWithTag(2) as? UILabel{
                    staminaAmount.text = String(format: "%.1f", (elixirCell?.staminaAdded)!)
                }
            }
            
            // IngredientLabels.
            firstIngredientLabel.text = elixirCell?.ingredientNames.firstIngredient
            secondIngredientLabel.text = elixirCell?.ingredientNames.secondIngredient
            thirdIngredientLabel.text = elixirCell?.ingredientNames.thirdIngredient
            fourthIngredientLabel.text = elixirCell?.ingredientNames.fourthIngredient
            fifthIngredientLabel.text = elixirCell?.ingredientNames.fifthIngredient

        }
        if type == "Food" {
            nameLabel.text = foodCell?.name
            
            // Checking, whether effects or duration are nil.
            if foodCell?.effect != nil{
                effectsLabel.text = foodCell?.effect
            } else{
                effectsLabel.text = "None"
                effectsLabel.textColor = .gray
                effectsLabel.font = UIFont.italicSystemFont(ofSize: 18.0)
            }
            if foodCell?.duration != nil{
                durationLabel.text = foodCell?.duration

            } else{
                durationLabel.text = "None"
                durationLabel.textColor = .gray
                durationLabel.font = UIFont.italicSystemFont(ofSize: 18.0)
            }
            
            // IngredientLabels.
            firstIngredientLabel.text = foodCell?.ingredientNames.firstIngredient
            secondIngredientLabel.text = foodCell?.ingredientNames.secondIngredient
            thirdIngredientLabel.text = foodCell?.ingredientNames.thirdIngredient
            fourthIngredientLabel.text = foodCell?.ingredientNames.fourthIngredient
            fifthIngredientLabel.text = foodCell?.ingredientNames.fifthIngredient
        }
    }
    
    func calcHeartsImages(heartsValue: Float) -> (fullHearts: Int, decimalHearts: Float){
        let fullHearts = Int(heartsValue)
        let decimalHearts = heartsValue - Float(fullHearts)
        
        return(fullHearts, decimalHearts)
    }
    
    func setHearts(heartValueOfCellItem: Float){
        let hearts = calcHeartsImages(heartsValue: heartValueOfCellItem)
        
        // If full hearts have to be displayed.
        if (hearts.fullHearts > 0) || (hearts.decimalHearts > 0.00){
            
            // If full health is restored, the label displays "full".
            if hearts.fullHearts == 100 {
                    heartsRestoredLabel.text = "full "
            } else {
                if hearts.decimalHearts > 0.00 {
                        heartsRestoredLabel.text = String(format: "%.2f ", (heartValueOfCellItem))
                } else {
                    // Every other case, the label displays the number of restored full hearts.
                        heartsRestoredLabel.text = String(format: "%d ", (hearts.fullHearts))
                }
            }
            
            // Setting the image for fullHeart.
            if let heartsRestoredImage = view.viewWithTag(101) as? UIImageView{
                heartsRestoredImage.image = UIImage(named: "fullHeart")
            }
        }
    }
    
    func setAddedHearts(heartsAdded: Int){
        
        // Setting the added hearts.

        if let heartsAddedImage = view.viewWithTag(201) as? UIImageView{
            heartsAddedImage.image = UIImage(named: "fullYellowHeart")
        }
        heartsAddedLabel.text = String(format: "%d ", (mealCell?.heartsAdded)!)
        
        heartsAddedLabel.isHidden = false
        plusLabel.isHidden = false
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
        if effectOfCellItem == "Overfills Stamina" {
                if let effect = view.viewWithTag(1) as? UIImageView{
                effect.image = UIImage(named: "staminaAdded")}
        }
    }
}
