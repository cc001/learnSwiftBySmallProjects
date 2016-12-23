//
//  NewsTableViewController.swift
//  SlideMenu
//
//  Created by 陈闯 on 2016/12/22.
//  Copyright © 2016年 CC. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController, MenuTransitionManagerDelegate {

    let menuTransitionManager = MenuTransitionManager()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.title = "Everyday Moments"
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
    
    
    }

    
    func dismiss() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell

        // Configure the cell...
        if indexPath.row == 0 {
            cell.postImageView.image = UIImage(named: "1")
            cell.postTitle.text = "Love mountain."
            cell.postAuthor.text = "Allen Wang"
            cell.authorImageView.image = UIImage(named: "a")
            
        } else if indexPath.row == 1 {
            cell.postImageView.image = UIImage(named: "2")
            cell.postTitle.text = "New graphic design - LIVE FREE"
            cell.postAuthor.text = "Cole"
            cell.authorImageView.image = UIImage(named: "b")
            
        } else if indexPath.row == 2 {
            cell.postImageView.image = UIImage(named: "3")
            cell.postTitle.text = "Summer sand"
            cell.postAuthor.text = "Daniel Hooper"
            cell.authorImageView.image = UIImage(named: "c")
            
        } else {
            cell.postImageView.image = UIImage(named: "4")
            cell.postTitle.text = "Seeking for signal"
            cell.postAuthor.text = "Noby-Wan Kenobi"
            cell.authorImageView.image = UIImage(named: "d")
            
        }
        
        return cell
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

    
    
    @IBAction func unwindToHome(_ segue: UIStoryboardSegue) {
        let sourceController = segue.source as! MenuTableViewController
        self.title = sourceController.currentItem
    }

    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let menuTableViewConroller = segue.destination as! MenuTableViewController
        menuTableViewConroller.currentItem = self.title!
        menuTableViewConroller.transitioningDelegate = menuTransitionManager
        menuTransitionManager.delegate = self
        
    }
}









