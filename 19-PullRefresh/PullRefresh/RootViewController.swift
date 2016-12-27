//
//  RootViewController.swift
//  PullRefresh
//
//  Created by 陈闯 on 2016/12/26.
//  Copyright © 2016年 CC. All rights reserved.
//

import UIKit

class RootViewController: UITableViewController {

    var resfreshControll: UIRefreshControl!
    var customView: UIView!
    var lablesArray: Array<UILabel> = []
    var isAnimating = false
    var currentColorIndex = 0
    var currentLabelIndex = 0
    var timer: Timer!
    var dataArray: Array<String> = ["😂", "🤗", "😳", "😌", "😊"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        refreshControl = UIRefreshControl()
        tableView.addSubview(refreshControl!)
        
        loadCustomRefreshcontents()
        
    }

    func loadCustomRefreshcontents() {
        let refreshContents = Bundle.main.loadNibNamed("RefreshContents", owner: self, options: nil)
        
        customView = refreshContents?[0] as! UIView
        customView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60)
        let carryView: UIView = customView.subviews[0]
        let stackView: UIStackView = carryView.subviews[0] as! UIStackView
        
        for i in 0 ..< stackView.subviews.count {
            lablesArray.append(stackView.viewWithTag(i+1000) as! UILabel)
        }
        refreshControl?.addSubview(customView)
    }
    
    
    func animateRefreshstep1() {
        isAnimating = true
        
        UIView.animate(withDuration: 0.1, delay: 0.0, options: UIViewAnimationOptions.curveLinear, animations: { 
            self.lablesArray[self.currentColorIndex].transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_4))
            self.lablesArray[self.currentLabelIndex].textColor = self.getNextColor()
        }) { (finished) -> Void in
            
            UIView.animate(withDuration: 0.05, delay: 0.0, options: UIViewAnimationOptions.curveLinear, animations: { 
                self.lablesArray[self.currentLabelIndex].transform = CGAffineTransform.identity
                self.lablesArray[self.currentLabelIndex].textColor = UIColor.black
            }, completion: { (finished) -> Void in
                
                self.currentLabelIndex += 1
                
                if self.currentLabelIndex < self.lablesArray.count{
                    self.animateRefreshstep1()
                } else {
                    self.animateRefreshStep2()
                }
            })
        }
    }
    
    
    func getNextColor() -> UIColor {
        var colorsArray: Array<UIColor> = [UIColor.magenta, UIColor.brown, UIColor.yellow, UIColor.red, UIColor.green, UIColor.blue, UIColor.orange]
        
        if currentColorIndex == colorsArray.count {
            currentColorIndex = 0
        }
        
        let returnColor = colorsArray[currentColorIndex]
        currentColorIndex += 1
        
        return returnColor
    }

    
    
    func animateRefreshStep2() {
        UIView.animate(withDuration: 0.40, delay: 0.0, options: UIViewAnimationOptions.curveLinear, animations: {
            
            self.lablesArray[0].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.lablesArray[1].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.lablesArray[2].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.lablesArray[3].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.lablesArray[4].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.lablesArray[5].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.lablesArray[6].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.lablesArray[7].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.lablesArray[8].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.lablesArray[9].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.lablesArray[10].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.lablesArray[11].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            
        }) { (finished) -> Void in
            
            UIView.animate(withDuration: 0.25, delay: 0.0, options: UIViewAnimationOptions.curveLinear, animations: { 
                self.lablesArray[0].transform = CGAffineTransform.identity
                self.lablesArray[1].transform = CGAffineTransform.identity
                self.lablesArray[2].transform = CGAffineTransform.identity
                self.lablesArray[3].transform = CGAffineTransform.identity
                self.lablesArray[4].transform = CGAffineTransform.identity
                self.lablesArray[5].transform = CGAffineTransform.identity
                self.lablesArray[6].transform = CGAffineTransform.identity
                self.lablesArray[7].transform = CGAffineTransform.identity
                self.lablesArray[8].transform = CGAffineTransform.identity
                self.lablesArray[9].transform = CGAffineTransform.identity
                self.lablesArray[10].transform = CGAffineTransform.identity
                self.lablesArray[11].transform = CGAffineTransform.identity
            }, completion: { (finished) -> Void in
                if (self.refreshControl?.isRefreshing)! {
                    self.currentLabelIndex = 0
                    self.animateRefreshstep1()
                } else {
                    self.isAnimating = false
                    self.currentLabelIndex = 0
                    for i in 0 ..< self.lablesArray.count {
                        self.lablesArray[i].textColor = UIColor.black
                        self.lablesArray[i].transform = CGAffineTransform.identity
                    }
                }
            })
        }
    }
    
    
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if (refreshControl?.isRefreshing)! {
            if !isAnimating {
                doSomething()
                animateRefreshstep1()
            }
        }
    }
    
    
    func doSomething() {
        timer = Timer.scheduledTimer(timeInterval: 8, target: self, selector: #selector(RootViewController.endedOfWork), userInfo: nil, repeats: false)
    }
    
    func endedOfWork() {
        refreshControl?.endRefreshing()
        timer.invalidate()
        timer = nil
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)

        // Configure the cell...
        cell.textLabel!.text = dataArray[indexPath.row]
        cell.textLabel?.font = UIFont(name: "Apple Color Emoji", size: 40)
        cell.textLabel?.textAlignment = NSTextAlignment.center
        
        return cell
    }

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
