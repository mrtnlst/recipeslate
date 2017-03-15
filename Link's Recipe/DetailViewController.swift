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
    @IBOutlet weak var heartsLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    
    @IBOutlet weak var firstIngredientLabel: UILabel!
    @IBOutlet weak var secondIngredientLabel: UILabel!
    @IBOutlet weak var thirdIngredientLabel: UILabel!
    @IBOutlet weak var fourthIngredientLabel: UILabel!
    @IBOutlet weak var fifthIngredientLabel: UILabel!
    
    var mealCell: Meal?
    var elixirCell: Elixir?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (mealCell != nil){
            setLabels(type: "Meal")
        }
        if (elixirCell != nil){
            setLabels(type: "Elixir")
        }

    }

    func setLabels(type: String){
        
        if type == "Meal" {
            
            nameLabel.text = mealCell?.name
            heartsLabel.text = String(format: "Restores %.2f hearts", (mealCell?.hearts)!)
            
            if ((mealCell?.effect) != nil){
                effectsLabel.text = mealCell?.effect
            } else {effectsLabel.text = " "}
            if ((mealCell?.duration) != nil){
                durationLabel.text = mealCell?.duration
            } else {durationLabel.text = " "}
            
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
            
            if ((elixirCell?.hearts) != nil){
                heartsLabel.text = String(format: "Restores %.2f hearts", (elixirCell?.hearts)!)
            } else {heartsLabel.text = " "}
            
            firstIngredientLabel.text = elixirCell?.ingredientNames.firstIngredient
            secondIngredientLabel.text = elixirCell?.ingredientNames.secondIngredient
            thirdIngredientLabel.text = elixirCell?.ingredientNames.thirdIngredient
            fourthIngredientLabel.text = elixirCell?.ingredientNames.fourthIngredient
            fifthIngredientLabel.text = elixirCell?.ingredientNames.fifthIngredient
        }
    }
}
