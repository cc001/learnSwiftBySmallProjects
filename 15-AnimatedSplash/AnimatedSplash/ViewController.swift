//
//  ViewController.swift
//  AnimatedSplash
//
//  Created by 陈闯 on 2016/12/21.
//  Copyright © 2016年 CC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CAAnimationDelegate {

    var mask: CALayer?
    var imageView: UIImageView?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController?.navigationBar.barStyle = UIBarStyle.blackTranslucent
        
        let imageView = UIImageView(frame: (self.view.bounds))
        imageView.image = UIImage(named: "screen")
        self.view.addSubview(imageView)
        
        mask = CALayer()
        mask?.contents = UIImage(named: "twitter")?.cgImage
        mask?.contentsGravity = kCAGravityResizeAspect
        mask?.bounds = CGRect(x: 0, y: 0, width: 100, height: 81)
        mask?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        mask?.position = CGPoint(x: imageView.frame.size.width/2, y: imageView.frame.size.height/2)
        imageView.layer.mask = mask
        self.imageView = imageView
        
        animateMask()
    }


    func animateMask()  {
        let keyFrameAnimation = CAKeyframeAnimation(keyPath: "bounds")
        keyFrameAnimation.delegate = self
        keyFrameAnimation.duration = 0.6
        keyFrameAnimation.beginTime = CACurrentMediaTime() + 0.5
        keyFrameAnimation.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut), CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)]
        let initalBounds = NSValue(cgRect: (mask?.bounds)!)
        let secondBounds = NSValue(cgRect: CGRect(x: 0, y: 0, width: 90, height: 73))
        let finalBounds = NSValue(cgRect: CGRect(x: 0, y: 0, width: 1600, height: 1300))
        keyFrameAnimation.values = [initalBounds, secondBounds, finalBounds]
        keyFrameAnimation.keyTimes = [0, 0.3, 1]
        self.mask?.add(keyFrameAnimation, forKey: "bounds")
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        self.imageView!.layer.mask = nil
    }
}

