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
    
    // Setting up a twitter URL.
    var twitterURLMartin = URL(string: "https://twitter.com/mrtnlst")
    var twitterURLRecipeSlate = URL(string: "https://twitter.com/recipeslate")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(backAction))
        self.navigationController?.navigationBar.tintColor = UIColor.white

        
        if (self.view.frame.size.width == 320){
            //iPhone 2G, 3G, 3GS, 4, 4s, 5, 5s, 5c
//            aboutText.font = UIFont(name: "Futura", size: 18)
            
            
        }
        else if (self.view.frame.size.width == 375){
            //iPhone 6
//            aboutText.font = UIFont(name: "Futura", size: 20)
        }
        else if (self.view.frame.size.width == 414){
            //iPhone 6 Plus
//            aboutText.font = UIFont(name: "Futura", size: 24)
        }
        
        // Do any additional setup after loading the view.
    }

    func backAction(){
        //print("Back Button Clicked")
        dismiss(animated: true, completion: nil)
    }
    @IBAction func followMartinPressed(_ sender: Any) {
        let options = [UIApplicationOpenURLOptionUniversalLinksOnly : false]
        UIApplication.shared.open(twitterURLMartin!, options: options, completionHandler: nil)
    }
    
    @IBAction func followRecipeSlatePressed(_ sender: Any) {
        let options = [UIApplicationOpenURLOptionUniversalLinksOnly : false]
        UIApplication.shared.open(twitterURLRecipeSlate!, options: options, completionHandler: nil)
    }
    
    @IBAction func emailAtRecipeSlatePressed(_ sender: Any) {
        let coded = URL(string:"mailto:recipeslate@gmail.com")
        let options = [UIApplicationOpenURLOptionUniversalLinksOnly : false]
        UIApplication.shared.open(coded!, options: options, completionHandler: nil)
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
