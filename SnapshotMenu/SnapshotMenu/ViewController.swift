//
//  ViewController.swift
//  SnapshotMenu
//
//  Created by 陈闯 on 2016/12/15.
//  Copyright © 2016年 CC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override var prefersStatusBarHidden: Bool
    {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let leftVC = LeftViewController(nibName: "LeftViewController", bundle: nil)
        let cameraVC = CameraViewController(nibName: "CameraViewController", bundle: nil)
        let rightVC = RightViewController(nibName: "RightViewController", bundle: nil)
        let VCArray = [leftVC, cameraVC, rightVC]
        
        var index = 0
        while index<VCArray.count {
            let VC = VCArray[index]
            
            var frame = self.view.frame
            frame.origin.x = view.frame.width * CGFloat(index)
            VC.view.frame = frame
            
            self.addChildViewController(VC)
            scrollView.addSubview(VC.view)
            VC.didMove(toParentViewController: self)
            
            index += 1
        }
        
        scrollView.contentSize = CGSize(width: view.frame.size.width * 3, height: view.frame.size.height)
        scrollView.isPagingEnabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

