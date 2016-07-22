//
//  MapViewController.swift
//  bookApp
//
//  Created by Kyle on 7/22/16.
//  Copyright © 2016 Alphacamp. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController,MKMapViewDelegate {

    
    @IBOutlet weak var mapView: MKMapView!

   
    override func viewDidLoad() {
        super.viewDidLoad()
        searchByAddress()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func searchByAddress() {
            let geoCoder = CLGeocoder()
            geoCoder.geocodeAddressString((BookTableViewController.address[DetailViewController.catchIndex!] as? String)!, completionHandler: { (placemarks, error) in
                
                if placemarks?.isEmpty == false {
                    
                    let placemark = placemarks?.first
                    
                    let annotation = MKPointAnnotation()
                    
                    annotation.coordinate = (placemark?.location?.coordinate)!
                    
                    self.mapView.showAnnotations([annotation], animated: true)
                    
                }
            })
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
