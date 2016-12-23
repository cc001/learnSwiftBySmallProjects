//
//  MenuViewController.swift
//  TrumblrMenu
//
//  Created by 陈闯 on 2016/12/23.
//  Copyright © 2016年 CC. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    let transitionManager = MenuTransitionManager()
    
    @IBOutlet weak var leftTopView: UIStackView!
    @IBOutlet weak var rightTopView: UIStackView!
    @IBOutlet weak var leftCenterView: UIStackView!
    @IBOutlet weak var rightCenterView: UIStackView!
    @IBOutlet weak var leftBottomView: UIStackView!
    @IBOutlet weak var rightBottomView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.transitioningDelegate = self.transitionManager
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
