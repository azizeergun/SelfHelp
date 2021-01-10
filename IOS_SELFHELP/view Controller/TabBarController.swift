//
//  TabBarController.swift
//  IOS_SELFHELP
//
//  Created by Azize Ergun on 25/12/2020.
//

import UIKit
import Firebase

protocol TabBarControllerDelegate{
    func Change(_ quote: Quote)
}
class TabBarController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var delegate: TabBarControllerDelegate?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quotesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCellController
        
        let quote: Quote
        quote = quotesList[indexPath.row]
        cell.lblQuote.text = quote.quote
        
        return cell
    }
    
    
    @IBOutlet weak var viewQuotes: UITableView!
    @IBOutlet weak var txtQuote: UITextField!
    @IBOutlet weak var btnVoegToe: UIButton!
    
    var quotesList = [Quote]()
    var ref : DatabaseReference!
    var Selected = -1
    var isCollapse = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Utilities.styleFilledButton(btnVoegToe)
        Utilities.styleTextField(txtQuote)
        viewQuotes.rowHeight = UITableView.automaticDimension
        
        
        
        ref = Database.database(url: "https://selfhelp-dfa6f-default-rtdb.europe-west1.firebasedatabase.app/").reference().child("quotes")
        
        ref.observe(DataEventType.value, with: {snapshot in
            guard let value = snapshot.value as? [String: Any] else{
                return
            }
            
        print("Value: \(value)")
            
           self.quotesList.removeAll()
            for quotes in value{
                let quoteObject = quotes.value as? [String: AnyObject]
                let quotee = quoteObject?["quote"]
                let quoteid = quoteObject?["id"]
                
                let quote = Quote(id: quoteid as! String?, quote: quotee as! String?)
                self.quotesList.append(quote)
                
            }
            self.viewQuotes.reloadData()
        })
    }

    func addQuote(){
      
        let key = ref.childByAutoId().key
        let quote = ["id":key, "quote": txtQuote.text! as String
        ]
        self.ref.child(key!).setValue(quote)
        let quoteobj = Quote(id: key, quote: txtQuote.text)
        delegate?.Change(quoteobj)
    }
    @IBAction func voegToe(_ sender: Any) {
        addQuote()
        txtQuote.text?.removeAll()
    }
    
}
