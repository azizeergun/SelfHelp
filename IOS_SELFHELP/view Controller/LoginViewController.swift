//
//  LoginViewController.swift
//  IOS_SELFHELP
//
//  Created by Azize Ergun on 25/12/2020.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var lblError: UILabel!
    @IBOutlet weak var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        // Do any additional setup after loading the view.
    }
    
    func setUpElements(){
        
        lblError.alpha = 0
        Utilities.styleTextField(txtEmail)
        Utilities.styleTextField(txtPassword)
        Utilities.styleFilledButton(btnLogin)

    }

    @IBAction func btnLogin(_ sender: Any) {
        let email = txtEmail.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = txtPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Signing in the user
       Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if error != nil {
                // Couldn't sign in
                self.lblError.text = error?.localizedDescription
                self.lblError.alpha = 1
            }
            else {
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let mainTabBarController = storyboard.instantiateViewController(identifier: "tabBar")
                    
                    // This is to get the SceneDelegate object from your view controller
                    // then call the change root view controller function to change to main tab bar
                (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
                
            }
      
           
        }
    }
    
}
