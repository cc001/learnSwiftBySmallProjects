//
//  ViewController.swift
//  Where
//
//  Created by 陈闯 on 2016/12/16.
//  Copyright © 2016年 CC. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    // 声明一个全局变量
    var locationManager: CLLocationManager!
    @IBOutlet weak var locationLabel: UILabel!
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        
        //设置定位精度
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //设置定位变化的最小距离 
        locationManager.distanceFilter = 50
        //设置请求定位的状态
        locationManager.requestWhenInUseAuthorization()
    }

    // 定位失败调用的代理方法
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    //定位更新地理信息调用的代理方法
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locations.count > 0 {
            let locationInfo = locations.last!
            print("地理经度是：\(locationInfo.coordinate.longitude),维度是：\(locationInfo.coordinate.latitude)")
            locationLabel.text = String("地理经度是：\(locationInfo.coordinate.longitude),维度是：\(locationInfo.coordinate.latitude)")
            locationManager.stopUpdatingLocation()
        }
    }
    
    @IBAction func startLocateMyLocation(_ sender: Any) {
        // 如果设备没有开启定位服务
        if CLLocationManager.locationServicesEnabled(){
            locationManager.startUpdatingLocation()
        }else{
            print("没有开启定位呀，大兄弟！")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

