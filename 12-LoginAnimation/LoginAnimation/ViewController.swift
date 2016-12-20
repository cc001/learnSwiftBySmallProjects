//
//  ViewController.swift
//  LoginAnimation
//
//  Created by 陈闯 on 2016/12/20.
//  Copyright © 2016年 CC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signupBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signupBtn.layer.cornerRadius = 5
        loginBtn.layer.cornerRadius = 5
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
}

