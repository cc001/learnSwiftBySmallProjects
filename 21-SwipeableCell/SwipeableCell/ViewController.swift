//
//  ViewController.swift
//  SwipeableCell
//
//  Created by 陈闯 on 2016/12/27.
//  Copyright © 2016年 CC. All rights reserved.
//

import UIKit

private let cellIdentifier = "cellID"

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView: UITableView?
    var dataArray = [
        pattern(image: "1", name: "Pattern Building"),
        pattern(image: "2", name: "Joe Beez"),
        pattern(image: "3", name: "Car It's car"),
        pattern(image: "4", name: "Floral Kaleidoscopic"),
        pattern(image: "5", name: "Sprinkle Pattern"),
        pattern(image: "6", name: "Palitos de queso"),
        pattern(image: "7", name: "Ready to Go? Pattern"),
        pattern(image: "8", name: "Sets Seamless"),
        ]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView = UITableView.init(frame: view.bounds, style: UITableViewStyle.plain)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.rowHeight = 80
        tableView?.register(SwipeableCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView?.register(UINib.init(nibName: "SwipeableCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        
        view.addSubview(tableView!)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! SwipeableCell
        
        let pattern = dataArray[indexPath.row]
        
        cell.titleImageView?.image = UIImage.init(named: pattern.image)
        cell.titleLabel?.text = pattern.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .destructive, title: "🗑\nDelete") { (action, index) in
            self.dataArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
        }
        
        let share = UITableViewRowAction(style: .normal, title: "🤗\nShare") { (action: UITableViewRowAction!, indexPath: IndexPath) -> Void in
            let firstActivitItem = self.dataArray[indexPath.row]
            let activityViewController = UIActivityViewController(activityItems: [firstActivitItem.image as NSString], applicationActivities: nil)
            self.present(activityViewController, animated: true, completion: nil)
        }
        
        let download = UITableViewRowAction(style: .normal, title: "⬇️\nDownload") { (action, index) in
            print("Download button tapped")
        }
    
        return [share, download, delete]
    }
    

}




































