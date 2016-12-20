//
//  LoginViewController.swift
//  LoginAnimation
//
//  Created by 陈闯 on 2016/12/20.
//  Copyright © 2016年 CC. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginBTN: UIButton!
    
    @IBOutlet weak var centerConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var passwordCenterConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var trailingConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginBTN.layer.cornerRadius = 5
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        centerConstraint.constant += view.bounds.width
        passwordCenterConstraint.constant += view.bounds.width
        trailingConstraint.constant += view.bounds.width
        loginBTN.alpha = 0.0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.centerConstraint.constant -= self.view.bounds.width
            self.trailingConstraint.constant -= self.view.bounds.width
            self.passwordCenterConstraint.constant -= self.view.bounds.width
            self.loginBTN.alpha = 1.0
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    
    @IBAction func loginBtnDidTouched(_ sender: Any) {
        
        let bounds = loginBTN.bounds
        
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: UIViewAnimationOptions.curveLinear, animations: { 
             self.loginBTN.bounds = CGRect(x: bounds.origin.x - 40, y: bounds.origin.y, width: bounds.size.width, height: bounds.size.height)
            self.loginBTN.isEnabled = false
        }) {  finished in self.loginBTN.isEnabled = true
        }
    }
}
