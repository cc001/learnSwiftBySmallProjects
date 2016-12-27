//
//  ViewController.swift
//  CollectionViewDemo
//
//  Created by 陈闯 on 2016/12/26.
//  Copyright © 2016年 CC. All rights reserved.
//

import UIKit

private let reuseIdentifier = "cellID"

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var collectionView: UICollectionView?
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    var dataArray: Array<String> = ["1", "2", "3", "4", "5"]
    
    
    fileprivate struct Constants {
        static let AnimationDuration: Double = 0.5
        static let AnimationDelay: Double = 0.0
        static let AnimationSpringDamping: CGFloat = 1.0
        static let AnimationInitialSpringVelocity: CGFloat = 1.0
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (width-30)/2, height: 300)
        layout.sectionInset = UIEdgeInsetsMake(5, 10, 5, 10)
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        
        collectionView?.register(UINib.init(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
       
        collectionView?.delegate = self
        collectionView?.dataSource = self
         view.addSubview(collectionView!)
    }

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        
        cell.imageView.image = UIImage.init(named: String(indexPath.row + 1))
        cell.backButton.addTarget(self, action: #selector(backButtonDidTouch), for: .touchUpInside)
        cell.backgroundColor = UIColor.white
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
        cell.backButton.isHidden = false
        self.handleAnimationCellSelected(collectionView, cell: cell)
    }
    
    
    fileprivate func handleAnimationCellSelected(_ collectionView: UICollectionView, cell: CollectionViewCell) {
        
        cell.superview?.bringSubview(toFront: cell)
        let animations: () -> () = {
            cell.frame = collectionView.bounds
        }
        
        
        UIView.animate(withDuration: Constants.AnimationDuration, delay: Constants.AnimationDelay, usingSpringWithDamping: Constants.AnimationSpringDamping, initialSpringVelocity: Constants.AnimationInitialSpringVelocity, options: [], animations: animations, completion: nil)
    }
    
    
    func backButtonDidTouch() {
        guard let indexPaths = self.collectionView?.indexPathsForSelectedItems else {
            return
        }
        
        let cell = collectionView?.cellForItem(at: indexPaths[0]) as! CollectionViewCell
        cell.backButton.isHidden = true
        collectionView?.reloadItems(at: indexPaths)
    }
    
}




























