//
//  ViewController.swift
//  LimitCharacters
//
//  Created by 陈闯 on 2016/12/25.
//  Copyright © 2016年 陈闯. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var tweetTextView: UITextView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var characterCountLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        avatarImageView.layer.cornerRadius = 23
        avatarImageView.clipsToBounds = true
        tweetTextView.delegate = self
        
        NotificationCenter.default.addObserver(self, selector:#selector(ViewController.keyBoardWillShow(_:)), name:NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector:#selector(ViewController.keyBoardWillHide(_:)), name:NSNotification.Name.UIKeyboardWillHide, object: nil)
        
    }

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        characterCountLabel.text = "\(140 - (textView.text?.characters.count)!)"
        print(range.length, textView.text.characters.count)
//        if range.length > 14 {
//            return false
//        } else {
            let newLength = textView.text.characters.count + range.length
            return newLength < 140
//        }
    
    }
    
    func textViewDidChange(_ textView: UITextView) {
        
//        var str = textView.text
//        let endIndex: String.Index = advance(0, 10)
//        var subStr = str.su
        
        
//        textView.text = textView.text.substring(to: textView.text.sto.advancedBy(14))
    }
    
    
    
    func keyBoardWillShow(_ note:Notification) {
        
        let userInfo  = note.userInfo
        let keyBoardBounds = (userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let duration = (userInfo![UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        let deltaY = keyBoardBounds.size.height
        let animations:(() -> Void) = {
            
            self.bottomView.transform = CGAffineTransform(translationX: 0,y: -deltaY)
        }
        
        if duration > 0 {
            let options = UIViewAnimationOptions(rawValue: UInt((userInfo![UIKeyboardAnimationCurveUserInfoKey] as! NSNumber).intValue << 16))
            
            UIView.animate(withDuration: duration, delay: 0, options:options, animations: animations, completion: nil)
            
        }else {
            
            animations()
        }
        
    }
    
    
    func keyBoardWillHide(_ note:Notification) {
        
        let userInfo  = note.userInfo
        let duration = (userInfo![UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        
        let animations:(() -> Void) = {
            
            self.bottomView.transform = CGAffineTransform.identity
            
        }
        
        if duration > 0 {
            let options = UIViewAnimationOptions(rawValue: UInt((userInfo![UIKeyboardAnimationCurveUserInfoKey] as! NSNumber).intValue << 16))
            
            UIView.animate(withDuration: duration, delay: 0, options:options, animations: animations, completion: nil)
            
        }else{
            
            animations()
        }
        
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

