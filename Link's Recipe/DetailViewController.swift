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
    @IBOutlet weak var numberOfHeartsLabel: UILabel!

    @IBOutlet weak var firstIngredientLabel: UILabel!
    @IBOutlet weak var secondIngredientLabel: UILabel!
    @IBOutlet weak var thirdIngredientLabel: UILabel!
    @IBOutlet weak var fourthIngredientLabel: UILabel!
    @IBOutlet weak var fifthIngredientLabel: UILabel!
    
    var currentCell: Meal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setLabels()
        

    }

    func setLabels(){
        nameLabel.text = currentCell?.name
        numberOfHeartsLabel.text = String(format: "Hearts: %f", (currentCell?.hearts)!)
        
        firstIngredientLabel.text = currentCell?.ingredientNames.firstIngredient
        secondIngredientLabel.text = currentCell?.ingredientNames.secondIngredient
        thirdIngredientLabel.text = currentCell?.ingredientNames.thirdIngredient
        fourthIngredientLabel.text = currentCell?.ingredientNames.fourthIngredient
        fifthIngredientLabel.text = currentCell?.ingredientNames.fifthIngredient
    }
}
