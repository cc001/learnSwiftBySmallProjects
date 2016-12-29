//
//  ViewController.swift
//  MosaicLayout
//
//  Created by 陈闯 on 2016/12/29.
//  Copyright © 2016年 CC. All rights reserved.
//

import UIKit
import FMMosaicLayout.FMMosaicLayout

class ViewController: UICollectionViewController, FMMosaicLayoutDelegate {

    var imageArray = [String]()
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imageArray = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21"]
        
        let mosaicLayout: FMMosaicLayout = FMMosaicLayout()
        self.collectionView?.collectionViewLayout = mosaicLayout
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 10
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath)
    
        
        let imageView = cell.viewWithTag(1002) as! UIImageView
        imageView.image = UIImage(named: imageArray[indexPath.row])
        
        cell.alpha = 0
        
        return cell
    }
    
    
    //只是做演示用 实际应用中帧率会比较低 产生卡顿的感觉
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let cellDelay = UInt64((arc4random() % 600 ) / 1000 )
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(cellDelay * NSEC_PER_SEC )) / Double(NSEC_PER_SEC) ) {
            UIView.animate(withDuration: 0.8, animations: {
                cell.alpha = 1.0
            })
        }
    }
    
    // FMMosaicLayoutDelegate
    func collectionView(_ collectionView: UICollectionView!, layout collectionViewLayout: FMMosaicLayout!, numberOfColumnsInSection section: Int) -> Int {
        return 1
    }

    
    func collectionView(_ collectionView: UICollectionView!, layout collectionViewLayout: FMMosaicLayout!, mosaicCellSizeForItemAt indexPath: IndexPath! ) -> FMMosaicCellSize {
        return indexPath.item % 7 == 0 ? FMMosaicCellSize.big : FMMosaicCellSize.small
    }
    
}
