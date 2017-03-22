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

    var elixirCell: Elixir?

    var critters:[Critter] = critterData
    var amount: [String] = ["1", "2", "3", "4", "5"]
    var critterNames: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        critterNamePicker.dataSource = self;
        critterNamePicker.delegate = self;
        critterAmountPicker.dataSource = self;
        critterAmountPicker.delegate = self;
        
            for item in critters{
                if item.category == elixirCell?.category{
                    critterNames.append(item.name)
                }
            }
        
        
        if elixirCell != nil{
            nameLabel.text = elixirCell?.name
            effectNameLabel.text = elixirCell?.effect
            effectImageView.image = UIImage(named: (elixirCell?.effect)!)
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
        else {
            return amount.count
        }
    }
    
//     func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//            return critter[component][row]
//     
//    }

//        func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
//            let pickerLabel = UILabel()
//            let titleData = critter[component][row]
//            let myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 12.0),NSForegroundColorAttributeName:UIColor.white])
//            
//            pickerLabel.attributedText = myTitle
//            return pickerLabel
//
//        }
//    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        if pickerView == critterNamePicker{
            let pickerLabel = UILabel()
            let titleData = critterNames[row]
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func durationToString(duration: TimeInterval) -> String{
        
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.allowedUnits = [ .minute, .second ]
        formatter.zeroFormattingBehavior = [ .pad ]
        
        let formattedDuration = formatter.string(from: duration)
        return formattedDuration!
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
