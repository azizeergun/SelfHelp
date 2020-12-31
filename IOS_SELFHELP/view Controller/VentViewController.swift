//
//  VentViewController.swift
//  IOS_SELFHELP
//
//  Created by Azize Ergun on 26/12/2020.
//

import UIKit

class VentViewController: UIViewController {

    @IBOutlet weak var lblOutput: UILabel!
    @IBOutlet weak var txtView: UITextView!
    @IBOutlet weak var txtViewHC: NSLayoutConstraint!
  //  @IBOutlet weak var lblOutput: UILabel!
    
    @IBOutlet weak var btnClear: UIButton!
    @IBOutlet weak var btnVerzend: UIButton!
    @IBOutlet weak var lblWhatsUp: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Utilities.styleFilledButton(btnVerzend)
      //  Utilities.styleFilledButton(btnClear)
        lblOutput.isHidden = true
        
        lblOutput.numberOfLines = 2
        btnClear.isHidden = true
        btnVerzend.isEnabled = true
    }
    

    @IBAction func Send(_ sender: Any) {
       // txtView.isHidden = true
        txtView.isEditable = false;
        lblOutput.isHidden = false
        
        lblOutput.text = "You've been through a lot worse" +  "\n You're better now"
        lblOutput.sizeToFit()
        btnClear.isHidden = false
        btnVerzend.isEnabled = false
        btnClear.isEnabled = true
    }
    @IBAction func Clear(_ sender: Any) {
        txtView.text = ""
        txtView.isEditable = true
        lblOutput.isHidden = true
        btnVerzend.isEnabled = true
        btnClear.isHidden = true
        print("Ik kom hierin terecht")
    }
    
   
    
}
