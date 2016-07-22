//
//  bigScroViewController.swift
//  bookApp
//
//  Created by Kyle on 7/22/16.
//  Copyright © 2016 Alphacamp. All rights reserved.
//

import UIKit

class bigScroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    var bigImagePicture = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bigImagePicture.image = UIImage(named: BookTableViewController.bookImageArray[DetailViewController.catchIndex!] as! String)
        
        bigImagePicture.frame = CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.height)
        
        self.scrollView.delegate = self
        
        self.scrollView.addSubview(bigImagePicture)
        self.scrollView.contentSize = bigImagePicture.frame.size
        
        self.scrollView.maximumZoomScale = 5.0
        self.scrollView.minimumZoomScale = 1
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.bigImagePicture
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
