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
    var Images: [String] = ["halsey.png","parachute.jpg","me.png","vakantie.jpg","budapest.jpg","buda.jpg","bal.png","fearless.jpg","art.jpg","girona.jpg","fotoooo.jpg","sebastien.jpg","group.jpg","manal.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 120, height: 120)
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 2
        colView.collectionViewLayout = layout
        colView.delegate = self
        colView.dataSource = self
    }


     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return Images.count
    }

     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.imgLife.image = UIImage(named: Images[indexPath.row])
        return cell
    }
    
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Cell \(indexPath.row) selected")
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {

        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let imgWidth = collectionView.frame.width/3.0
      return CGSize(width: imgWidth, height: imgWidth)
    }
}

