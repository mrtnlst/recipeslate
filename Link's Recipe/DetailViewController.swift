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
    
    @IBOutlet weak var firstHeartImage: UIImageView!
    @IBOutlet weak var secondHeartImage: UIImageView!
    @IBOutlet weak var thirdHeartImage: UIImageView!
    @IBOutlet weak var fourthHeartImage: UIImageView!
    @IBOutlet weak var fifthHeartImage: UIImageView!
    @IBOutlet weak var sixthHeartImage: UIImageView!
    @IBOutlet weak var seventhHeartImage: UIImageView!
    @IBOutlet weak var eigthHeartImage: UIImageView!
    @IBOutlet weak var ninthHeartImage: UIImageView!
    @IBOutlet weak var tenthHeartImage: UIImageView!
    
    var mealCell: Meal?
    var elixirCell: Elixir?
    var foodCell: Food?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (mealCell != nil){
            setLabels(type: "Meal")
            setHearts(heartValueOfCellItem: (mealCell?.hearts)!)
            setEffects(effectOfCellItem: (mealCell?.effect)!)
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
            //heartsLabel.text = String(format: "Restores %.2f hearts", (mealCell?.hearts)!)
            
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
            
            firstIngredientLabel.text = mealCell?.ingredientNames.firstIngredient
            secondIngredientLabel.text = mealCell?.ingredientNames.secondIngredient
            thirdIngredientLabel.text = mealCell?.ingredientNames.thirdIngredient
            fourthIngredientLabel.text = mealCell?.ingredientNames.fourthIngredient
            fifthIngredientLabel.text = mealCell?.ingredientNames.fifthIngredient
        }
        if type == "Elixir" {
        
            nameLabel.text = elixirCell?.name
            effectsLabel.text = elixirCell?.effect
            durationLabel.text = elixirCell?.duration
            

            if ((elixirCell?.duration) != nil){
                durationLabel.text = elixirCell?.duration
            } else {durationLabel.text = " "}
            
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
        var position = 100
        let imageForDecimalHeart: String
        
        if hearts.fullHearts > 0 {
            switch(hearts.fullHearts){
            case 10:
                if let firstHeart = view.viewWithTag(109) as? UIImageView{
                    firstHeart.image = UIImage(named: "fullHeart")}
                position += 1
                fallthrough

            case 9:
                if let firstHeart = view.viewWithTag(108) as? UIImageView{
                    firstHeart.image = UIImage(named: "fullHeart")}
                position += 1
                fallthrough

            case 8:
                if let firstHeart = view.viewWithTag(107) as? UIImageView{
                    firstHeart.image = UIImage(named: "fullHeart")}
                position += 1
                fallthrough

            case 7:
                if let firstHeart = view.viewWithTag(106) as? UIImageView{
                    firstHeart.image = UIImage(named: "fullHeart")}
                position += 1
                fallthrough
            case 6:
                if let firstHeart = view.viewWithTag(105) as? UIImageView{
                    firstHeart.image = UIImage(named: "fullHeart")}
                position += 1
                fallthrough
            case 5:
                if let firstHeart = view.viewWithTag(104) as? UIImageView{
                    firstHeart.image = UIImage(named: "fullHeart")}
                position += 1
                fallthrough
            case 4:
                if let firstHeart = view.viewWithTag(103) as? UIImageView{
                    firstHeart.image = UIImage(named: "fullHeart")}
                position += 1
                fallthrough
            case 3:
                if let firstHeart = view.viewWithTag(102) as? UIImageView{
                    firstHeart.image = UIImage(named: "fullHeart")}
                position += 1
                fallthrough
            case 2:
                if let firstHeart = view.viewWithTag(101) as? UIImageView{
                    firstHeart.image = UIImage(named: "fullHeart")}
                position += 1
                fallthrough
            case 1:
                if let firstHeart = view.viewWithTag(100) as? UIImageView{
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
            if let firstHeart = view.viewWithTag(position) as? UIImageView{
                firstHeart.image = UIImage(named: imageForDecimalHeart)}
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
