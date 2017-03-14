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
    public var logo:String = "PlaceIcon"
    
    
    init(info:Infokantoor)
    {
        self.coordinate = CLLocationCoordinate2DMake(info.lat, info.lon)
        self.title = info.naam
        self.logo = "Info"
    }
    
    
    init(log:Logement)
    {
        self.coordinate = CLLocationCoordinate2DMake(log.lat, log.lon)
        self.title = log.naam
    }
    
    
    init(poi:POI)
    {
        self.coordinate = CLLocationCoordinate2DMake(poi.lat, poi.lon)
        self.title = poi.naam
    }
    
    
    init(reca:Restaurant)
    {
        self.coordinate = CLLocationCoordinate2DMake(reca.lat, reca.lon)
        self.title = reca.naam
    }
 
    
    init(san:Sanitair)
    {
        self.coordinate = CLLocationCoordinate2DMake(san.lat, san.lon)
        self.title = san.naam
    }
    
    
    init(halte:Tramhalte) {
        self.coordinate = CLLocationCoordinate2DMake(halte.stop_lat, halte.stop_lon)
        self.title = halte.stop_name
    }

    
    init(vpp:VPP)
    {
        self.coordinate = CLLocationCoordinate2DMake(vpp.lat, vpp.lon)
        self.title = "parkeerplaats"
    }
   
    
    
    
}
