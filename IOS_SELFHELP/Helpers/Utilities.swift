//
//  Utilities.swift
//  IOS_SELFHELP
//
//  Created by Azize Ergun on 25/12/2020.
//


import Foundation
import UIKit

class Utilities {
    
    static func styleTextField(_ textfield:UITextField) {
        textfield.layer.cornerRadius = 5.0
    }
    
    static func styleFilledButton(_ button:UIButton) {
        button.backgroundColor = UIColor.init(red: 255/255, green: 158/255, blue: 186/255, alpha: 1)
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.white
    }
    
    static func styleHollowButton(_ button:UIButton) {
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.init(red: 255/255, green: 158/255, blue: 186/255, alpha: 1).cgColor
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.black
    }
    
    static func isPasswordValid(_ password : String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }

}
