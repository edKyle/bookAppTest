//
//  DetailViewController.swift
//  bookApp
//
//  Created by Kyle on 7/22/16.
//  Copyright © 2016 Alphacamp. All rights reserved.
//

import UIKit
import WebKit
import SafariServices

class DetailViewController: UIViewController {

    static var catchIndex:Int?
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var bookNameLabel: UILabel!
    @IBOutlet weak var addressButton: UIButton!
    @IBOutlet weak var phoneNumber: UIButton!
    @IBOutlet weak var bookIntrol: UILabel!
    var phone:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bookImageView.image = UIImage(named: BookTableViewController.bookImageArray[DetailViewController.catchIndex!] as! String)
        
        bookNameLabel.text = BookTableViewController.bookNamearray[DetailViewController.catchIndex!] as? String
        
        addressButton.setTitle(BookTableViewController.address[DetailViewController.catchIndex!] as? String, forState: .Normal)
        // Do any additional setup after loading the view.
        
        phoneNumber.setTitle(BookTableViewController.phoneNumber[DetailViewController.catchIndex!] as? String, forState: .Normal)
        phone = Int((BookTableViewController.phoneNumber[DetailViewController.catchIndex!] as? String)!)
    
        bookIntrol.frame.size.width = UIScreen.mainScreen().bounds.width-8
        
        let text = "\(BookTableViewController.bookIntro[DetailViewController.catchIndex!])"
        bookIntrol.text = text
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func tapToBigAction(sender: AnyObject) {
        performSegueWithIdentifier("showbig", sender: self)
    }
    @IBAction func toAddressAction(sender: AnyObject) {
        performSegueWithIdentifier("showMap", sender: self.addressButton)
    }
    @IBAction func makeCall(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: "tel://\(phone)")!)
    }
    @IBAction func webAction(sender: AnyObject) {
                let url = NSURL(string: BookTableViewController.webUrl[DetailViewController.catchIndex!] as! String)
                UIApplication.sharedApplication().openURL(url!)
    }
}
