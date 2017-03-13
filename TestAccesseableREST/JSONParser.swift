//
//  JSONParser.swift
//  TestAccesseableREST
//
//  Created by mobapp06 on 09/03/17.
//  Copyright © 2017 mobapp06. All rights reserved.
//

import Foundation
import CoreData

public class JSONParser{
    
    
    func parseTramhaltes( context: NSManagedObjectContext)
    {
        //waar staan de gegevens
        let url = URL(string:"https://web10.weopendata.com/measurements/tram")
        //exceptions mogelijk bv. geen interent
        do{
            //data binnentrekken van url en in array opslaan
            let jsonData = try Data(contentsOf: url!)
            let jsonArray:NSArray = try JSONSerialization.jsonObject(with: jsonData) as! NSArray
            
            //alle items aflopen in de jsonArray (om gegevens uit database te halen)
            for item in jsonArray{
                
                let jsonObject:NSDictionary = item as! NSDictionary
                //entiteit aanmaken, context = verwijzing naar waar opgeslagen
                let volgendeTramHalte = Tramhalte(context: context)
                
                //strings omzetten waar nodig
                let idStr = jsonObject.value(forKey: "stop_id") as! String
                volgendeTramHalte.stop_id = Int32.init(idStr)!
                
                volgendeTramHalte.stop_name = jsonObject.value(forKey: "stop_name") as? String
                
                //rest keys nog niet aangepast
            }
        }catch{
            print("waerkt ni jung")
        }
        //geen return nodig omdat je gegevens direct opslaat in je databank
    }
}
