//
//  BuurtViewController.swift
//  TestAccesseableREST
//
//  Created by mobapp06 on 09/03/17.
//  Copyright © 2017 mobapp06. All rights reserved.
//

import UIKit
import MapKit
import CoreData

class BuurtViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapview: MKMapView!
    var locationManager = CLLocationManager.init()
    
    let sanitair = DAO.sharedDAO.getAllSanitair()
    let ReCa = DAO.sharedDAO.getAllReCa()
    let haltes = DAO.sharedDAO.getAllTramHaltes()
    
    //elke keer scherm eerste keer wordt geladen
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        createRegion()
        createAnnotations()
    }
    
    //elke keer als gebruiker terugkeert naar scherm
    func viewDidAppear(){
        createRegion()
        createAnnotations()
    }
    
    //pins vd locaties op map toevoegen
    func createAnnotations(){
        
        print("\(haltes)")
        
        for halte in haltes{
            let annotation:MyAnnotation = MyAnnotation.init(halte: halte)
            mapview.addAnnotation(annotation)
        }
    
        for san in sanitair{
           let annotation2:MyAnnotation = MyAnnotation.init(san: san)
               mapview.addAnnotation(annotation2)
        }
        
        for reca in ReCa{
            let annotation3:MyAnnotation = MyAnnotation.init(reca: reca)
                mapview.addAnnotation(annotation3)
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        //is annotation een POI
        //if let -> kortere schrijfwijze om variabele te initialiseren en direct check of gelukt
        if let pin = annotation as? MyAnnotation
        {
            //we willen layout hergebruiken indien het bestaat
            //-> niet voor elke pin opnieuw laten tekenen
            let identifier = "pin"
            var pinView: MKPinAnnotationView
            
            //check of pinView al bestaat
            if let dequedView = mapview.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
            {
                //layout bestaat al -> hergebruiken en annotatie instellen
                dequedView.annotation = pin
                pinView = dequedView
            }
            else
            {
                //layout bestaat nog niet -> aanmaken
                pinView = MKPinAnnotationView.init(annotation: pin, reuseIdentifier: identifier)
                //instellen pin
                pinView.animatesDrop = true

            }
            
            //klaar met annotatie, op kaart zetten
            return pinView
        }
        //geen van onze annotaties, niet weergeven
        return nil
    }

    
    func checkLocationAuthorization(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
            
           switch status {
           case .authorizedWhenInUse: mapview.showsUserLocation = true
            locationManager.startUpdatingLocation()
            case .authorizedAlways: mapview.showsUserLocation = true
            locationManager.startUpdatingLocation()
            case .denied: mapview.showsUserLocation = false
            print("computer says no")
            default: break
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
        default:break
        }
    }


}

