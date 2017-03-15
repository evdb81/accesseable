//
//  TramAnnotation.swift
//  TestAccesseableREST
//
//  Created by mobapp06 on 13/03/17.
//  Copyright © 2017 mobapp06. All rights reserved.
//

import Foundation
import MapKit


public class MyAnnotation:NSObject, MKAnnotation
{
    public var coordinate: CLLocationCoordinate2D
    public var title: String?
    public var pinColor: UIColor
    
    
    init(info:Infokantoor)
    {
        self.coordinate = CLLocationCoordinate2DMake(info.lat, info.lon)
        self.title = info.naam
        self.pinColor = UIColor.yellow
    }
    
    init(log:Logement)
    {
        self.coordinate = CLLocationCoordinate2DMake(log.lat, log.lon)
        self.title = log.naam
        self.pinColor = UIColor.green
    }
    
    init(poi:POI)
    {
        self.coordinate = CLLocationCoordinate2DMake(poi.lat, poi.lon)
        self.title = poi.naam
        self.pinColor = UIColor.red
    }
    
    init(reca:Restaurant)
    {
        self.coordinate = CLLocationCoordinate2DMake(reca.lat, reca.lon)
        self.title = reca.naam
        self.pinColor = UIColor.blue
    }
    
    init(san:Sanitair)
    {
        self.coordinate = CLLocationCoordinate2DMake(san.lat, san.lon)
        self.title = san.naam
        self.pinColor = UIColor.gray
    }
    
    init(halte:Tramhalte) {
        self.coordinate = CLLocationCoordinate2DMake(halte.stop_lat, halte.stop_lon)
        self.title = halte.stop_name
        self.pinColor = UIColor.black
    }
    
    init(vpp:VPP)
    {
        self.coordinate = CLLocationCoordinate2DMake(vpp.lat, vpp.lon)
        self.title = "parkeerplaats"
        self.pinColor = UIColor.cyan
    }
   
    init(helling:Helling) {
        self.coordinate = CLLocationCoordinate2DMake(helling.lat, helling.lon)
        self.pinColor = UIColor.white
    }
    
    
}
