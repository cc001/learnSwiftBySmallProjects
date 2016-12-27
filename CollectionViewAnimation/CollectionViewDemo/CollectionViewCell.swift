//
//  CollectionViewCell.swift
//  CollectionViewDemo
//
//  Created by 陈闯 on 2016/12/26.
//  Copyright © 2016年 CC. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var describeLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    
    override func awakeFromNib() {
     
        super.awakeFromNib()
        // Initialization code
        backButton.isHidden = true
    }

//    func handleCellSelected() {
//        backButton.isHidden = false
//        self.superview?.bringSubview(toFront: self)
//    }
    
}
