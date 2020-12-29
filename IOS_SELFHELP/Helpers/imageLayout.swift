//
//  imageLayout.swift
//  IOS_SELFHELP
//
//  Created by Azize Ergun on 26/12/2020.
//

import UIKit

class imageLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        setUpLayout()
    }
    
    required init?(coder a: NSCoder) {
        super.init(coder: a)
        setUpLayout()
    }
    
    override var itemSize: CGSize{
        set{}
        
        get{
            
            let numberOfColumns: CGFloat = 3
            let itemwidth = (self.collectionView!.frame.width - (numberOfColumns - 1)) / numberOfColumns
            return CGSize(width: itemwidth, height: itemwidth)
        }
    }
    
    func setUpLayout(){
        minimumInteritemSpacing = 1
        minimumLineSpacing = 1
        scrollDirection = .vertical
        
    }
}
