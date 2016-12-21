//
//  ViewController.swift
//  stackViewDemo
//
//  Created by 陈闯 on 2016/12/21.
//  Copyright © 2016年 CC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var peopleStackView: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.black
    }

   
    @IBAction func distributionSegmentSelected(_ sender: UISegmentedControl) {
        UIView.animate(withDuration: 1.0,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.2, options: UIViewAnimationOptions(),
                       animations: { 
                        
                        if sender.selectedSegmentIndex == 0 {
                            self.peopleStackView.distribution = .fill
                        }
                        else if sender.selectedSegmentIndex == 1 {
                            self.peopleStackView.distribution = .fillEqually
                        }
                        else if sender.selectedSegmentIndex == 2 {
                            self.peopleStackView.distribution = .fillProportionally
                        }
                        else if sender.selectedSegmentIndex == 3 {
                            self.peopleStackView.distribution = .equalSpacing
                        }
                        else if sender.selectedSegmentIndex == 4 {
                            self.peopleStackView.distribution = .equalCentering
                        }

                        
        }, completion: nil)
        
        
    }
    
    @IBAction func segmentSelected(_ sender: UISegmentedControl) {
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.2, options: UIViewAnimationOptions(), animations: {
           
            if sender.selectedSegmentIndex == 0{
                self.peopleStackView.alignment = .fill
            }
            else if sender.selectedSegmentIndex == 1 {
                self.peopleStackView.alignment = .top
            }
            else if sender.selectedSegmentIndex == 2 {
                self.peopleStackView.alignment = .center
            }
            else if sender.selectedSegmentIndex == 3 {
                self.peopleStackView.alignment = .bottom
            }

        }, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

