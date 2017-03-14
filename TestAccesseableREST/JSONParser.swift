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
        let url = URL(string:"http://web10.weopendata.com/measurements/tram")
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
                
                let latStr = jsonObject.value(forKey: "stop_lat") as! String
                volgendeTramHalte.stop_lat = Double.init(latStr)!
                let lonStr = jsonObject.value(forKey: "stop_lon") as! String
                volgendeTramHalte.stop_lon = Double.init(lonStr)!
            }
        }catch{
            print("Tramhaltes konden niet weer gegeven worden.")
        }
        
        //geen return nodig omdat je gegevens direct opslaat in je databank
    }
    
    
    func parseReca( context: NSManagedObjectContext)
    {
        //waar staan de gegevens
        let url = URL(string:"http://web10.weopendata.com/measurements/reca")
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
                volgendeReca.id_westkans = jsonObject.value(forKey: "ID_WESTKANS") as! String
                
                volgendeReca.naam = jsonObject.value(forKey: "NAAM") as? String
                
                let latStr = jsonObject.value(forKey: "LAT") as! String
                volgendeReca.lat = Double.init(latStr)!
                let lonStr = jsonObject.value(forKey: "LON") as! String
                volgendeReca.lon = Double.init(lonStr)!
            }
        }
        catch{
            print("foutieve informatie Re&Ca")
        }
        //geen return nodig omdat je gegevens direct opslaat in je databank
    }
    
    func parseSanitair( context: NSManagedObjectContext)
    {
        //waar staan de gegevens
        let url = URL(string:"http://web10.weopendata.com/measurements/sanitair")
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
        let url = URL(string:"http://web10.weopendata.com/measurements/vpp")
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
                volgendeVpp.id_westkans = String.init(idStr)!
                
                //rest keys nog niet aangepast
            }
        }catch{
            print("foutieve informatie parkeerplaatsen")
        }
        //geen return nodig omdat je gegevens direct opslaat in je databank
    }
    
    
    func parseInfokantoor( context: NSManagedObjectContext)
    {
        //waar staan de gegevens
        let url = URL(string:"http://web10.weopendata.com/measurements/info")
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
