//
//  ViewController.swift
//  GCDSamples
//
//  Created by 陈闯 on 2016/12/29.
//  Copyright © 2016年 CC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //simpleQueues()
        
        //queuesWithQoS()
        
        
        //         concurrentQueues()
        //         if let queue = inactiveQueue {
        //            queue.activate()
        //         }
        
        
        
        // queueWithDelay()
        
        //fetchImage()
        
        useWorkItem()
    }
    
    
    
    func simpleQueues() {
        let queue = DispatchQueue(label: "com.appcoda.myqueue")
        
        queue.async {
            for i in 0..<10 {
                print("🐶", i)
            }
        }
        
        for i in 100..<110 {
            print("🇨🇳", i)
        }
    }
    
    
    func queuesWithQoS() {
        
        //相同优先级 依次执行
        let queue1 = DispatchQueue(label: "com.appcoda.queue1", qos: DispatchQoS.userInitiated)
        let queue2 = DispatchQueue(label: "com.appcoda.queue2", qos: DispatchQoS.utility)
        
        queue1.async {
            for i in 0..<10 {
                print("🐶", i)
            }
        }
        
        queue2.async {
            for i in 100..<110 {
                print("🇨🇳", i)
            }
        }
        
        for i in 1000..<1010 {
            print("💦", i)
        }
        
    }
    
    
    var inactiveQueue: DispatchQueue!
    func concurrentQueues() {
        
    }
    
    
    func queueWithDelay() {
        let delayQueue = DispatchQueue(label: "com.appcoda.delayqueue", qos: .userInitiated)
        
        print(Date())
        let additionalTime: DispatchTimeInterval = .seconds(2)
        
        delayQueue.asyncAfter(deadline: .now() + additionalTime) {
            print(Date())
        }
    }
    
    
    func fetchImage() {
        let imageURL: URL = URL(string: "http://www.appcoda.com/wp-content/uploads/2015/12/blog-logo-dark-400.png")!
        (URLSession(configuration: URLSessionConfiguration.default)).dataTask(with: imageURL) { (imageData, response, error) in
            if let data = imageData {
                print("Did download image data")
                
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: data)
                }
            }
            }.resume()
    }
    
    
    func useWorkItem() {
        var value = 10
        
        let workItem = DispatchWorkItem {
            value += 5
        }
        
        //调用一次
        //workItem.perform()
        
        let queue = DispatchQueue.global(qos: .utility)
        
        //又调用一次
        queue.async(execute: workItem)
        
        workItem.notify(queue: DispatchQueue.main) {
            print("value = ", value)
        }
    }
}








