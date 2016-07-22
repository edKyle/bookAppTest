//
//  BookTableViewController.swift
//
//
//  Created by Kyle on 7/22/16.
//
//

import UIKit
import Alamofire
import Firebase
import FirebaseDatabase
import SwiftyJSON

class BookTableViewController: UITableViewController {
    
    static var phoneNumber:[AnyObject] = []
    static var address:[AnyObject] = []
    static var bookNamearray:[AnyObject] = []
    static var bookImageArray:[AnyObject] = []
    static var webUrl:[AnyObject] = []
    static var bookIntro:[AnyObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl = UIRefreshControl()
        refreshControl!.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl!.addTarget(self, action: "refresh:", forControlEvents: UIControlEvents.ValueChanged)
        tableView.addSubview(refreshControl!) // not required when using UITableViewController
    
        
        
        
        self.tableView.registerNib(UINib(nibName: "bookNameTableViewCell", bundle: nil), forCellReuseIdentifier: "bookNameCell")
        
        
        self.tableView.estimatedRowHeight = 80
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        
        
        let ref = FIRDatabase.database().reference()
        
        ref.observeEventType(.ChildAdded, withBlock: {
            snapshot in
            
            let postDict = snapshot.value
            
            //            print(postDict![0])
            //            print(postDict![1])
            //            print(postDict![2])
//                        print(postDict![3])
            //            print(postDict![4])
            //            print(postDict![5])
            
            BookTableViewController.bookNamearray.append(postDict![0])
            BookTableViewController.bookImageArray.append(postDict![1])
            BookTableViewController.address.append(postDict![2])
            BookTableViewController.phoneNumber.append(postDict![3])
            BookTableViewController.webUrl.append(postDict![4])
            BookTableViewController.bookIntro.append(postDict![5])
            
            self.tableView.reloadData()
            
        })
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return BookTableViewController.bookNamearray.count
        
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

            let cell = tableView.dequeueReusableCellWithIdentifier("bookNameCell", forIndexPath: indexPath) as! bookNameTableViewCell
            
            cell.bookNameLabel.text = BookTableViewController.bookNamearray[indexPath.row] as? String
            cell.bookImage.image = UIImage(named:(BookTableViewController.bookImageArray[indexPath.row] as? String)!)
            
            return cell
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("showDetail", sender: indexPath.row)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail"{
            
            let index = sender as? Int
            DetailViewController.catchIndex = index
        }

    }
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        
        if editingStyle == .Delete {
           BookTableViewController.bookNamearray.removeAtIndex(indexPath.row)
           tableView.reloadData()
 
        }
    }
    
    
    func refresh(sender:AnyObject) {
        self.tableView.reloadData()
        self.refreshControl?.endRefreshing()
    }
        // Configure the cell...
        
        
        
        
        
        /*
         // Override to support conditional editing of the table view.
         override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
         // Return false if you do not want the specified item to be editable.
         return true
         }
         */
        
        /*
         // Override to support editing the table view.
         override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
         if editingStyle == .Delete {
         // Delete the row from the data source
         tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
         } else if editingStyle == .Insert {
         // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
         }
         }
         */
        
        /*
         // Override to support rearranging the table view.
         override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
         
         }
         */
        
        /*
         // Override to support conditional rearranging of the table view.
         override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
         // Return false if you do not want the item to be re-orderable.
         return true
         }
         */
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
         // Get the new view controller using segue.destinationViewController.
         // Pass the selected object to the new view controller.
         }
         */
        
}
