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
    
    
    init(info:Infokantoor)
    {
        self.coordinate = CLLocationCoordinate2DMake(info.lat, info.lon)
    }
    
    
    init(log:Logement)
    {
        self.coordinate = CLLocationCoordinate2DMake(log.lat, log.lon)
    }
    
    
    init(poi:POI)
    {
        self.coordinate = CLLocationCoordinate2DMake(poi.lat, poi.lon)
    }
    
    
    init(reca:Restaurant)
    {
        self.coordinate = CLLocationCoordinate2DMake(reca.lat, reca.lon)
    }
 
    
    init(san:Sanitair)
    {
        self.coordinate = CLLocationCoordinate2DMake(san.lat, san.lon)
    }
    
    
    init(halte:Tramhalte) {
        self.coordinate = CLLocationCoordinate2DMake(halte.stop_lat, halte.stop_lon)
    }

    
    init(vpp:VPP)
    {
        self.coordinate = CLLocationCoordinate2DMake(vpp.lat, vpp.lon)
    }
   
    
    
    
}
