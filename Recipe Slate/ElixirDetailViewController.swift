//
//  ElixirDetailViewController.swift
//  Link's Recipes
//
//  Created by Martin List on 22/03/2017.
//  Copyright © 2017 Martin List. All rights reserved.
//

import UIKit

class ElixirDetailViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var effectNameLabel: UILabel!
    @IBOutlet weak var effectImageView: UIImageView!
    
    @IBOutlet weak var critterNamePicker: UIPickerView!
    @IBOutlet weak var critterAmountPicker: UIPickerView!

    @IBOutlet weak var monsterNamePicker: UIPickerView!
    @IBOutlet weak var monsterAmountPicker: UIPickerView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var durationAmountLabel: UILabel!
    @IBOutlet weak var resultImageView: UIImageView!
    
    @IBOutlet weak var potencyLabel: UILabel!
    @IBOutlet weak var potencyImage1: UIImageView!
    @IBOutlet weak var potencyImage2: UIImageView!
    @IBOutlet weak var potencyImage3: UIImageView!
   
    // Chosen item from UITableview list.
    var elixirCell: Elixir?
    
    // Array with generalData.
    var critters:[Critter] = critterData
    var monsterParts:[MonsterPart] = monsterPartData
    var chosenCritter:[Critter] = []
    
    // Arrays for UIPicker.
    var amount: [String] = ["1", "2", "3", "4"]
    var critterNames: [String] = []
    
    // Those are used for calculation.
    var selectedCritterDuration: TimeInterval?
    var critterDurationForEffect: [TimeInterval] = []
    var selectedCritterAmount: Float?
    var critterAmountForEffect: [Float] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        critterNamePicker.dataSource = self
        critterNamePicker.delegate = self
        critterAmountPicker.dataSource = self
        critterAmountPicker.delegate = self
        
        monsterNamePicker.dataSource = self
        monsterNamePicker.delegate = self
        monsterAmountPicker.dataSource = self
        monsterAmountPicker.delegate = self
        
        // Select correct critter names & duration based on what elixir was chosen.
            for item in critters{
                if item.category == elixirCell?.category{
                    critterNames.append(item.name)
                    chosenCritter.append(item)
                    if item.duration != nil {
                        critterDurationForEffect.append(item.duration!)
                    }
                    else {
                        critterAmountForEffect.append(item.amount!)
                    }
                }
            }
       
        // Pre-load UIPicker and execute them.
        critterNamePicker.selectRow(0, inComponent: 0, animated: true)
        critterAmountPicker.selectRow(0, inComponent: 0, animated: true)
        
        monsterNamePicker.selectRow(0, inComponent: 0, animated: true)
        monsterAmountPicker.selectRow(0, inComponent: 0, animated: true)

        pickerView(critterNamePicker, didSelectRow: 0, inComponent: 0)
        pickerView(critterAmountPicker, didSelectRow: 0, inComponent: 0)
        
        // Setting the name and effect label.
        if elixirCell != nil{
            nameLabel.text = elixirCell?.name
            effectNameLabel.text = elixirCell?.effect
            effectImageView.image = UIImage(named: (elixirCell?.effect)!)
            resultImageView.image = UIImage(named: (elixirCell?.effect)!)
        }

        // Do any additional setup after loading the view.
    }

    // UIPickerView Delegates
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == critterNamePicker{
           return critterNames.count
        }
