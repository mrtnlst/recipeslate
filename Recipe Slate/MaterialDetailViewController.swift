//
//  FoodDetailViewController.swift
//  Link's Recipes
//
//  Created by Martin List on 25/03/2017.
//  Copyright © 2017 Martin List. All rights reserved.
//


import UIKit

class MaterialDetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var rawHeartsValue: UILabel!
    @IBOutlet weak var roastedHeartsValue: UILabel!
    @IBOutlet weak var cookedHeartsValue: UILabel!
    @IBOutlet weak var frozenHeartsValue: UILabel!
    @IBOutlet weak var frozenMinutesValue: UILabel!
    
    @IBOutlet weak var rawHeartsImage: UIImageView!
    @IBOutlet weak var roastedHeartsImage: UIImageView!
    @IBOutlet weak var cookedHeartsImage: UIImageView!
    @IBOutlet weak var frozenHeartsImage: UIImageView!
    @IBOutlet weak var frozenEffectImage: UIImageView!
    
    @IBOutlet weak var effectNameLabel: UILabel!
    @IBOutlet weak var effectImage: UIImageView!
    @IBOutlet weak var durationOrAmountLabel: UILabel!
    @IBOutlet weak var plusLabel: UILabel!
    
    
    var materialCell: Material?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if materialCell != nil{
            setLabels()
            if materialCell?.hearts != nil{
                setRawHearts()
                calcCookedHearts()
            }
            else {
                setNone(label: rawHeartsValue, heartsImage: rawHeartsImage)
                setNone(label: cookedHeartsValue, heartsImage: cookedHeartsImage)
            }
            checkForRoastedHearts()
            checkForFrozenHearts()

        }
    }
    
    func setLabels(){
        nameLabel.text = materialCell?.materialName
        setEffect()
    }
    
    func calcHeartsImages(heartsValue: Float) -> (fullHearts: Int, decimalHearts: Float){
        let fullHearts = Int(heartsValue)
        let decimalHearts = heartsValue - Float(fullHearts)
        
        return(fullHearts, decimalHearts)
    }
    
    func setHearts(label: UILabel, heartsImage: UIImageView){
        let hearts = calcHeartsImages(heartsValue: (materialCell?.hearts)!)
        
        // If full hearts have to be displayed.
        if (hearts.fullHearts > 0) || (hearts.decimalHearts > 0.00){
            
            // If full health is restored, the label displays "full".
            if hearts.fullHearts == 100 {
                label.text = "full "
            } else {
                if hearts.decimalHearts > 0.00 {
                    label.text = String(format: "%.2f ", (materialCell?.hearts)!)
                } else {
                    // Every other case, the label displays the number of restored full hearts.
                    label.text = String(format: "%d ", (hearts.fullHearts))
                }
            }
            
            if materialCell?.materialName == "Acorn" ||  materialCell?.materialName == "Chickaloo Tree Nut"{
                label.text = String(format: "0.25 ")
            }
            // Setting the image for fullHeart.
            heartsImage.image = UIImage(named: "fullHeart")
            }
        }
    
    
    func setRawHearts(){
        setHearts(label: rawHeartsValue, heartsImage: rawHeartsImage)
    }
    
    func calcCookedHearts(){
        let hearts = calcHeartsImages(heartsValue: (materialCell?.hearts)! * 2.0)
    
        if materialCell?.effect?.effectName == "Temporary Hearts" {
                cookedHeartsValue.text = "full "
            } else {
                if hearts.decimalHearts > 0.00 {
                    cookedHeartsValue.text = String(format: "%.2f ", (materialCell?.hearts)!)
                } else {
                    // Every other case, the label displays the number of restored full hearts.
                    cookedHeartsValue.text = String(format: "%d ", (hearts.fullHearts))
                }
            }
            // Setting the image for fullHeart.
            cookedHeartsImage.image = UIImage(named: "fullHeart")
        
    }
 
    func checkForRoastedHearts(){
        var success = false
        
        for item in roastedFoodData{
            for ingredient in item.ingredientNames{
                if materialCell?.materialName == ingredient{
                    roastedHeartsImage.image = UIImage(named: "fullHeart")
                    roastedHeartsValue.text = String(format: "%.2f ", item.hearts)
                    success = true
                }
            }
        }
        
        if success == false {
            setNone(label: roastedHeartsValue, heartsImage: roastedHeartsImage)
        }
    }
    
    func checkForFrozenHearts(){
        var success = false
        
        for item in frozenFoodData{
            for ingredient in item.ingredientNames{
                if materialCell?.materialName == ingredient{
                    frozenHeartsImage.image = UIImage(named: "fullHeart")
                    frozenHeartsValue.text = String(format: "%.2f ", item.hearts)
                    success = true
                }
            }
        }
        
        if success == false {
            setNone(label: frozenHeartsValue, heartsImage: frozenHeartsImage)
            hideFrozenEffect()
        }
    }

    func setEffect(){
        if materialCell?.effect != nil{
            effectNameLabel.text = materialCell?.effect?.effectName
            effectImage.image = UIImage(named: (materialCell?.effect?.effectName)!)
            
            var durationOrAmountText: String = ""
            
            if materialCell?.effect?.duration != nil{
                durationOrAmountText = durationToString(duration: (materialCell?.effect?.duration)!)
                
            }
            else{
                durationOrAmountText = String(format: " %.1f", (materialCell?.effect?.amount)!)
            }
            durationOrAmountLabel.text = durationOrAmountText
        }
    }
    
    
    func durationToString(duration: TimeInterval) -> String{
        
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.allowedUnits = [ .minute, .second ]
        formatter.zeroFormattingBehavior = [ .pad ]
        
        var formattedDuration = formatter.string(from: duration)
        formattedDuration?.append(" min")
        return formattedDuration!
    }
    
    func setNone(label: UILabel, heartsImage: UIImageView){
        label.text = "None"
        label.textColor = .gray
        label.font = UIFont.italicSystemFont(ofSize: 17.0)
        heartsImage.image = UIImage(named: "empty")
    }
    
    func hideFrozenEffect(){
        frozenEffectImage.image = UIImage(named: "empty")
        frozenMinutesValue.isHidden = true
    }
}
