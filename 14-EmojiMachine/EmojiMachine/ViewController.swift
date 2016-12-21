//
//  ViewController.swift
//  EmojiMachine
//
//  Created by 陈闯 on 2016/12/20.
//  Copyright © 2016年 CC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var emojiPickerView: UIPickerView!    
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    var imageArray = [String]()
    var data1 = [String]()
    var data2 = [String]()
    var data3 = [String]()
    var dataArray = [Array<String>]()
    var bounds: CGRect = CGRect.zero
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        emojiPickerView.delegate = self
        emojiPickerView.dataSource = self
        emojiPickerView.isUserInteractionEnabled = false
        
        imageArray = ["👻","👸","💩","😘","🍔","🤖","🍟","🐼","🚖","🐷"]
        for _ in 0 ..< 100 {
            data1.append(imageArray[(Int)(arc4random() % 10)])
            data2.append(imageArray[(Int)(arc4random() % 10)])
            data3.append(imageArray[(Int)(arc4random() % 10)])
        }
        dataArray = [data1, data2, data3]
    }

    @IBAction func goButtonDidTouch(_ sender: Any) {
        
        //随机滑动
        emojiPickerView.selectRow(Int(arc4random() % 10), inComponent: 0, animated: true)
        emojiPickerView.selectRow(Int(arc4random() % 10), inComponent: 1, animated: true)
        emojiPickerView.selectRow(Int(arc4random() % 10), inComponent: 2, animated: true)
        
        //对比结果
        let row1 = emojiPickerView.selectedRow(inComponent: 0)
        let row2 = emojiPickerView.selectedRow(inComponent: 1)
        let row3 = emojiPickerView.selectedRow(inComponent: 2)
        resultLabel.text = data1[row1] == data2[row2] && data2[row2] == data3[row3] ? "Bingo!" :  "💔"
        //button动画
        bounds = goButton.bounds
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.1, initialSpringVelocity: 5, options: .curveLinear, animations: { 
            self.goButton.bounds = CGRect(x: self.bounds.origin.x, y: self.bounds.origin.y, width: self.bounds.size.width + 20, height: self.bounds.size.height)
        }) { (complete: Bool) in
            UIView.animate(withDuration: 0.1, animations: { 
                self.goButton.bounds = self.bounds
            }, completion: nil)
        }
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return dataArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataArray[component].count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100
    }

    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        
        pickerLabel.text = dataArray[component][row]
        pickerLabel.font = UIFont(name: "Apple Color Emoji", size: 80)
        pickerLabel.textAlignment = NSTextAlignment.center
        
        return pickerLabel
    }
}






