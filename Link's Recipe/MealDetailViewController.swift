//
//  MealDetailViewController.swift
//  Link's Recipes
//
//  Created by Martin List on 24/03/2017.
//  Copyright © 2017 Martin List. All rights reserved.
//

import UIKit

class MealDetailViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var amountOfHeartsLabel: UILabel!
    @IBOutlet weak var amountOfHeartsImageView: UIImageView!
    
    @IBOutlet weak var firstIngredientLabel: UILabel!
    @IBOutlet weak var secondIngredientLabel: UILabel!
    @IBOutlet weak var thirdIngredientLabel: UILabel!
    @IBOutlet weak var fourthIngredientLabel: UILabel!
    @IBOutlet weak var fifthIngredientLabel: UILabel!
    
    @IBOutlet weak var firstNamePicker: UIPickerView!
    @IBOutlet weak var secondNamePicker: UIPickerView!
    @IBOutlet weak var thirdNamePicker: UIPickerView!
    @IBOutlet weak var fourthNamePicker: UIPickerView!
    
    @IBOutlet weak var effectLabel: UILabel!
    @IBOutlet weak var effectImageView: UIImageView!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var plusLabel: UILabel!
    
    @IBOutlet weak var favoriteButton: UIButton!
    
    var mealCell: Meal?
    var selectedEffect: String?
    
    var materials:[Material] = materialData
    var categoryItems: [String] = []
    
    var firstPickerData: [Material] = []
    var secondPickerData: [Material] = []
    var thirdPickerData: [Material] = []
    var fourthPickerData: [Material] = []
    
    
    var additionalDurationIncrease: [Material] = []
    var mainIngredientWithEffect: [Material] = []
    var additionalMainIngredient: Material?
    
    var heartsOfMainIngredients: Float = 0.0
 

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Delegate and Data Source for UIPicker.
        firstNamePicker.dataSource = self
        firstNamePicker.delegate = self
        
        secondNamePicker.dataSource = self
        secondNamePicker.delegate = self
        thirdNamePicker.dataSource = self
        thirdNamePicker.delegate = self
        fourthNamePicker.dataSource = self
        fourthNamePicker.delegate = self
        
        // By default, plusLabel & durationLabel are hidden. EffectLabel might display "None".
        durationLabel.isHidden = true
        plusLabel.isHidden = true
        
        // Setting meal name, calcHearts of meal and heartsImage.
        if mealCell != nil{
            nameLabel.text = mealCell?.name
            calcHeartsForMainIngredients()
            amountOfHeartsImageView.image = UIImage(named: "fullHeart")
        }
        
        // Checking if a category ingredient is in the meal, if yes, add to array.
        fillPickerData()
        
        var position: [Int] = [0, 0]
        if selectedEffect != nil{
            position = checkPickerForEarlyEffect()
        }
        
        // Setting the ingredient labels and check if an ingredient has an effect. If so, it gets displayed.
        setIngredientLabels()
        
        // Check, if Meal is already a favorite.
        let favoriteBool = checkFavorite()
        setFavorite(isItemFavorite: favoriteBool)
        
        // Default position of picker.
        firstNamePicker.selectRow(position[0], inComponent: 0, animated: true)
        secondNamePicker.selectRow(position[1], inComponent: 0, animated: true)
        thirdNamePicker.selectRow(0, inComponent: 0, animated: true)
        fourthNamePicker.selectRow(0, inComponent: 0, animated: true)
        
        checkPickers()