//        if pickerView == critterAmountPicker {
//            return amount.count
//        }
        if pickerView == monsterNamePicker{
            return monsterPartData.count
        }
        else {
            return amount.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        if pickerView == critterNamePicker{
            let pickerLabel = UILabel()
            let titleData = critterNames[row]
            let myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 16.0),NSForegroundColorAttributeName:UIColor.white])
            pickerLabel.textAlignment = .center
            pickerLabel.attributedText = myTitle
            return pickerLabel
        }
        if pickerView == monsterNamePicker {
            let pickerLabel = UILabel()
            let titleData = monsterPartData[row].name
            let myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 16.0),NSForegroundColorAttributeName:UIColor.white])
            pickerLabel.textAlignment = .center
            pickerLabel.attributedText = myTitle
            return pickerLabel
        }
        else {
            let pickerLabel = UILabel()
            let titleData = amount[row]
            let myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 16.0),NSForegroundColorAttributeName:UIColor.white])
            pickerLabel.textAlignment = .center
            pickerLabel.attributedText = myTitle
            return pickerLabel
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        // Check wrong UIPicker Position.
        if pickerView == critterAmountPicker {
            if (critterAmountPicker.selectedRow(inComponent: 0) + 1 + monsterAmountPicker.selectedRow(inComponent: 0) + 1) > 5{
                let position = 5 - (monsterAmountPicker.selectedRow(inComponent: 0) + 1)
                critterAmountPicker.selectRow(position - 1, inComponent: 0, animated: true)
            }
        }
        
        if pickerView == monsterAmountPicker {
            if (critterAmountPicker.selectedRow(inComponent: 0) + 1 + monsterAmountPicker.selectedRow(inComponent: 0) + 1) > 5{
                let position = 5 - (critterAmountPicker.selectedRow(inComponent: 0) + 1)
                monsterAmountPicker.selectRow(position - 1, inComponent: 0, animated: true)
            }
        }
        
        // Saving duration or amount into variable.
        if pickerView == critterNamePicker{
            if critterDurationForEffect.isEmpty == false {
                selectedCritterDuration = critterDurationForEffect[row]
            }
            else {
                selectedCritterAmount = critterAmountForEffect[row]
            }
        }
        
        // Updating the resultLabel.
        if selectedCritterDuration != nil {
            var result =
                selectedCritterDuration! * Double(critterAmountPicker.selectedRow(inComponent: 0) + 1) +
                Double(monsterAmountPicker.selectedRow(inComponent: 0) + 1) *
                Double(monsterPartData[monsterNamePicker.selectedRow(inComponent: 0)].duration)
            
            if result > 1800{
                result = 1800
            }
            resultLabel.text = durationToString(duration: result)
        }
        else {
            let result = amountToString(selectedCritter: critterNames[critterNamePicker.selectedRow(inComponent: 0)],
                                        numberSelected: critterAmountPicker.selectedRow(inComponent: 0) + 1)
            resultLabel.text = result
        }
        
        setEffectPotency(amount: critterAmountPicker.selectedRow(inComponent: 0) + 1, critter: chosenCritter[critterNamePicker.selectedRow(inComponent: 0)])
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func amountToString(selectedCritter: String, numberSelected: Int) -> String{
        var result = ""
        
        if selectedCritter == "Energetic Rhino Beetle"{
            switch numberSelected{
            case 1: result = "1.6"
            case 2, 3, 4: result = "3.0"
            default: print("no rhino selected")
            }
            durationAmountLabel.text = "Restores:"
        }
        else if selectedCritter == "Restless Cricket"{
            switch numberSelected{
            case 1: result = "0.2"
            case 2: result = "0.4"
            case 3: result = "0.8"
            case 4: result = "1.0"
            default: print("no cricket selected")
            }
            durationAmountLabel.text = "Restores:"
        }
        else {
            let temp = selectedCritterAmount! * Float(critterAmountPicker.selectedRow(inComponent: 0) + 1)
            result = String(format: "%.1f", temp)
            durationAmountLabel.text = "Increases:"
        }
        
        return result
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
    
    func setEffectPotency(amount: Int, critter: Critter){
        if critter.potency != nil{
            let value = amount * critter.potency!
            var effectOfCritter: Effect?
            
            for effect in effectData{
                if effect.effectName == critter.effect{
                    effectOfCritter = effect
                }
            }
            
            if value >= (effectOfCritter?.potencyLevel1)!{
                if effectOfCritter?.potencyLevel2 != nil && value >= (effectOfCritter?.potencyLevel2)!{
                    setPotencyImages(levelCode: 3, imageName: (effectOfCritter?.effectName)!)
                }
                else {
                    setPotencyImages(levelCode: 2, imageName: (effectOfCritter?.effectName)!)
                }
            }
            else{
                setPotencyImages(levelCode: 1, imageName: (effectOfCritter?.effectName)!)
            }
        }
        else {
            potencyLabel.text = "None"
            potencyLabel.textColor = .gray
            potencyLabel.font = UIFont.italicSystemFont(ofSize: 17.0)
            potencyImage1.isHidden = true
            potencyImage2.isHidden = true
            potencyImage3.isHidden = true
        }
        
    }
    
    func setPotencyImages(levelCode: Int, imageName: String){
        switch levelCode{
        case 1:
            potencyImage1.image = UIImage(named: imageName)
            potencyImage2.isHidden = true
            potencyImage3.isHidden = true
            potencyLabel.text = "Level 1"

        case 2:
            potencyImage1.image = UIImage(named: imageName)
            potencyImage2.image = UIImage(named: imageName)
            potencyImage2.isHidden = false
            potencyImage3.isHidden = true
            potencyLabel.text = "Level 2"
  
        case 3:
            potencyImage1.image = UIImage(named: imageName)
            potencyImage2.image = UIImage(named: imageName)
            potencyImage3.image = UIImage(named: imageName)
            potencyImage2.isHidden = false
            potencyImage3.isHidden = false
            potencyLabel.text = "Level 3"
            
        default:
            potencyImage1.removeFromSuperview()
            potencyImage2.removeFromSuperview()
            potencyImage3.removeFromSuperview()
   
        }
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
