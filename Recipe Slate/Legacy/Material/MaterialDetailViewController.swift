//
//  FoodDetailViewController.swift
//  Recipe Slate
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
    @IBOutlet weak var saleValueLabel: UILabel!
    @IBOutlet weak var potencyLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var potencyImage1: UIImageView!
    @IBOutlet weak var potencyImage2: UIImageView!
    @IBOutlet weak var potencyImage3: UIImageView!
    @IBOutlet weak var potencyImage4: UIImageView!
    @IBOutlet weak var potencyImage5: UIImageView!
    @IBOutlet weak var viewRecipesButton: UIButton!
    @IBOutlet weak var mealImage: UIImageView!
  
    
    var materialCell: Material?
    var segueKeyWord: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Prevent movement below navigation bar.
        edgesForExtendedLayout = []
        self.navigationItem.title = "Material"
        Utility.setDetailViewTitles(navigationItem: navigationItem)
        
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
            if materialCell?.saleValue != nil{
                setSaleValue()
            }
        }
        
        checkForRecipesButton()

    }
    
    func setLabels(){
        nameLabel.text = materialCell?.name
        setEffect()
        setLocationLabel()
        setPotency()
    }
    
    func calcHeartsImages(heartsValue: Float) -> (fullHearts: Int, decimalHearts: Float){
        let fullHearts = Int(heartsValue)
        let decimalHearts = heartsValue - Float(fullHearts)
        
        return(fullHearts, decimalHearts)
    }
    
    func setHearts(label: UILabel, heartsImage: UIImageView, heartValue: Float){
                let hearts = calcHeartsImages(heartsValue: heartValue)
        
        // If full hearts have to be displayed.
        if (hearts.fullHearts > 0) || (hearts.decimalHearts > 0.00){
            
            // If full health is restored, the label displays "full".
            if hearts.fullHearts == 100 {
                label.text = "full "
            } else {
                if hearts.decimalHearts > 0.00 {
                    label.text = String(format: "%.2f ", heartValue)
                } else {
                    // Every other case, the label displays the number of restored full hearts.
                    label.text = String(format: "%d ", hearts.fullHearts)
                }
            }
            
            if materialCell?.name == "Acorn" ||  materialCell?.name == "Chickaloo Tree Nut"{
                label.text = String(format: "0.25 ")
            }
            // Setting the image for fullHeart.
            heartsImage.image = UIImage(named: "fullHeart")
            }
        }
    
    
    func setRawHearts(){
        if materialCell?.name == "Wood" || materialCell?.name == "Silent Princess"{
            setNone(label: rawHeartsValue, heartsImage: rawHeartsImage)
            return
        }
        setHearts(label: rawHeartsValue, heartsImage: rawHeartsImage, heartValue: (materialCell?.hearts)!)
    }
    
    func calcCookedHearts(){
        let hearts = calcHeartsImages(heartsValue: (materialCell?.hearts)! * 2.0)
        print("Hearts: \(hearts)")
        if materialCell?.effect?.type == .temporaryHearts {
                cookedHeartsValue.text = "full "
            }
        else {
            if hearts.decimalHearts > 0.00 {
                cookedHeartsValue.text = String(format: "%.2f ", hearts.decimalHearts)
            } else {
                // Every other case, the label displays the number of restored full hearts.
                cookedHeartsValue.text = String(format: "%d ", (hearts.fullHearts))
            }
        }
       
        // Exceptions:
        if materialCell?.name == "Fairy"{
            cookedHeartsValue.text = "7 "
        }
        
        // Setting the image for fullHeart.
        cookedHeartsImage.image = UIImage(named: "fullHeart")
    
    }
 
    func checkForRoastedHearts(){
        var success = false
        
        for item in roastedFoodData{
            for ingredient in item.ingredientNames{
                if materialCell?.name == ingredient{
                    setHearts(label: roastedHeartsValue, heartsImage: roastedHeartsImage, heartValue: item.hearts)
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
                if materialCell?.name == ingredient{
//                    frozenHeartsImage.image = UIImage(named: "fullHeart")
//                    frozenHeartsValue.text = String(format: "%.2f ", item.hearts)
                    setHearts(label: frozenHeartsValue, heartsImage: frozenHeartsImage, heartValue: item.hearts)

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
            effectNameLabel.text = materialCell?.effect?.type.rawValue
            effectImage.image = UIImage(named: (materialCell?.effect?.type.rawValue)!)
            
            var durationOrAmountText: String = ""
            
            if materialCell?.effect?.duration != nil{
                durationOrAmountText = durationToString(duration: (materialCell?.effect?.duration)!)
                
            }
            else{
                durationOrAmountText = String(format: " %.1f", (materialCell?.effect?.amount)!)
            }
            durationOrAmountLabel.text = durationOrAmountText
            
            if materialCell?.name == "Monster Extract"{
                durationOrAmountLabel.text = " 1:00/10:00/30:00 min"
            }
        }
        else {
            setNone(label: effectNameLabel, heartsImage: effectImage)
            durationOrAmountLabel.text = ""
            plusLabel.text = ""
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
    
    func setNone(label: UILabel, heartsImage: UIImageView? = nil){
        label.text = "None"
        label.textColor = .gray
        label.font = UIFont.italicSystemFont(ofSize: 17.0)
        if heartsImage != nil{
            heartsImage?.image = UIImage(named: "empty")
        }
    }
    
    func hideFrozenEffect(){
        frozenEffectImage.image = UIImage(named: "empty")
        frozenMinutesValue.isHidden = true
    }
    
    func setSaleValue(){
        saleValueLabel.text = String(format: "%d Rupees", (materialCell?.saleValue)!)
    }
    
    func setLocationLabel(){
        if materialCell?.location != nil{
            locationLabel.text = materialCell?.location
        }
    }
    
    func setPotency(){
        if materialCell?.potency != nil{
            checkIfPotencyUpgradesPossible()
        }
        else {
            setNone(label: potencyLabel)
            setPotencyImages(levelCode: 0, imageName: "")
        }
    }

    func checkIfPotencyUpgradesPossible(){
        let potency = materialCell?.potency
        var amountForUpgrade1: Int?
        var amountForUpgrade2: Int?

        
        if materialCell?.effect?.potencyLevel1 != nil{
            
            for x in 1...5{
                if x * potency! >= (materialCell?.effect?.potencyLevel1)!{
                    amountForUpgrade1 = x
                    break
                }
            }
            if materialCell?.effect?.potencyLevel2 != nil{
                for y in 1...5{
                    if y * potency! >= (materialCell?.effect?.potencyLevel2)!{
                        amountForUpgrade2 = y
                        break
                    }
                }
            }
        }
        
        if amountForUpgrade1 != nil{
            if amountForUpgrade2 != nil{
                if amountForUpgrade1 == amountForUpgrade2{
                    potencyLabel.text = String(format: "Add %d for potency level 3.", amountForUpgrade2!)
                    setPotencyImages(levelCode: 3, imageName: (materialCell?.effect?.type.rawValue)!)

                }
                else{
                    potencyLabel.text = String(format: "Add %d for potency level 2.\nAdd %d for potency level 3.", amountForUpgrade1!, amountForUpgrade2!)
                    setPotencyImages(levelCode: 4, imageName: (materialCell?.effect?.type.rawValue)!)

                }
            }
            else {
                potencyLabel.text = String(format: "Add %d for potency level 2.", amountForUpgrade1!)
                setPotencyImages(levelCode: 2, imageName: (materialCell?.effect?.type.rawValue)!)
            }
        }
        else{
            potencyLabel.text = String(format: "Maximum potency: level 1.")
            setPotencyImages(levelCode: 1, imageName: (materialCell?.effect?.type.rawValue)!)
        }
    }
    
    func setPotencyImages(levelCode: Int, imageName: String){
        switch levelCode{
            case 1:
                    potencyImage1.image = UIImage(named: imageName)
                    potencyImage2.removeFromSuperview()
                    potencyImage3.removeFromSuperview()
                    potencyImage4.removeFromSuperview()
                    potencyImage5.removeFromSuperview()
            case 2:
                    potencyImage1.image = UIImage(named: imageName)
                    potencyImage2.image = UIImage(named: imageName)
                    potencyImage3.removeFromSuperview()
                    potencyImage4.removeFromSuperview()
                    potencyImage5.removeFromSuperview()
            case 3:
                    potencyImage1.removeFromSuperview()
                    potencyImage2.removeFromSuperview()
                    potencyImage3.image = UIImage(named: imageName)
                    potencyImage4.image = UIImage(named: imageName)
                    potencyImage5.image = UIImage(named: imageName)
            case 4:
                    potencyImage1.image = UIImage(named: imageName)
                    potencyImage2.image = UIImage(named: imageName)
                    potencyImage3.image = UIImage(named: imageName)
                    potencyImage4.image = UIImage(named: imageName)
                    potencyImage5.image = UIImage(named: imageName)

            default:
                    potencyImage1.removeFromSuperview()
                    potencyImage2.removeFromSuperview()
                    potencyImage3.removeFromSuperview()
                    potencyImage4.removeFromSuperview()
                    potencyImage5.removeFromSuperview()
        }
    }
    @IBAction func viewRecipesButtonPressed(_ sender: Any) {
        if segueKeyWord != nil {
            performSegue(withIdentifier: segueKeyWord!, sender: viewRecipesButton)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRecipes" {
            let destinatenViewController = segue.destination as! PossibleMealsTableView
            destinatenViewController.chosenMaterial = materialCell
            
            // Hiding tab bar, when in DetailViewController.
            destinatenViewController.hidesBottomBarWhenPushed = true
        }
        if segue.identifier == "showForCritter" {
            let destinatenViewController = segue.destination as! ElixirDetailViewController
            destinatenViewController.elixirCell = getEffectForCritterCategory()
            destinatenViewController.selectedMaterial = materialCell
            
            // Hiding tab bar, when in DetailViewController.
            destinatenViewController.hidesBottomBarWhenPushed = true
        }
        if segue.identifier == "showForMonsterPart" {
            let destinatenViewController = segue.destination as! ElixirViewController
            destinatenViewController.selectedMaterial = materialCell
            
            // Hiding tab bar, when in DetailViewController.
            destinatenViewController.hidesBottomBarWhenPushed = true
        }
        
    }
    
    func getEffectForCritterCategory() -> Elixir {
        var chosenElixir = Elixir(name: "Chilly Elixir", category: .chilly, effect: .heat)
        
        for critter in critterData{
            if materialCell?.name == critter.name{
                for elixir in elixirData{
                    if critter.category == elixir.category{
                        chosenElixir = elixir
                    }
                }
            }
        }
        return chosenElixir
    }
    
    func checkForRecipesButton(){
        for category in (materialCell?.category)!{
            if category == .critter {
                viewRecipesButton.setTitle("View Elixirs", for: .normal)
                mealImage.image = UIImage(named: "Elixir Button")
                segueKeyWord = "showForCritter"
            }
            else if category == .monsterPart{
                viewRecipesButton.setTitle("View Elixirs", for: .normal)
                mealImage.image = UIImage(named: "Elixir Button")
                segueKeyWord = "showForMonsterPart"
            }
            else {
                viewRecipesButton.setTitle("View Meals", for: .normal)
                mealImage.image = UIImage(named: "Meal Button")
                segueKeyWord = "showRecipes"
            }
        }
    }
}
