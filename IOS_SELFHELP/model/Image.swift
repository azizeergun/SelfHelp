//
//  Image.swift
//  IOS_SELFHELP
//
//  Created by Azize Ergun on 26/12/2020.
//

import FirebaseDatabase
import Firebase

class Image {
    
    let key: String!
    let url: String
    
    let ref : DatabaseReference?
    
    init(url:String, key:String) {
        self.key = key
        self.url = url
        self.ref = nil
    }
    
    init(snapshot:DataSnapshot) {
        key = snapshot.key
        ref = snapshot.ref
        
        let value = snapshot.value as? NSDictionary
        
        if let imageurl = value?["url"] as? String{
            url = imageurl
        }
        else{
            url = ""
        }
    }
}

