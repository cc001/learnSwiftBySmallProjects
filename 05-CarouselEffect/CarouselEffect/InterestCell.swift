//
//  InterestCell.swift
//  CarouselEffect
//
//  Created by 陈闯 on 2016/12/16.
//  Copyright © 2016年 CC. All rights reserved.
//

import UIKit

class InterestCell: UICollectionViewCell {
    
    
    @IBOutlet weak var featureImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var memberLabel: UILabel!
    @IBOutlet weak var postsLabel: UILabel!
    @IBOutlet weak var bottomCarryView: UIView!
    
    var interest: Interest! {
        didSet {
            updateUI()
        }
    }
    
    fileprivate func updateUI(){
        featureImageView?.image! = interest.featuredImage
        titleLabel?.text! = interest.title
        contentLabel?.text! = interest.description
        memberLabel?.text! = String(describing: interest.numberOfMembers)
        postsLabel?.text! = String(describing: interest.numberOfPosts)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        featureImageView.layer.cornerRadius = 5.0
        featureImageView.clipsToBounds = true
        
        bottomCarryView.layer.cornerRadius = 5.0
        bottomCarryView.clipsToBounds = true
    }
}
