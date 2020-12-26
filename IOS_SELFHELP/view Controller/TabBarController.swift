//
//  TabBarController.swift
//  IOS_SELFHELP
//
//  Created by Azize Ergun on 25/12/2020.
//

import UIKit
import Firebase

class TabBarController: UIViewController {
    
    @IBOutlet weak var viewQuotes: UITableView!
    @IBOutlet weak var txtQuote: UITextField!
    @IBOutlet weak var btnVoegToe: UIButton!
    
    var quotesList = [Quote]()
    var ref : DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database(url: "https://selfhelp-dfa6f-default-rtdb.europe-west1.firebasedatabase.app/").reference().child("quotes")
        
        ref.observe(of: Database.value, with: { snapshot in
            guard let value = snapshot.value as? [String: Any] else{
                return
            }
            
        print("Value: \(value)")
            
           /* self.quotesList.removeAll()
            for quotes in snapshot.children.allObjects as![Snapshot]{
                let quoteObject = quotes.value as? [String: AnyObject]
                let quotee = quoteObject?[""]
            }*/
        })
     
        
    }

    func addQuote(){
        
        let key = ref.childByAutoId().key
        let quote = ["id":key, "quote": txtQuote.text! as String
        ]
        self.ref.child(key!).setValue(quote)
        
    }
    @IBAction func voegToe(_ sender: Any) {
        addQuote()
    }
    
}
