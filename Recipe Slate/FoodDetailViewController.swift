//
//  FoodDetailViewController.swift
//  Link's Recipes
//
//  Created by Martin List on 25/03/2017.
//  Copyright © 2017 Martin List. All rights reserved.
//


import UIKit

class FoodDetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heartsRestoredLabel: UILabel!
    
    
    @IBOutlet weak var firstIngredientLabel: UILabel!
    @IBOutlet weak var secondIngredientLabel: UILabel!
    @IBOutlet weak var thirdIngredientLabel: UILabel!
    @IBOutlet weak var fourthIngredientLabel: UILabel!
    @IBOutlet weak var fifthIngredientLabel: UILabel!
    
    @IBOutlet weak var firstPlusLabel: UILabel!
    @IBOutlet weak var specialEffectOneImage: UIImageView!
    @IBOutlet weak var firstDurationLabel: UILabel!
    @IBOutlet weak var firstEffectsLabel: UILabel!
    
    
    
    var foodCell: Food?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Resetting labels.
        firstPlusLabel.isHidden = true
        //        secondPlusLabel.isHidden = true
        
        //        // Checking forwarded cells.
        //        if (mealCell != nil){
        //            setLabels(type: "Meal")
        //            setHearts(heartValueOfCellItem: (mealCell?.hearts)!)
        //
        //            if mealCell?.firstEffect != nil{
        //                setFirstEffect(effectOfCellItem: mealCell?.firstEffect)
        //            }
        //            else{
        //                hideFirstEffect()
        //            }
        //            if mealCell?.secondEffect != nil{
        //                setSecondEffect(effectOfCellItem: mealCell?.secondEffect)
        //            }
        //            else{
        //                hideSecondEffect()
        //            }
        //
        //
        //        }
        ////        if (elixirCell != nil){
        ////            setLabels(type: "Elixir")
        ////        }
        if (foodCell != nil){
            setLabels(type: "Food")
            setHearts(heartValueOfCellItem: (foodCell?.hearts)!)
            
            if foodCell?.firstEffect != nil{
                setFirstEffect(effectOfCellItem: foodCell?.firstEffect)
            }
            else{
                hideFirstEffect()
            }
        }
    }
    
    func setLabels(type: String){
        
        //        if type == "Meal" {
        //
        //            nameLabel.text = mealCell?.name
        //
        //            // IngredientLabels.
        //            firstIngredientLabel.text = mealCell?.ingredientNames.firstIngredient
        //            secondIngredientLabel.text = mealCell?.ingredientNames.secondIngredient
        //            thirdIngredientLabel.text = mealCell?.ingredientNames.thirdIngredient
        //            fourthIngredientLabel.text = mealCell?.ingredientNames.fourthIngredient
        //            fifthIngredientLabel.text = mealCell?.ingredientNames.fifthIngredient
        //        }
        //        if type == "Elixir" {
        //
        //            nameLabel.text = elixirCell?.name
        //
        //            // IngredientLabels.
        //            firstIngredientLabel.text = elixirCell?.ingredientNames.firstIngredient
        //            secondIngredientLabel.text = elixirCell?.ingredientNames.secondIngredient
        //            thirdIngredientLabel.text = elixirCell?.ingredientNames.thirdIngredient
        //            fourthIngredientLabel.text = elixirCell?.ingredientNames.fourthIngredient
        //            fifthIngredientLabel.text = elixirCell?.ingredientNames.fifthIngredient
        //
        //        }
        if type == "Food" {
            nameLabel.text = foodCell?.name
            
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
    //
    //    func setAddedHearts(heartsAdded: Float, effectNumber: Int){
    //
    //        // Setting the added hearts.
    //
    //
    //    }
    
    func setFirstEffect(effectOfCellItem: Effect?){
        print("Inside setEffects")
        
        //        if effectOfCellItem?.effectName == "Electricity Resistance" {
        //            specialEffectOneImage.image = UIImage(named: (effectOfCellItem?.effectName)!)
        //            firstEffectsLabel.text = effectOfCellItem?.effectName
        //            if effectOfCellItem?.duration != nil {
        //                firstDurationLabel.text = effectOfCellItem?.duration
        //            }
        //            specialIngredientOne.text = (effectOfCellItem?.effectIngredient)!+":"
        //        }
        //
        //        if effectOfCellItem?.effectName == "Fire Resistance" {
        //            specialEffectOneImage.image = UIImage(named: (effectOfCellItem?.effectName)!)
        //            firstEffectsLabel.text = effectOfCellItem?.effectName
        //            if effectOfCellItem?.duration != nil {
        //                firstDurationLabel.text = effectOfCellItem?.duration
        //            }
        //            specialIngredientOne.text = (effectOfCellItem?.effectIngredient)!+":"
        //        }
        //
        //        if effectOfCellItem?.effectName == "Increased Stealth" {
        //            specialEffectOneImage.image = UIImage(named: (effectOfCellItem?.effectName)!)
        //            firstEffectsLabel.text = effectOfCellItem?.effectName
        //            if effectOfCellItem?.duration != nil {
        //                firstDurationLabel.text = effectOfCellItem?.duration
        //            }
        //            specialIngredientOne.text = (effectOfCellItem?.effectIngredient)!+":"
        //        }
        //
        //        if effectOfCellItem?.effectName == "Defense Up" {
        //            specialEffectOneImage.image = UIImage(named: (effectOfCellItem?.effectName)!)
        //            firstEffectsLabel.text = effectOfCellItem?.effectName
        //            if effectOfCellItem?.duration != nil {
        //                firstDurationLabel.text = effectOfCellItem?.duration
        //            }
        //            specialIngredientOne.text = (effectOfCellItem?.effectIngredient)!+":"
        //        }
        //
        //        if effectOfCellItem?.effectName == "Attack Up" {
        //            specialEffectOneImage.image = UIImage(named: (effectOfCellItem?.effectName)!)
        //            firstEffectsLabel.text = effectOfCellItem?.effectName
        //            if effectOfCellItem?.duration != nil {
        //                firstDurationLabel.text = effectOfCellItem?.duration
        //            }
        //            specialIngredientOne.text = (effectOfCellItem?.effectIngredient)!+":"
        //        }
        //
        //        if effectOfCellItem?.effectName == "Cold Resistance" {
        //                specialEffectOneImage.image = UIImage(named: (effectOfCellItem?.effectName)!)
        //                firstEffectsLabel.text = effectOfCellItem?.effectName
        //            if effectOfCellItem?.duration != nil {
        //                firstDurationLabel.text = effectOfCellItem?.duration
        //            }
        //            specialIngredientOne.text = (effectOfCellItem?.effectIngredient)!+":"
        //        }
        
        if effectOfCellItem?.effectName == "Heat Resistance" {
            specialEffectOneImage.image = UIImage(named: (effectOfCellItem?.effectName)!)
            firstEffectsLabel.text = effectOfCellItem?.effectName
            if effectOfCellItem?.duration != nil {
                firstDurationLabel.text = durationToString(duration: (effectOfCellItem?.duration)!)
            }
        }
        
        //        if effectOfCellItem?.effectName == "Restores Stamina" {
        //            specialEffectOneImage.image = UIImage(named: (effectOfCellItem?.effectName)!)
        //                firstEffectsLabel.text = effectOfCellItem?.effectName
        //            if effectOfCellItem?.amount != nil {
        //                firstDurationLabel.text = String(format: "%.1f", (effectOfCellItem?.amount)!)
        //            }
        //            specialIngredientOne.text = (effectOfCellItem?.effectIngredient)!+":"
        //
        //        }
        //
        //        if effectOfCellItem?.effectName == "Speed Up" {
        //            specialEffectOneImage.image = UIImage(named: (effectOfCellItem?.effectName)!)
        //                firstEffectsLabel.text = effectOfCellItem?.effectName
        //            if effectOfCellItem?.duration != nil {
        //                firstDurationLabel.text = effectOfCellItem?.duration
        //            }
        //            specialIngredientOne.text = (effectOfCellItem?.effectIngredient)!+":"
        //
        //        }
        //
        //        if effectOfCellItem?.effectName == "Overfills Stamina" {
        //            specialEffectOneImage.image = UIImage(named: (effectOfCellItem?.effectName)!)
        //                firstEffectsLabel.text = effectOfCellItem?.effectName
        //            if effectOfCellItem?.amount != nil {
        //                firstDurationLabel.text = String(format: "%.1f", (effectOfCellItem?.amount)!)
        //            }
        //            specialIngredientOne.text = (effectOfCellItem?.effectIngredient)!+":"
        //        }
        //
        //        if effectOfCellItem?.effectName == "Temporary Hearts" {
        //            specialEffectOneImage.image = UIImage(named: (effectOfCellItem?.effectName)!)
        //
        //            firstDurationLabel.text = String(format: " %.0f", (effectOfCellItem?.amount)!)
        //            firstPlusLabel.isHidden = false
        //
        //            firstEffectsLabel.text = effectOfCellItem?.effectName
        //            specialIngredientOne.text = (effectOfCellItem?.effectIngredient)!+":"
        //
        //        }
    }
    
    //    func setSecondEffect(effectOfCellItem: Effect?){
    //        print("Inside setEffects")
    //
    //        if effectOfCellItem?.effectName == "Electricity Resistance" {
    //            specialEffectTwoImage.image = UIImage(named: (effectOfCellItem?.effectName)!)
    //            secondEffectsLabel.text = effectOfCellItem?.effectName
    //            if effectOfCellItem?.duration != nil {
    //                secondDurationLabel.text = effectOfCellItem?.duration
    //            }
    //            specialIngredientTwo.text = (effectOfCellItem?.effectIngredient)!+":"
    //        }
    //
    //        if effectOfCellItem?.effectName == "Fire Resistance" {
    //            specialEffectTwoImage.image = UIImage(named: (effectOfCellItem?.effectName)!)
    //            secondEffectsLabel.text = effectOfCellItem?.effectName
    //            if effectOfCellItem?.duration != nil {
    //                secondDurationLabel.text = effectOfCellItem?.duration
    //            }
    //            specialIngredientTwo.text = (effectOfCellItem?.effectIngredient)!+":"
    //        }
    //
    //        if effectOfCellItem?.effectName == "Increased Stealth" {
    //            specialEffectTwoImage.image = UIImage(named: (effectOfCellItem?.effectName)!)
    //            secondEffectsLabel.text = effectOfCellItem?.effectName
    //            if effectOfCellItem?.duration != nil {
    //                secondDurationLabel.text = effectOfCellItem?.duration
    //            }
    //            specialIngredientTwo.text = (effectOfCellItem?.effectIngredient)!+":"
    //        }
    //
    //        if effectOfCellItem?.effectName == "Defense Up" {
    //            specialEffectTwoImage.image = UIImage(named: (effectOfCellItem?.effectName)!)
    //            secondEffectsLabel.text = effectOfCellItem?.effectName
    //            if effectOfCellItem?.duration != nil {
    //                secondDurationLabel.text = effectOfCellItem?.duration
    //            }
    //            specialIngredientTwo.text = (effectOfCellItem?.effectIngredient)!+":"
    //        }
    //
    //        if effectOfCellItem?.effectName == "Attack Up" {
    //            specialEffectTwoImage.image = UIImage(named: (effectOfCellItem?.effectName)!)
    //            secondEffectsLabel.text = effectOfCellItem?.effectName
    //            if effectOfCellItem?.duration != nil {
    //                secondDurationLabel.text = effectOfCellItem?.duration
    //            }
    //            specialIngredientTwo.text = (effectOfCellItem?.effectIngredient)!+":"
    //        }
    //
    //        if effectOfCellItem?.effectName == "Cold Resistance" {
    //            specialEffectTwoImage.image = UIImage(named: (effectOfCellItem?.effectName)!)
    //            secondEffectsLabel.text = effectOfCellItem?.effectName
    //            if effectOfCellItem?.duration != nil {
    //                secondDurationLabel.text = effectOfCellItem?.duration
    //            }
    //            specialIngredientTwo.text = (effectOfCellItem?.effectIngredient)!+":"
    //        }
    //
    //        if effectOfCellItem?.effectName == "Heat Resistance" {
    //            specialEffectTwoImage.image = UIImage(named: (effectOfCellItem?.effectName)!)
    //            secondEffectsLabel.text = effectOfCellItem?.effectName
    //            if effectOfCellItem?.duration != nil {
    //                secondDurationLabel.text = effectOfCellItem?.duration
    //            }
    //            specialIngredientTwo.text = (effectOfCellItem?.effectIngredient)!+":"
    //        }
    //
    //        if effectOfCellItem?.effectName == "Restores Stamina" {
    //            specialEffectTwoImage.image = UIImage(named: (effectOfCellItem?.effectName)!)
    //            secondEffectsLabel.text = effectOfCellItem?.effectName
    //            if effectOfCellItem?.amount != nil {
    //                secondDurationLabel.text = String(format: "%.1f", (effectOfCellItem?.amount)!)
    //            }
    //            specialIngredientTwo.text = (effectOfCellItem?.effectIngredient)!+":"
    //
    //        }
    //
    //        if effectOfCellItem?.effectName == "Speed Up" {
    //            specialEffectTwoImage.image = UIImage(named: (effectOfCellItem?.effectName)!)
    //            secondEffectsLabel.text = effectOfCellItem?.effectName
    //            if effectOfCellItem?.duration != nil {
    //                secondDurationLabel.text = effectOfCellItem?.duration
    //            }
    //            specialIngredientTwo.text = (effectOfCellItem?.effectIngredient)!+":"
    //
    //        }
    //
    //        if effectOfCellItem?.effectName == "Overfills Stamina" {
    //            specialEffectTwoImage.image = UIImage(named: (effectOfCellItem?.effectName)!)
    //            secondEffectsLabel.text = effectOfCellItem?.effectName
    //            if effectOfCellItem?.amount != nil {
    //                secondDurationLabel.text = String(format: "%.1f", (effectOfCellItem?.amount)!)
    //            }
    //            specialIngredientTwo.text = (effectOfCellItem?.effectIngredient)!+":"
    //        }
    //        
    //        if effectOfCellItem?.effectName == "Temporary Hearts" {
    //            specialEffectTwoImage.image = UIImage(named: (effectOfCellItem?.effectName)!)
    //            
    //            secondDurationLabel.text = String(format: " %.0f", (effectOfCellItem?.amount)!)
    //            secondPlusLabel.isHidden = false
    //            
    //            secondEffectsLabel.text = effectOfCellItem?.effectName
    //            specialIngredientTwo.text = (effectOfCellItem?.effectIngredient)!+":"
    //            
    //        }
    //    }
    func durationToString(duration: TimeInterval) -> String{
        
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.allowedUnits = [ .minute, .second ]
        formatter.zeroFormattingBehavior = [ .pad ]
        
        var formattedDuration = formatter.string(from: duration)
        formattedDuration?.append(" min")
        return formattedDuration!
    }
    
    func hideFirstEffect(){
        firstDurationLabel.isHidden = true
        firstEffectsLabel.text = "None"
        firstEffectsLabel.textColor = .gray
        firstEffectsLabel.font = UIFont.italicSystemFont(ofSize: 16.0)
    }
}
