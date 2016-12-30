//
//  FirstViewController.swift
//  CustomTabBar
//
//  Created by 陈闯 on 2016/12/30.
//  Copyright © 2016年 CC. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        guard let tabBar = self.tabBarController?.tabBar  else { return }
        
        tabBar.tintColor = UIColor.white
        tabBar.barTintColor = UIColor.black
        tabBar.unselectedItemTintColor = UIColor.yellow
        
        guard let tabBarItem = self.tabBarItem else { return }
        
        tabBarItem.badgeValue = "123"
        tabBarItem.badgeColor = UIColor.blue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

