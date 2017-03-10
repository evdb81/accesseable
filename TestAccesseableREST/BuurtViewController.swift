//
//  BuurtViewController.swift
//  TestAccesseableREST
//
//  Created by mobapp06 on 09/03/17.
//  Copyright © 2017 mobapp06. All rights reserved.
//

import UIKit
import MapKit

class BuurtViewController: UIViewController {
    
    
    @IBOutlet weak var mapview: MKMapView!
    var locationManager = CLLocationManager.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createRegion()
    }
    
    //regio om op te focussen
    func createRegion()
    {
        //begin met middelpunt aan de kust
        let center = CLLocationCoordinate2DMake(51.2220, 2.9288)
        //spanweide: bepalen hoeveel inzoomen
        let span = MKCoordinateSpan.init(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion.init(center: center, span: span)
        //aanspreken van middelpunt op kaart
        mapview.region = region
    }
    

    //maptypes instellen
    @IBAction func mapTypeChosen(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: mapview.mapType = .standard
        case 1: mapview.mapType = .satellite
        case 2: mapview.mapType = .hybrid
        default:
            break
        }
         }

    
    func checkLocationAuthorization()
    {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse
        { //positie weergeven op kaart
            //!!!!! niet vergeten toestemming in info.plist toe te voegen
            mapview.showsUserLocation = true
        }else
        { //toestemming vragen
            locationManager.requestWhenInUseAuthorization()
            mapview.showsUserLocation = true
        }
        }
       
       
}
