//
//  ViewController.swift
//  IOS_SELFHELP
//
//  Created by Azize Ergun on 29/10/2020.
//

import UIKit

class ViewController: UIViewController {
    
   @IBOutlet weak var btnSignUp: UIButton!
   @IBOutlet weak var btnLogIn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        // Do any additional setup after loading the view.
    }
    
    func setUpElements(){
       
        Utilities.styleFilledButton(btnSignUp)
        Utilities.styleFilledButton(btnLogIn)

    }
    
   /* @objc fileprivate func tabbarControllerQuoteAdded(){
        let controller = TabBarController()
        controller.delegate = self
        
    }*/
}

