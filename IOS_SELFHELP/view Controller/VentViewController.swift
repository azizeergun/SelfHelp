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
    
    @IBOutlet weak var btnVerzend: UIButton!
    @IBOutlet weak var lblWhatsUp: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Utilities.styleFilledButton(btnVerzend)
        lblOutput.isHidden = true
        
        lblOutput.numberOfLines = 2
       
        
    }
    

    @IBAction func Send(_ sender: Any) {
       // txtView.isHidden = true
        txtView.isEditable = false;
        lblOutput.isHidden = false
        
    lblOutput.text = "You've been through a lot worse" +  "\n You're better now"
        lblOutput.sizeToFit()
    }
    

}