//        calcHeartsForCategoryIngredients()
//        pickerView(firstNamePicker, didSelectRow: 0, inComponent: 0)
        
        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {

        if pickerView == firstNamePicker {
            if firstPickerData.isEmpty == false {
                return firstPickerData.count
            }
            else {
                return 1
            }
        }
        if pickerView == secondNamePicker {
            if secondPickerData.isEmpty == false {
                return secondPickerData.count
            }
            else {
                return 1
            }
        }
        if pickerView == thirdNamePicker {
            if thirdPickerData.isEmpty == false {
                return thirdPickerData.count
            }
            else {
                return 1
            }
        }
        if pickerView == fourthNamePicker {
            if fourthPickerData.isEmpty == false {
                return fourthPickerData.count
            }
            else {
                return 1
            }
        }
        else {
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {

        let pickerLabel = UILabel()
        var titleData = "None"
        var myTitle: NSAttributedString
        myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 16.0),NSForegroundColorAttributeName:UIColor.gray])
        
        if pickerView == firstNamePicker {
                if firstPickerData.isEmpty == false {

                    titleData = firstPickerData[row].materialName
                    myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 16.0),NSForegroundColorAttributeName:UIColor.white])

            }
        }
        if pickerView == secondNamePicker {
            if secondPickerData.isEmpty == false {
                
                titleData = secondPickerData[row].materialName
                myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 16.0),NSForegroundColorAttributeName:UIColor.white])
                
            }
        }
        if pickerView == thirdNamePicker {
            if thirdPickerData.isEmpty == false {
                
                titleData = thirdPickerData[row].materialName
                myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 16.0),NSForegroundColorAttributeName:UIColor.white])
                
            }
        }
        if pickerView == fourthNamePicker {
            if fourthPickerData.isEmpty == false {
                
                titleData = fourthPickerData[row].materialName
                myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 16.0),NSForegroundColorAttributeName:UIColor.white])
                
            }
        }

        pickerLabel.attributedText = myTitle
        pickerLabel.textAlignment = .center
        return pickerLabel

    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        checkPickers()
    }
    
    func checkPickers(){

        var firstEffect: Effect?
        var secondEffect: Effect?
//        var thirdEffect: Effect?
//        var fourthEffect: Effect?
        var count: Int = 0
        
        if firstPickerData.isEmpty == false{
            firstEffect = firstPickerData[firstNamePicker.selectedRow(inComponent: 0)].effect!
            count = 1
        }
        if secondPickerData.isEmpty == false{
            secondEffect = secondPickerData[secondNamePicker.selectedRow(inComponent: 0)].effect!
            count = 2
        }
//        if thirdPickerData.isEmpty == false{
//            thirdEffect = thirdPickerData[thirdNamePicker.selectedRow(inComponent: 0)].effect!
//            count = 3
//        }
//        if fourthPickerData.isEmpty == false{
//            fourthEffect = fourthPickerData[fourthNamePicker.selectedRow(inComponent: 0)].effect!
//            count = 4
//        }
        print("Count: \(count)")
        switch count{
        case 1: checkForOnePicker(firstEffect: firstEffect!)
                secondNamePicker.isHidden = true
                thirdNamePicker.isHidden = true
                fourthNamePicker.isHidden = true
        
        case 2: checkForTwoPicker(firstEffect: firstEffect!, secondEffect: secondEffect!)
                thirdNamePicker.isHidden = true
                fourthNamePicker.isHidden = true
        
//        case 3: checkForThreePicker(firstEffect: firstEffect!, secondEffect: secondEffect!, thirdEffect: thirdEffect!)
//                fourthNamePicker.isHidden = true
        
//        case 4: checkForFourPicker(firstEffect: firstEffect!, secondEffect: secondEffect!, thirdEffect: thirdEffect!, fourthEffect: fourthEffect!)
        
        default:
//             setNone()
            firstNamePicker.isHidden = true
            secondNamePicker.isHidden = true
            thirdNamePicker.isHidden = true
            fourthNamePicker.isHidden = true
            
            
        }
    }
    
    func checkForOnePicker(firstEffect: Effect){
        print("One Picker")
        
        calcHeartsForCategoryIngredients()
        var amount: Float = 0.0
        var duration: Double = 0
        var singleAmount = true
        // If the picker item has only duration effect, go to else.
        if firstEffect.effectName != "Duration"{

            // Check if there is a main ingredient with an effect.
            if additionalMainIngredient != nil{

                
                // Check, if a main Ingredient has the same effect.
                if firstEffect.effectName == additionalMainIngredient?.effect?.effectName{

                    if additionalMainIngredient?.effect?.duration != nil{
                        duration = (additionalMainIngredient?.effect?.duration)!
                    }
                    if additionalMainIngredient?.effect?.amount != nil{
                        amount = (additionalMainIngredient?.effect?.amount)!
                        singleAmount = false
                    }
                }
                else {
                    // If it has not, no effect is displayed.

                    setNone()
                    return
                }
            }
        
            if firstEffect.duration != nil{
                setEffectWithDuration(effectOfPicker: firstEffect.effectName, duration: firstEffect.duration! + duration)
            }
            if firstEffect.amount != nil{
                setEffectWithAmount(effectOfPicker: firstEffect, optionalAmount: amount, singleAmount: singleAmount)
            }
        }
        else {
            print("Additional Main Ingredient verstärkt")

            if additionalMainIngredient != nil {
                if additionalMainIngredient?.effect?.duration != nil{

                    setEffectWithDuration(effectOfPicker: (additionalMainIngredient?.effect?.effectName)!, duration: firstEffect.duration! + (additionalMainIngredient?.effect?.duration)!)
                }
                if additionalMainIngredient?.effect?.amount != nil{
                    
                    setEffectWithAmount(effectOfPicker: (additionalMainIngredient?.effect)!, singleAmount: true)
                }
            }
            else{
                setNone()
            }
        }
    }
    
    func checkForTwoPicker(firstEffect: Effect, secondEffect: Effect){
        print("Two Picker")
        calcHeartsForCategoryIngredients()
        
        if firstEffect.effectName == secondEffect.effectName{
            if firstEffect.effectName == "Duration" && secondEffect.effectName == "Duration"{
                setNone()
            }
            else if firstEffect.duration != nil {
                let tempDuration = firstEffect.duration! + secondEffect.duration!
                setEffectWithDuration(effectOfPicker: firstEffect.effectName, duration: tempDuration)
            }
            else if firstEffect.amount != nil{
                
                // Amount options for Temporary Hearts and Overfilling Stamina.
                if firstEffect.effectName == "Temporary Hearts"{
                    setEffectWithAmount(effectOfPicker: firstEffect, optionalAmount: secondEffect.amount!, singleAmount: true )
                }
                else if firstEffect.effectName == "Overfills Stamina"{
                    
                    let tempEffect = Effect(effectName: "Overfills Stamina", amount: 0.4)
                    setEffectWithAmount(effectOfPicker: tempEffect, singleAmount: true )
                }
                else{
                    setEffectWithAmount(effectOfPicker: firstEffect, singleAmount: false)
                }
                
            }
        }
        else if firstEffect.effectName == "Duration" && secondEffect.effectName != "Duration"{
            if secondEffect.duration != nil{
                let tempDuration = firstEffect.duration! + secondEffect.duration!
                setEffectWithDuration(effectOfPicker: secondEffect.effectName, duration: tempDuration)
            }
            if secondEffect.amount != nil{
                setEffectWithAmount(effectOfPicker: secondEffect, singleAmount: true)
            }
        }
        else if (firstEffect.effectName != "Duration" && secondEffect.effectName == "Duration"){
            if firstEffect.duration != nil{
                let tempDuration = firstEffect.duration! + secondEffect.duration!
                setEffectWithDuration(effectOfPicker: firstEffect.effectName, duration: tempDuration)
            }
            if firstEffect.amount != nil{
                setEffectWithAmount(effectOfPicker: firstEffect, singleAmount: true)
            }
        }
        else {
            setNone()
        }
        
    }
    
    func checkForThreePicker(firstEffect: Effect, secondEffect: Effect, thirdEffect: Effect){
        print("Third Picker")
        calcHeartsForCategoryIngredients()
    }
    
    func checkForFourPicker(firstEffect: Effect, secondEffect: Effect, thirdEffect: Effect, fourthEffect: Effect){
        print("Four Picker")
        calcHeartsForCategoryIngredients()
        
        let durationAmount = calcAmountOfDurations(firstEffect: firstEffect, secondEffect: secondEffect, thirdEffect: thirdEffect, fourthEffect: fourthEffect)
        print ("Duration Amount: \(durationAmount)")
        
        switch durationAmount{
        case 1: compareForOneDuration(firstEffect: firstEffect, secondEffect: secondEffect, thirdEffect: thirdEffect, fourthEffect: fourthEffect)
        case 2: compareForTwoDurations(firstEffect: firstEffect, secondEffect: secondEffect, thirdEffect: thirdEffect, fourthEffect: fourthEffect)
        case 3: compareForThreeDurations(firstEffect: firstEffect, secondEffect: secondEffect, thirdEffect: thirdEffect, fourthEffect: fourthEffect)
        case 4: setNone()
        default:
            if firstEffect.effectName == secondEffect.effectName && firstEffect.effectName == thirdEffect.effectName && firstEffect.effectName == fourthEffect.effectName {
                if firstEffect.duration != nil {
                    var tempDuration = firstEffect.duration! + secondEffect.duration!
                    tempDuration = tempDuration + thirdEffect.duration! + fourthEffect.duration!
                    
                    setEffectWithDuration(effectOfPicker: firstEffect.effectName, duration: tempDuration)
                }
                if firstEffect.amount != nil {
                    setEffectWithAmount(effectOfPicker: firstEffect, singleAmount: true )
                }
            }
            else {
                setNone()
            }
        }
    }
    
    func compareForOneDuration(firstEffect: Effect, secondEffect: Effect, thirdEffect: Effect, fourthEffect: Effect){
        let effect: [Effect] = [firstEffect, secondEffect, thirdEffect, fourthEffect]
        var notDuration: [Effect] = []

        for items in effect{
            if items.effectName != "Duration" {
                notDuration.append(items)
            }
        }
        
        if (notDuration.first?.effectName == notDuration.last?.effectName) && (notDuration.last?.effectName == notDuration[1].effectName){
            if notDuration.first?.duration != nil{
                var tempDuration = firstEffect.duration! + secondEffect.duration!
                tempDuration = tempDuration + thirdEffect.duration! + fourthEffect.duration!
                
                setEffectWithDuration(effectOfPicker: (notDuration.first?.effectName)!, duration: tempDuration)
            }
            if notDuration.first?.amount != nil {
                setEffectWithAmount(effectOfPicker: (notDuration.first)!, singleAmount: true )
            }
        }
        else {
            setNone()
        }
    }
    
    func compareForTwoDurations(firstEffect: Effect, secondEffect: Effect, thirdEffect: Effect, fourthEffect: Effect){
        let effect: [Effect] = [firstEffect, secondEffect, thirdEffect, fourthEffect]
        var notDuration: [Effect] = []
        
        for items in effect{
            if items.effectName != "Duration" {
                notDuration.append(items)
            }
        }
        
        if notDuration.first?.effectName == notDuration.last?.effectName{
            if notDuration.first?.duration != nil{
                var tempDuration = firstEffect.duration! + secondEffect.duration!
                tempDuration = tempDuration + thirdEffect.duration! + fourthEffect.duration!
                
                setEffectWithDuration(effectOfPicker: (notDuration.first?.effectName)!, duration: tempDuration)
            }
            if notDuration.first?.amount != nil {
                setEffectWithAmount(effectOfPicker: (notDuration.first)!,  singleAmount: true)
            }
        }
        else {
            setNone()
        }
        
    }

    func compareForThreeDurations(firstEffect: Effect, secondEffect: Effect, thirdEffect: Effect, fourthEffect: Effect){
        let effect: [Effect] = [firstEffect, secondEffect, thirdEffect, fourthEffect]
        
        for items in effect{
            if items.effectName != "Duration" {
                if items.duration != nil {
                    var tempDuration = firstEffect.duration! + secondEffect.duration!
                    tempDuration = tempDuration + thirdEffect.duration! + fourthEffect.duration!
                    
                    setEffectWithDuration(effectOfPicker: items.effectName, duration: tempDuration)
                }
                if items.amount != nil {
                    setEffectWithAmount(effectOfPicker: items,  singleAmount: true )
                }
            }
        }
        
    }
    
    func calcAmountOfDurations(firstEffect: Effect, secondEffect: Effect, thirdEffect: Effect, fourthEffect: Effect) -> Int{
        
        let effect: [Effect] = [firstEffect, secondEffect, thirdEffect, fourthEffect]
        var count: Int = 0
        
        for items in effect{
            if items.effectName == "Duration"{
                count += 1
            }
        }
        return count
    }
    
    func setEffectWithAmount(effectOfPicker: Effect, optionalAmount: Float? = nil, singleAmount: Bool? = nil){
        effectLabel.text = effectOfPicker.effectName
        effectImageView.image = UIImage(named: effectOfPicker.effectName)
        effectLabel.font = UIFont.systemFont(ofSize: 16.0)
        
        var amount = effectOfPicker.amount!
        
        if optionalAmount != nil {
            amount += optionalAmount!
        }
        
        
        if effectOfPicker.effectName == "Restores Stamina" && singleAmount == false{
           amount = calculateAmountForRestoreStamina()
        }
        
        let result = String(format: " %.1f", amount)
        durationLabel.text = result
        plusLabel.isHidden = false
        durationLabel.isHidden = false
    }
    
    func calculateAmountForRestoreStamina() -> Float{
        var result: Float = 0.0
        
        if mealCell?.name == "Glazed Mushrooms"{
            result = 0.8
        }
        if mealCell?.name == "Fish and Mushroom Skewer"{
            result = 1.4
        }
        if mealCell?.name == "Glazed Seafood"{
            result = 1.6
            if firstPickerData[firstNamePicker.selectedRow(inComponent: 0)].materialName == "Bright-Eyed Crab" {
                result = 1.0
            }
        }
        
        return result
}
    
    func setNone(){
        effectLabel.text = "None"
        effectLabel.textColor = .gray
        effectLabel.font = UIFont.italicSystemFont(ofSize: 16.0)
        effectImageView.image = UIImage(named: "empty")
        durationLabel.isHidden = true
        plusLabel.isHidden = true
    }

    func calcHeartsForMainIngredients(){
        var fullRestore: Bool = false
        var hearts: Float
        hearts = 0.00
        for item in materialData {
            if item.hearts != nil{
                if mealCell?.firstIngredient == item.materialName {
                    hearts += item.hearts!
                    if item.effect?.effectName == "Temporary Hearts"{
                        fullRestore = true
                    }
                }
                if mealCell?.secondIngredient == item.materialName {
                    hearts += item.hearts!
                    if item.effect?.effectName == "Temporary Hearts"{
                        fullRestore = true
                    }
                }
                if mealCell?.thirdIngredient == item.materialName {
                    hearts += item.hearts!
                    if item.effect?.effectName == "Temporary Hearts"{
                        fullRestore = true
                    }
                }
                if mealCell?.fourthIngredient == item.materialName {
                    hearts += item.hearts!
                    if item.effect?.effectName == "Temporary Hearts"{
                        fullRestore = true
                    }
                }
                if mealCell?.fifthIngredient == item.materialName {
                    hearts += item.hearts!
                    if item.effect?.effectName == "Temporary Hearts"{
                        fullRestore = true
                    }
                }
            }
        }
        print("Hearts for main ingredients: \(hearts)")
        heartsOfMainIngredients = hearts
        hearts = hearts * 2
        setHearts(heartValueOfCellItem: hearts, fullHearts: fullRestore)
    }
    
    func calcHeartsForCategoryIngredients(){
        var fullRestore: Bool = false
        var categoryHearts: Float = 0.0
        
        if mealCell?.firstCategory != nil {
            if firstPickerData[firstNamePicker.selectedRow(inComponent: 0)].hearts != nil{
                categoryHearts += firstPickerData[firstNamePicker.selectedRow(inComponent: 0)].hearts!
                
                if firstPickerData[firstNamePicker.selectedRow(inComponent: 0)].effect?.effectName == "Temporary Hearts"{
                    fullRestore = true
                }
            }
        }
        if mealCell?.secondCategory != nil {
            if secondPickerData[secondNamePicker.selectedRow(inComponent: 0)].hearts != nil{
                categoryHearts += secondPickerData[secondNamePicker.selectedRow(inComponent: 0)].hearts!
                
                if secondPickerData[secondNamePicker.selectedRow(inComponent: 0)].effect?.effectName == "Temporary Hearts"{
                    fullRestore = true
                }
            }
        }
        if mealCell?.thirdCategory != nil {
            if thirdPickerData[thirdNamePicker.selectedRow(inComponent: 0)].hearts != nil{
                categoryHearts += thirdPickerData[thirdNamePicker.selectedRow(inComponent: 0)].hearts!
                
                if thirdPickerData[thirdNamePicker.selectedRow(inComponent: 0)].effect?.effectName == "Temporary Hearts"{
                    fullRestore = true
                }
            }
        }
        if mealCell?.fourthCategory != nil {
            if fourthPickerData[fourthNamePicker.selectedRow(inComponent: 0)].hearts != nil{
                categoryHearts += fourthPickerData[fourthNamePicker.selectedRow(inComponent: 0)].hearts!
                
                if fourthPickerData[fourthNamePicker.selectedRow(inComponent: 0)].effect?.effectName == "Temporary Hearts"{
                    fullRestore = true
                }
            }
        }
        
        let result = (heartsOfMainIngredients + categoryHearts) * 2
        print("Hearts for category ingredients: \(categoryHearts)")
        
        setHearts(heartValueOfCellItem: result, fullHearts: fullRestore)
    }
    
    func setHearts(heartValueOfCellItem: Float, fullHearts: Bool? = nil){
        let hearts = splitHeartsValue(heartsValue: heartValueOfCellItem)
        
        // If full hearts have to be displayed.
        if (hearts.fullHearts > 0) || (hearts.decimalHearts > 0.00){
            
            // If full health is restored, the label displays "full".
            if fullHearts == true {
                amountOfHeartsLabel.text = "full "
            } else {
                if hearts.decimalHearts > 0.00 {
                    amountOfHeartsLabel.text = String(format: "%.2f ", (heartValueOfCellItem))
                } else {
                    // Every other case, the label displays the number of restored full hearts.
                    amountOfHeartsLabel.text = String(format: "%d ", (hearts.fullHearts))
                }
            }
            
            // Setting the image for fullHeart.
            amountOfHeartsImageView.image = UIImage(named: "fullHeart")
        }
        
        if mealCell?.name == "Herb Sauté"{
            amountOfHeartsLabel.text = String(format: "2")
        }
    }
    
    func splitHeartsValue(heartsValue: Float) -> (fullHearts: Int, decimalHearts: Float){
        let fullHearts = Int(heartsValue)
        let decimalHearts = heartsValue - Float(fullHearts)
        
        return(fullHearts, decimalHearts)
    }
    
    func fillPickerData(){
        if mealCell?.firstCategory != nil {
            for items in materials{
                for tag in items.category{
                    if mealCell?.firstCategory == tag{
                        firstPickerData.append(items)
                        //            print(items.materialName)
                    }
                }
            }
        }
        if mealCell?.secondCategory != nil {
            for items in materials{
                for tag in items.category{
                    if mealCell?.secondCategory == tag{
                        secondPickerData.append(items)
                    }
                }
            }
        }
        if mealCell?.thirdCategory != nil {
            for items in materials{
                for tag in items.category{
                    if mealCell?.thirdCategory == tag{
                        thirdPickerData.append(items)
                    }
                }
            }
        }
        if mealCell?.fourthCategory != nil {
            for items in materials{
                for tag in items.category{
                    if mealCell?.fourthCategory == tag{
                        fourthPickerData.append(items)
                    }
                }
            }
        }
        
    }
    
    func setIngredientLabels(){
        
        firstIngredientLabel.text = mealCell?.firstIngredient
        secondIngredientLabel.text = mealCell?.secondIngredient
        thirdIngredientLabel.text = mealCell?.thirdIngredient
        fourthIngredientLabel.text = mealCell?.fourthIngredient
        fifthIngredientLabel.text = mealCell?.fifthIngredient

        setNone()

        if mealCell?.firstIngredient != nil {
            checkForMainIngredientEffects(ingredient: (mealCell?.firstIngredient)!)
        }
        if mealCell?.secondIngredient != nil {
            checkForMainIngredientEffects(ingredient: (mealCell?.secondIngredient)!)
        }
        if mealCell?.thirdIngredient != nil {
            checkForMainIngredientEffects(ingredient: (mealCell?.thirdIngredient)!)
        }
        if mealCell?.fourthIngredient != nil {
            checkForMainIngredientEffects(ingredient: (mealCell?.fourthIngredient)!)
        }
        if mealCell?.fifthIngredient != nil {
            checkForMainIngredientEffects(ingredient: (mealCell?.fifthIngredient)!)
        }
        
        handleMainIngredientEffects()
    }
    
    func calcAmountOfDurationsForMainIngredients() -> Int{
        
        var count: Int = 0
        
        for items in mainIngredientWithEffect{
            if items.effect?.effectName == "Duration"{
                additionalDurationIncrease.append(items)
                count += 1
            }
        }
        return count
    }
    
    func handleMainIngredientEffects(){
        
        
        if mainIngredientWithEffect.isEmpty == false{
            let count = calcAmountOfDurationsForMainIngredients()
            
            let difference = mainIngredientWithEffect.count - count
            
            print("Difference: \(difference)")
            
            switch difference {
            case 1:
                checkOneMainIngredientEffect()
            case 2:
                checkTwoMainIngredientEffect()
            default:
                setNone()
                
            }
        }
    }
    
    func checkOneMainIngredientEffect(){
        
        for item in mainIngredientWithEffect{
            if item.effect?.effectName != "Duration"{
                if item.effect?.duration != nil{
                    let tempDuration = item.effect?.duration
                    
                    additionalMainIngredient = item
                    setEffectWithDuration(effectOfPicker: (item.effect?.effectName)!, duration: tempDuration)
                }
                if item.effect?.amount != nil{
                    setEffectWithAmount(effectOfPicker: (item.effect)!)
                    
                    additionalMainIngredient = item
                }
            }
        }
    }
    
    func checkTwoMainIngredientEffect(){
//        var amount: Float = 0.0
        var duration: Double = 0
        
        if mainIngredientWithEffect.first?.effect?.effectName == mainIngredientWithEffect.last?.effect?.effectName{
            if mainIngredientWithEffect.first?.effect?.duration != nil{
                
                duration = (mainIngredientWithEffect.first?.effect?.duration)! + (mainIngredientWithEffect.last?.effect?.duration)!
                setEffectWithDuration(effectOfPicker: (mainIngredientWithEffect.first?.effect?.effectName)!, duration: duration)
                
                additionalMainIngredient = Material(materialName: "empty", category: ["empty"], effect: Effect(effectName: (mainIngredientWithEffect.first?.effect?.effectName)!, duration: duration))
            }
        }
        else{
            print("huhu")
            additionalMainIngredient = Material(materialName: "empty", category: ["empty"], effect: Effect(effectName: "empty"))
            
        }
    }
    
    func setOnlyDuration(duration: TimeInterval? = nil){
        
        let result = durationToString(duration: duration!)
        
        durationLabel.text = result
        durationLabel.isHidden = false
    
    }
    
    func durationToString(duration: TimeInterval) -> String{
        var effectDuration = duration
//        print("Duration: \(effectDuration)")

        
        if additionalDurationIncrease.isEmpty == false {
            for durations in additionalDurationIncrease {
                effectDuration += (durations.effect?.duration)!
            }
        }
        
        if effectDuration > 1800{
            effectDuration = 1800
        }
        
//        print("Duration: \(effectDuration)")

        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.allowedUnits = [ .minute, .second ]
        formatter.zeroFormattingBehavior = [ .pad ]
        
        var formattedDuration = formatter.string(from: effectDuration)
        formattedDuration?.append(" min")
        return formattedDuration!
    }
    
    func parseDuration(_ timeString:String) -> TimeInterval {
        guard !timeString.isEmpty else {
            return 0
        }
        
        var interval:Double = 0
        
        let parts = timeString.components(separatedBy: ":")
        for (index, part) in parts.reversed().enumerated() {
            interval += (Double(part) ?? 0) * pow(Double(60), Double(index))
        }
        
        return interval
    }
    
    func setEffectWithDuration(effectOfPicker: String, duration: TimeInterval? = nil){
        
        effectLabel.text = effectOfPicker
        effectImageView.image = UIImage(named: effectOfPicker)
        effectLabel.font = UIFont.systemFont(ofSize: 16.0)
        
        
        let result = durationToString(duration: duration!)

//        print("Here: \(result)")
        
        durationLabel.text = result
        durationLabel.isHidden = false
    }

    func checkForMainIngredientEffects(ingredient: String){
        
        for items in materials{
            if ingredient == items.materialName{
                if items.effect != nil{

                     mainIngredientWithEffect.append(items)
//                    if items.effect?.amount != nil {
//                        effectLabel.text = items.effect?.effectName
//                        effectLabel.font = UIFont.systemFont(ofSize: 16.0)
//                        effectImageView.image = UIImage(named: (items.effect?.effectName)!)
//                        
//                        let result = String(format: " %.1f", (items.effect?.amount!)!)
//                        durationLabel.text = result
//                        durationLabel.isHidden = false
//                        plusLabel.isHidden = true
//                        
//                        mainIngredientWithEffect.append(items)
//                    }
//                    if items.effect?.duration != nil {
//                        let result = durationToString(duration: (items.effect?.duration!)!)
//
//                        // If main ingredient has additional duration effect.
//                        if items.effect?.effectName == "Duration" {
//                            
//                            additionalDurationIncrease.append(items)
////                            effectLabel.text = "None"
////                            effectLabel.textColor = .gray
////                            effectLabel.font = UIFont.italicSystemFont(ofSize: 16.0)
////                            setNone()
//                            print("Additional : \(items.materialName)")
//                        }
//                        else{
//                            effectLabel.text = items.effect?.effectName
//                            effectLabel.font = UIFont.systemFont(ofSize: 16.0)
//                            effectImageView.image = UIImage(named: (items.effect?.effectName)!)
//                            
//                            durationLabel.text = result
//                            durationLabel.isHidden = false
//                            
//                            mainIngredientWithEffect.append(items)
//                        }
//                        print("Effect: \(result)")
//                    }
//                    
                }
            }
        }
    }

    @IBAction func favoriteButtonTouchUpInside(_ sender: Any) {
//        favoriteButton.setImage(UIImage(named: "Favorite"), for: UIControlState.normal)

        var favorites: [String] = []
        let defaults = UserDefaults.standard
        if let favoritesDefaults = defaults.object(forKey: "favorites"){
            favorites = favoritesDefaults as! [String]
        }
        
        let favoriteBool = checkFavorite()
        
        if favoriteBool == false {
            setFavorite(isItemFavorite: true)
            favorites.append((mealCell?.name)!)
            defaults.set(favorites, forKey: "favorites")
            defaults.synchronize()
            print(favorites)
            
            NotificationCenter.default.post(name: Notification.Name(rawValue: "refresh"), object: nil, userInfo: nil)


        }
        else {
            setFavorite(isItemFavorite: false)
            removeFavorite(name: (mealCell?.name)!)
            
            NotificationCenter.default.post(name: Notification.Name(rawValue: "refresh"), object: nil, userInfo: nil)
            
        }
        
    }

    func checkFavorite() -> Bool{
        var favorites: [String] = []
        let defaults = UserDefaults.standard
        
        if let favoritesDefaults = defaults.object(forKey: "favorites"){
            favorites = favoritesDefaults as! [String]
        }
        
        for item in favorites{
            if mealCell?.name == item{
                return true
            }
        }
        return false
    }
    
    func setFavorite(isItemFavorite: Bool){
        if isItemFavorite == true {
            favoriteButton.setImage(UIImage(named: "Favorite"), for: UIControlState.normal)
        }
        else {
            favoriteButton.setImage(UIImage(named: "Unfavorite"), for: UIControlState.normal)
        }
    }
    func removeFavorite(name: String){
        var favorites: [String] = []
        let defaults = UserDefaults.standard
        
        if let favoritesDefaults = defaults.object(forKey: "favorites"){
            favorites = favoritesDefaults as! [String]
        }
        
        let position = favorites.index(of: (mealCell?.name)!)
        favorites.remove(at: position!)
       
        defaults.set(favorites, forKey: "favorites")
        defaults.synchronize()
        print(favorites)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func checkPickerForEarlyEffect() -> [Int]{
        var position: [Int] = [0, 0]
        var success = false
        
        if selectedEffect != nil{
            
            // First picker.
            for (index, items) in firstPickerData.enumerated(){
                if items.effect?.effectName == selectedEffect{
                    position[0] = index
                    print("Gott y'a at: \(position)")
                    success = true
                    
                    // If successful, secondPicker set to Duration item.
                    if mealCell?.secondCategory != nil{
                        for (number, item) in secondPickerData.enumerated(){
                            if item.effect?.effectName == "Duration"{
                                position[1] = number
                                break
                            }
                        }
                    }
                    break
                }
            }
            
            if success == false{
                for (index, items) in secondPickerData.enumerated(){
                    if items.effect?.effectName == selectedEffect{
                        position[1] = index
                        print("Gott y'a at: \(position)")
                        success = true
                        
                        // If successful, firstPicker set to Duration item.
                        if mealCell?.firstCategory != nil{
                            for (number, item) in firstPickerData.enumerated(){
                                if item.effect?.effectName == "Duration"{
                                    position[0] = number
                                    break
                                }
                            }
                        }
                        break
                    }
                }
            }
        }
        
        return position
    }

}
