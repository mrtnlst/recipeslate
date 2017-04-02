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
    
    var mealCell: Meal?
    var materials:[Material] = materialData
    var categoryItems: [String] = []
    
    var firstPickerData: [Material] = []
    var secondPickerData: [Material] = []
    var thirdPickerData: [Material] = []
    var fourthPickerData: [Material] = []
    
    
    var additionalDurationIncrease: [Material] = []
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
        
        // Setting the ingredient labels and check if an ingredient has an effect. If so, it gets displayed.
        setIngredientLabels()
        
        // Default position of picker.
        firstNamePicker.selectRow(0, inComponent: 0, animated: true)
        secondNamePicker.selectRow(0, inComponent: 0, animated: true)
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
        
        if firstEffect.effectName != "Duration"{
            if firstEffect.duration != nil{
                setEffectWithDuration(effectOfPicker: firstEffect.effectName, duration: firstEffect.duration)
            }
            if firstEffect.amount != nil{
                setEffectWithAmount(effectOfPicker: firstEffect)
            }
        }
        else {
            setNone()
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
                if firstEffect.effectName == "Temporary Hearts"{
                    setEffectWithAmount(effectOfPicker: firstEffect, optionalAmount: secondEffect.amount!)
                }
            }
        }
        else if firstEffect.effectName == "Duration" && secondEffect.effectName != "Duration"{
            if secondEffect.duration != nil{
                let tempDuration = firstEffect.duration! + secondEffect.duration!
                setEffectWithDuration(effectOfPicker: secondEffect.effectName, duration: tempDuration)
            }
            if secondEffect.amount != nil{
                setEffectWithAmount(effectOfPicker: secondEffect)
            }
        }
        else if (firstEffect.effectName != "Duration" && secondEffect.effectName == "Duration"){
            if firstEffect.duration != nil{
                let tempDuration = firstEffect.duration! + secondEffect.duration!
                setEffectWithDuration(effectOfPicker: firstEffect.effectName, duration: tempDuration)
            }
            if firstEffect.amount != nil{
                setEffectWithAmount(effectOfPicker: firstEffect)
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
                    setEffectWithAmount(effectOfPicker: firstEffect)
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
                setEffectWithAmount(effectOfPicker: (notDuration.first)!)
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
                setEffectWithAmount(effectOfPicker: (notDuration.first)!)
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
                    setEffectWithAmount(effectOfPicker: items)
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
    
    func setEffectWithAmount(effectOfPicker: Effect, optionalAmount: Float? = nil){
        effectLabel.text = effectOfPicker.effectName
        effectImageView.image = UIImage(named: effectOfPicker.effectName)
        effectLabel.font = UIFont.systemFont(ofSize: 16.0)
        
        var amount = effectOfPicker.amount!
        
        if optionalAmount != nil {
            amount += optionalAmount!
        }
    
        let result = String(format: " %.1f", amount)
        durationLabel.text = result
        plusLabel.isHidden = false
        durationLabel.isHidden = false
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
    }
    
    func splitHeartsValue(heartsValue: Float) -> (fullHearts: Int, decimalHearts: Float){
        let fullHearts = Int(heartsValue)
        let decimalHearts = heartsValue - Float(fullHearts)
        
        return(fullHearts, decimalHearts)
    }
    
    func fillPickerData(){
        if mealCell?.firstCategory != nil {
            for items in materials{
                if mealCell?.firstCategory == items.category.mainCategory || mealCell?.firstCategory == items.category.subCategory{
                    firstPickerData.append(items)
                    print(items.materialName)
                }
            }
        }
        if mealCell?.secondCategory != nil {
            for items in materials{
                if mealCell?.secondCategory == items.category.mainCategory || mealCell?.secondCategory == items.category.subCategory{
                    secondPickerData.append(items)
                    print(items.materialName)
                }
            }
        }
        if mealCell?.thirdCategory != nil {
            for items in materials{
                if mealCell?.thirdCategory == items.category.mainCategory || mealCell?.thirdCategory == items.category.subCategory{
                    thirdPickerData.append(items)
                    print(items.materialName)
                }
            }
        }
        if mealCell?.fourthCategory != nil {
            for items in materials{
                if mealCell?.fourthCategory == items.category.mainCategory || mealCell?.fourthCategory == items.category.subCategory{
                    fourthPickerData.append(items)
                    print(items.materialName)
                }
            }
        }
//        else {
//        secondNamePicker.removeFromSuperview()
//        }
        
    }
    
    func setIngredientLabels(){
        
        firstIngredientLabel.text = mealCell?.firstIngredient
        secondIngredientLabel.text = mealCell?.secondIngredient
        thirdIngredientLabel.text = mealCell?.thirdIngredient
        fourthIngredientLabel.text = mealCell?.fourthIngredient
        fifthIngredientLabel.text = mealCell?.fifthIngredient

        setNone()

        if mealCell?.firstIngredient != nil {
            setEffectLabelForMainIngredients(ingredient: (mealCell?.firstIngredient)!)
        }
        
        if mealCell?.secondIngredient != nil {
            setEffectLabelForMainIngredients(ingredient: (mealCell?.secondIngredient)!)
        }
        if mealCell?.thirdIngredient != nil {
            setEffectLabelForMainIngredients(ingredient: (mealCell?.thirdIngredient)!)
        }
        if mealCell?.fourthIngredient != nil {
            setEffectLabelForMainIngredients(ingredient: (mealCell?.fourthIngredient)!)
        }
        if mealCell?.fifthIngredient != nil {
            setEffectLabelForMainIngredients(ingredient: (mealCell?.fifthIngredient)!)
        }
//        else {
//            setNone()
//        }
    }
    
    func setOnlyDuration(duration: TimeInterval? = nil){
//        effectLabel.text = effectOfPicker.effectName
//        effectImageView.image = UIImage(named: effectOfPicker.effectName)
//        effectLabel.font = UIFont.systemFont(ofSize: 16.0)
        
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

    func setEffectLabelForMainIngredients(ingredient: String){
        
        for items in materials{
            if ingredient == items.materialName{
                if items.effect != nil{

                    
                    
                    if items.effect?.amount != nil {
                        effectLabel.text = items.effect?.effectName
                        effectLabel.font = UIFont.systemFont(ofSize: 16.0)
                        effectImageView.image = UIImage(named: (items.effect?.effectName)!)
                        
                        let result = String(format: " %.1f", (items.effect?.amount!)!)
                        durationLabel.text = result
                        durationLabel.isHidden = false
                        plusLabel.isHidden = true
                    }
                    if items.effect?.duration != nil {
                        let result = durationToString(duration: (items.effect?.duration!)!)

                        // If main ingredient has additional duration effect.
                        if items.effect?.effectName == "Duration" {
                            
                            additionalDurationIncrease.append(items)
//                            effectLabel.text = "None"
//                            effectLabel.textColor = .gray
//                            effectLabel.font = UIFont.italicSystemFont(ofSize: 16.0)
//                            setNone()
                            print("Additional : \(items.materialName)")
                        }
                        else{
                            effectLabel.text = items.effect?.effectName
                            effectLabel.font = UIFont.systemFont(ofSize: 16.0)
                            effectImageView.image = UIImage(named: (items.effect?.effectName)!)
                            
                            durationLabel.text = result
                            durationLabel.isHidden = false
                        }
                        print("Effect: \(result)")
                    }
                    
                } 
            }
        }
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

}
