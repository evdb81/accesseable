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
    
    
    init(reca:Infokantoor)
    {
        self.coordinate = CLLocationCoordinate2DMake(Infokantoor.lat, Infokantoor.lon)
    }
    
    init(reca:Logement)
    {
        self.coordinate = CLLocationCoordinate2DMake()
    }
    
    init(reca:POI)
    {
        self.coordinate = CLLocationCoordinate2DMake(POI.lat, POI.lon)
    }
    
    init(reca:ReCA)
    {
        self.coordinate = CLLocationCoordinate2DMake()
    }
 
    
    init(reca:Sanitair)
    {
        self.coordinate = CLLocationCoordinate2DMake(sanitair.lat, sanitair.lon)
    }
    
    init(halte:Tramhalte) {
        self.coordinate = CLLocationCoordinate2DMake(Tramhalte.stop_lat, Tramhalte.stop_lon)
    }

    init(reca:VPP)
    {
        self.coordinate = CLLocationCoordinate2DMake(vpp.lat, vpp.lon)
    }
    
    
}
