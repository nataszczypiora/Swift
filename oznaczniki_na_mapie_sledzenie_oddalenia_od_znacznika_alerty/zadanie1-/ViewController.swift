//
//  ViewController.swift
//  zadanie1-
//
//  Created by Iga Łukiewska on 19/06/2020.
//  Copyright © 2020 Iga Łukiewska. All rights reserved.
//

import UIKit
import MapKit
import UserNotifications

class ViewController: UIViewController, MKMapViewDelegate
{
    var stary_region: CLCircularRegion?
    var cl :CLLocationManager?
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound], completionHandler: {_,_  in})
        mapView.delegate = self
        super.viewDidLoad()
        self.cl = CLLocationManager()
        cl?.requestAlwaysAuthorization()
        mapView.userTrackingMode = .follow

    }
    @IBAction func ZapisPolozenia(_ sender: UIButton)
    {
        self.mapView.annotations.forEach
        {
            if ($0 is MyCarAddnotation)
            {
                self.mapView.removeAnnotation($0)
            }
        }
        
        mapView.delegate = self
        
        let actualLoc = cl?.location
        if let coords = actualLoc?.coordinate
        {
            
            mapView.userTrackingMode = .follow
            
            let a = MyCarAddnotation(coordinate: coords)
            mapView.addAnnotation(a)
            
            if let s = stary_region
            {
                cl?.stopMonitoring(for: s)
            }
            
            self.stary_region =  CLCircularRegion(center: coords, radius: 100, identifier: "Region")
            cl?.startMonitoring(for: stary_region!)
            self.stary_region!.notifyOnExit = true
            
        }
        
    }
    
}

