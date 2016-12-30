//
//  ViewController.swift
//  Layers
//
//  Created by 陈闯 on 2016/12/30.
//  Copyright © 2016年 CC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var box: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 圆角
        box.layer.cornerRadius = 5
        
        // 阴影
        box.layer.shadowOffset = CGSize(width: 5, height: 5)
        box.layer.shadowOpacity = 0.6
        box.layer.shadowRadius = 5
        box.layer.shadowColor = UIColor(red: 44.0/255.0, green: 62.0/255.0, blue: 80.0/255.0, alpha: 1.0).cgColor

        // 边框
        box.layer.borderColor = UIColor.blue.cgColor
        box.layer.borderWidth = 3
        
        // 显示图像
        box.layer.contents = UIImage(named: "tree")?.cgImage
        box.layer.contentsGravity = kCAGravityResize
        box.layer.masksToBounds = true
        
        box.layer.backgroundColor = UIColor.blue.cgColor
        box.layer.opacity = 0.8
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

