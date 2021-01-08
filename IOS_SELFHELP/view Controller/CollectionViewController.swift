//
//  CollectionViewController.swift
//  IOS_SELFHELP
//
//  Created by Azize Ergun on 31/12/2020.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
    @IBOutlet weak var colView: UICollectionView!
    var imgData: [String] = ["halsey","vakantie","bal","budapest","buda","fearless","art","girona","parachute","papa","me"]
    var Images: [String] = ["halsey.png","vakantie.jpg","bal.png","budapest.jpg","buda.jpg","fearless.jpg","art.jpg","girona.jpg","parachute.jpg","fotoooo.jpg","me.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 120, height: 120)
        layout.minimumLineSpacing = 6
        layout.minimumInteritemSpacing = 6
       // let cellwidth = self.view.frame.width/2
       // layout.itemSize = CGSize(width:cellwidth, height: 240)
       // let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        //view.addSubview(colView)
        colView.collectionViewLayout = layout
      //  colView.frame = view.bounds
        colView.delegate = self
        colView.dataSource = self
        
     /*   layout.minimumLineSpacing = 10
               layout.minimumInteritemSpacing = 10
               layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
               let size = CGSize(width:(colView!.bounds.width-30)/2, height: 250)
               layout.itemSize = size*/
    }



    // MARK: UICollectionViewDataSource


     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return imgData.count
    }

     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        //cell.lblDescription.text = imgData[indexPath.row]
        cell.imgLife.image = UIImage(named: Images[indexPath.row])
      //  cell.imgLife.image?.scale
        // Configure the cell
        return cell
    }
    
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Cell \(indexPath.row) selected")
    }
    
  /*  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
       
         return CGSize(width: 120, height: 120)
    }*/
    
}

