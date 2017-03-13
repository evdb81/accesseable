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
    
    
    func parseSanitair( context: NSManagedObjectContext)
    {
        //waar staan de gegevens
        let url = URL(string:"https://web10.weopendata.com/measurements/sanitair")
        //exceptions mogelijk bv. geen interent
        do{
            //data binnentrekken van url en in array opslaan
            let jsonData = try Data(contentsOf: url!)
            let jsonArray:NSArray = try JSONSerialization.jsonObject(with: jsonData) as! NSArray
            
            //alle items aflopen in de jsonArray (om gegevens uit te halen)
            for item in jsonArray{
                
                let jsonObject:NSDictionary = item as! NSDictionary
                //entiteit aanmaken, context = verwijzing naar waar opgeslagen
                let volgendeSanitair = Sanitair(context: context)
                
               
                //rest keys nog niet aangepast
            }
        }catch{
            print("foutieve informatie sanitair")
        }
        //geen return nodig omdat je gegevens direct opslaat in je databank
    }
    

      func parseVPP (context: NSManagedObjectContext)
    {
        //waar staan de gegevens
        let url = URL(string:"https://web10.weopendata.com/measurements/vpp")
        //exceptions mogelijk bv. geen interent
        do{
            //data binnentrekken van url en in array opslaan
            let jsonData = try Data(contentsOf: url!)
            let jsonArray:NSArray = try JSONSerialization.jsonObject(with: jsonData) as! NSArray
            
            //alle items aflopen in de jsonArray (om gegevens uit te halen)
            for item in jsonArray{
                
                let jsonObject:NSDictionary = item as! NSDictionary
                //entiteit aanmaken, context = verwijzing naar waar opgeslagen
                let volgendeVpp = VPP(context: context)
                
                //strings omzetten waar nodig
                let idStr = jsonObject.value(forKey: "ID_WESTKANS") as! String
                volgendeVpp.id_westkans = Int32.init(idStr)!
                
                //rest keys nog niet aangepast
            }
        }catch{
            print("foutieve informatie parkeerplaatsen")
        }
        //geen return nodig omdat je gegevens direct opslaat in je databank
    }
    
    func parseReca( context: NSManagedObjectContext)
    {
        //waar staan de gegevens
        let url = URL(string:"https://web10.weopendata.com/measurements/reca")
        //exceptions mogelijk bv. geen interent
        do{
            //data binnentrekken van url en in array opslaan
            let jsonData = try Data(contentsOf: url!)
            let jsonArray:NSArray = try JSONSerialization.jsonObject(with: jsonData) as! NSArray
            
            //alle items aflopen in de jsonArray (om gegevens uit database te halen)
            for item in jsonArray{
                
                let jsonObject:NSDictionary = item as! NSDictionary
                //entiteit aanmaken, context = verwijzing naar waar opgeslagen
                let volgendeReca = Restaurant(context: context)
                
                //strings omzetten waar nodig
                let idStr = jsonObject.value(forKey: "id_westkans") as! String
                volgendeReca.id_westkans = Int32.init(idStr)!
                
                volgendeReca.naam = jsonObject.value(forKey: "naam") as? String
                
                //rest keys nog niet aangepast
            }
        }catch{
            print("foutieve informatie Re&Ca")
        }
        //geen return nodig omdat je gegevens direct opslaat in je databank
    }
    


    func parseInfokantoor( context: NSManagedObjectContext)
    {
        //waar staan de gegevens
        let url = URL(string:"https://web10.weopendata.com/measurements/info")
        //exceptions mogelijk bv. geen internet
        do{
            //data binnentrekken van url en in array opslaan
            let jsonData = try Data(contentsOf: url!)
            let jsonArray:NSArray = try JSONSerialization.jsonObject(with: jsonData) as! NSArray
            
            //alle items aflopen in de jsonArray (om gegevens uit te halen)
            for item in jsonArray{
                
                let jsonObject:NSDictionary = item as! NSDictionary
                //entiteit aanmaken, context = verwijzing naar waar opgeslagen
                let volgendeInfokantoor = Infokantoor(context: context)

            }
        }catch{
            print("foutieve informatie infokantoren")
        }
        //geen return nodig omdat je gegevens direct opslaat in je databank
    }
    

}
