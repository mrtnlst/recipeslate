//
//  AboutViewController.swift
//  Recipe Slate
//
//  Created by martin on 24.04.17.
//  Copyright © 2017 Martin List. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    

    @IBOutlet weak var followText: UILabel!
    @IBOutlet weak var followMartinButton: UIButton!
    @IBOutlet weak var followRecipeSlateButton: UIButton!
    @IBOutlet weak var supportText: UILabel!
    @IBOutlet weak var emailAtRecipeSlate: UIButton!
    @IBOutlet weak var aboutText: UILabel!
    @IBOutlet weak var versionLabel: UILabel!
    
    // Setting up a twitter URL.
    var twitterURLMartin = URL(string: "https://twitter.com/mrtnlst")
    var twitterURLRecipeSlate = URL(string: "https://twitter.com/recipeslate")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(backAction))
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        versionLabel.text = "1.2"
        
        if (self.view.frame.size.width == 320){
            aboutText.text = "Recipe Slate provides a collection of\nrecipes, elixirs and materials found in\nBreath of the Wild."
        }
        else if (self.view.frame.size.width == 375){
            aboutText.text = "Recipe Slate provides a collection of recipes,\nelixirs and materials found in Breath of the\nWild."
        }
        else if (self.view.frame.size.width == 414){
        }
    }

    func backAction(){
        dismiss(animated: true, completion: nil)
    }
    @IBAction func followMartinPressed(_ sender: Any) {
        if #available(iOS 10.0, *) {
            let options = [UIApplicationOpenURLOptionUniversalLinksOnly : false]
             UIApplication.shared.open(twitterURLMartin!, options: options, completionHandler: nil)
        } else {
            _ = UIApplication.shared.openURL(twitterURLMartin!)
        }
    }
    
    @IBAction func followRecipeSlatePressed(_ sender: Any) {
        if #available(iOS 10.0, *) {
            let options = [UIApplicationOpenURLOptionUniversalLinksOnly : false]
            UIApplication.shared.open(twitterURLRecipeSlate!, options: options, completionHandler: nil)
        } else {
            _ = UIApplication.shared.openURL(twitterURLRecipeSlate!)
        }
    }
    
    @IBAction func emailAtRecipeSlatePressed(_ sender: Any) {
        let coded = URL(string:"mailto:recipeslate@gmail.com")
        if #available(iOS 10.0, *) {
            let options = [UIApplicationOpenURLOptionUniversalLinksOnly : false]
            UIApplication.shared.open(coded!, options: options, completionHandler: nil)
        } else {
            _ = UIApplication.shared.openURL(coded!)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
