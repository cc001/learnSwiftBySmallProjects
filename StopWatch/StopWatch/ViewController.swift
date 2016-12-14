//
//  ViewController.swift
//  StopWatch
//
//  Created by 陈闯 on 2016/12/14.
//  Copyright © 2016年 CC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    
    var counter = 0.0
    var timer = Timer()
    var isPlaying = false
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        get{
            return .lightContent
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timeLabel.text = String(counter)
    }
    
    
    @IBAction func resetBtnDidTouch(_ sender: UIButton) {
        timer.invalidate()
        isPlaying = false
        counter = 0
        timeLabel.text = String(counter)
        playBtn.isEnabled = true
        pauseBtn.isEnabled = false
    }
    
    
    @IBAction func playBtnDidTouch(_ sender: UIButton) {
        if isPlaying {
            return
        }
        playBtn.isEnabled = false
        pauseBtn.isEnabled = true
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.UpdateTimer), userInfo: nil, repeats: true)
        isPlaying = true
    }
    
    
    @IBAction func pauseBtnDidTouch(_ sender: UIButton) {
        playBtn.isEnabled = true
        pauseBtn.isEnabled = false
        timer.invalidate()
        isPlaying = false
    }
    
    
    func UpdateTimer() {
        counter = counter + 0.1
        timeLabel.text = String(format: "%.1f", counter)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

