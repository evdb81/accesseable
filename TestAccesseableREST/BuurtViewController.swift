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
        checkLocationAuthorization()
        createRegion()
        createAnnotations()
    }
    
    //
    func viewDidAppear(){
        createRegion()
        createAnnotations()
    }
    
    //
    func createAnnotations(){
        let sanitair = DAO.sharedDAO.getAllSanitair()
        let ReCa = DAO.sharedDAO.getAllReCa()
        let haltes = DAO.sharedDAO.getAllTramHaltes()
       
        
        for halte in haltes{
            let annotation:MyAnnotation = MyAnnotation.init(halte: halte)
            mapview.addAnnotation(annotation)
        }
    
        for toilet in sanitair{
           let annotation2:MyAnnotation = MyAnnotation.init(toilet: toilet)
               mapview.addAnnotation(annotation2)
        }
        
        for reca in ReCa{
            let annotation3:MyAnnotation = MyAnnotation.init(reca: reca)
                mapview.addAnnotation(annotation3)
        }
    }
    
    
    func checkLocationAuthorization()     {
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

    
    //regio om op te focussen
    func createRegion()     {
        //begin met middelpunt aan de kust
        let center = CLLocationCoordinate2DMake(51.2220, 2.9288)
        //spanweide: bepalen hoeveel inzoomen
        let span = MKCoordinateSpan.init(latitudeDelta: 0.9, longitudeDelta: 0.9)
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
}

