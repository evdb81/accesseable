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
    
    //TRAMHALTES
     func parseTramhaltes( context: NSManagedObjectContext)
    {
        //waar staan de gegevens
        let url = URL(string:"http://web10.weopendata.com/measurements/tram")
        //exceptions mogelijk bv. geen interent
        do{
            //data binnentrekken van url en in array opslaan
            let jsonData = try Data(contentsOf: url!)
            let jsonArray:NSArray = try JSONSerialization.jsonObject(with: jsonData) as! NSArray
           
            //alle items aflopen in de jsonArray (om gegevens uit database te halen)0
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
    
    //RESTAURANTS (commentaar bij functie zie func parseTramhaltes)
    func parseReca( context: NSManagedObjectContext)
    {
        let url = URL(string:"http://web10.weopendata.com/measurements/reca")
        do{
            let jsonData = try Data(contentsOf: url!)
            let jsonArray:NSArray = try JSONSerialization.jsonObject(with: jsonData) as! NSArray
            for item in jsonArray{
                let jsonObject:NSDictionary = item as! NSDictionary
                let volgendeReca = Restaurant(context: context)
                volgendeReca.id_westkans = jsonObject.value(forKey: "ID_WESTKANS") as? String
                volgendeReca.naam = jsonObject.value(forKey: "NAAM") as? String
                volgendeReca.naam = jsonObject.value(forKey: "NAAM") as? String
                volgendeReca.adres_straat = jsonObject.value(forKey: "ADRES_STRAAT") as? String
                //volgendeReca.adres_nr = jsonObject.value(forKey: "ADRES_NR") as? String
                volgendeReca.adres_bus = jsonObject.value(forKey: "ADRES_BUS") as? String!
                //volgendeReca.adres_bus = (jsonObject.value(forKey: "ADRES_BUS") as? Int16)!
                volgendeReca.pnr = jsonObject.value(forKey: "PNR")  as? String
                volgendeReca.gemeente = jsonObject.value(forKey: "GEMEENTE") as? String
                volgendeReca.tel = jsonObject.value(forKey: "TEL") as? String
                volgendeReca.gsm = jsonObject.value(forKey: "GSM") as? String
                volgendeReca.fax = jsonObject.value(forKey: "FAX") as? String
                volgendeReca.web = jsonObject.value(forKey: "WEB") as? String
                volgendeReca.mail = jsonObject.value(forKey: "MAIL") as? String
                
                let latStr = jsonObject.value(forKey: "LAT") as! String
                volgendeReca.lat = Double.init(latStr)!
                let lonStr = jsonObject.value(forKey: "LON") as! String
                volgendeReca.lon = Double.init(lonStr)!
            }
        }
        catch{
            print("foutieve informatie Re&Ca")
        }
    }
    
    //TOILETTEN (commentaar bij functie zie func parseTramhaltes)
    func parseSanitair( context: NSManagedObjectContext)
    {
        let url = URL(string:"http://web10.weopendata.com/measurements/sanitair")
        do{
            let jsonData = try Data(contentsOf: url!)
            let jsonArray:NSArray = try JSONSerialization.jsonObject(with: jsonData) as! NSArray
            for item in jsonArray{
                let jsonObject:NSDictionary = item as! NSDictionary
                let volgendeSanitair = Sanitair(context: context)
                volgendeSanitair.id_westkans = jsonObject.value(forKey: "ID_WESTKANS") as? String
                volgendeSanitair.naam = jsonObject.value(forKey: "NAAM") as? String
                volgendeSanitair.subtype = jsonObject.value(forKey: "SUBTYPE") as? String
                volgendeSanitair.naam = jsonObject.value(forKey: "NAAM") as? String
                volgendeSanitair.adres_straat = jsonObject.value(forKey: "ADRES_STRAAT") as? String
                volgendeSanitair.adres_nr = jsonObject.value(forKey: "ADRES_NR") as? String!
                //volgendeSanitair.adres_nr = (jsonObject.value(forKey: "ADRES_NR") as? Int16)!
                
                //  let adresBusStr = jsonObject.value(forKey: "ADRES_BUS") as? String!
                //volgendeSanitair.adres_bus = Int16.init(adresBusStr!)!
                //volgendeSanitair.adres_bus = jsonObject.value(forKey: "ADRES_BUS") as? String
                volgendeSanitair.postnummer = jsonObject.value(forKey: "PNR") as? String!
                //volgendeSanitair.postnummer = (jsonObject.value(forKey: "PNR")  as? Int16)!
                volgendeSanitair.gemeente = jsonObject.value(forKey: "GEMEENTE") as? String
                volgendeSanitair.tel = jsonObject.value(forKey: "TEL") as? String
                volgendeSanitair.web = jsonObject.value(forKey: "WEB") as? String
                volgendeSanitair.inkomdeur_breedte = jsonObject.value(forKey: "TOILET_BREEDTE") as? String
                
                let latStr = jsonObject.value(forKey: "LAT") as! String
                volgendeSanitair.lat = Double.init(latStr)!
                let lonStr = jsonObject.value(forKey: "LON") as! String
                volgendeSanitair.lon = Double.init(lonStr)!
            }
        }catch{
            print("foutieve informatie sanitair")
        }
    }
    
   //POI - MUSEA(commentaar bij functie zie func parseTramhaltes)
    func parsePOI( context: NSManagedObjectContext)
    {        let url = URL(string:"http://web10.weopendata.com/measurements/POI")
        do{
            let jsonData = try Data(contentsOf: url!)
            let jsonArray:NSArray = try JSONSerialization.jsonObject(with: jsonData) as! NSArray
            for item in jsonArray{
                
                let jsonObject:NSDictionary = item as! NSDictionary
                //entiteit aanmaken, context = verwijzing naar waar opgeslagen
                let volgendePoi = POI(context: context)
                
                //strings omzetten waar nodig
                let idStr = jsonObject.value(forKey: "ID_WESTKANS") as! String
                volgendePoi.id_westkans = String.init(idStr)!
                
                volgendePoi.subtype = jsonObject.value(forKey: "SUBTYPE") as? String
                volgendePoi.naam = jsonObject.value(forKey: "NAAM") as? String
                volgendePoi.adres_straat = jsonObject.value(forKey: "ADRES_STRAAT") as! String
                volgendePoi.adres_nr = jsonObject.value(forKey: "ADRES_NR") as! String
                volgendePoi.adres_bus = jsonObject.value(forKey: "ADRES_BUS") as! String
                volgendePoi.pnr = jsonObject.value(forKey: "PNR")  as? String
                volgendePoi.gemeente = jsonObject.value(forKey: "GEMEENTE") as? String
                volgendePoi.tel = jsonObject.value(forKey: "TEL") as? String
                volgendePoi.gsm = jsonObject.value(forKey: "GSM") as? String
                volgendePoi.fax = jsonObject.value(forKey: "FAX") as? String
                volgendePoi.web = jsonObject.value(forKey: "WEB") as? String
                volgendePoi.mail = jsonObject.value(forKey: "MAIL") as? String
                volgendePoi.url_picture_main = jsonObject.value(forKey: "URL_PICTURE_MAIN") as? String
                
                //zonder de "try" krijg ik hier de melding dat een geforceerde omzetting naar String nooit "nil" kan weergeven. Vandaar try?
                volgendePoi.toilet_ruimte = jsonObject.value(forKey: "TOILET_RUIMTE") as! String
                
               // volgendePoi.inkom_drempel = jsonObject.value(forKey: "INKOM_DREMPEL") as! String
                let latStr = jsonObject.value(forKey: "LAT") as! String
                volgendePoi.lat = Double.init(latStr)!
                let lonStr = jsonObject.value(forKey: "LON") as! String
                volgendePoi.lon = Double.init(lonStr)!            }
        }catch{
            print("foutieve informatie points of interests.")
        }
    }

    
//VPP -> ALLES VERWIJDERD
    
    
    //INFOKANTOREN (commentaar bij functie zie func parseTramhaltes)
    func parseInfokantoor( context: NSManagedObjectContext)
    {
        let url = URL(string:"http://web10.weopendata.com/measurements/info")
        do{
            let jsonData = try Data(contentsOf: url!)
            let jsonArray:NSArray = try JSONSerialization.jsonObject(with: jsonData) as! NSArray
            for item in jsonArray{
                let jsonObject:NSDictionary = item as! NSDictionary
                let volgendeInfokantoor = Infokantoor(context: context)
                let idStr = jsonObject.value(forKey: "ID_WESTKANS") as! String
                volgendeInfokantoor.id_westkans = String.init(idStr)!
                let idNaam = jsonObject.value(forKey: "NAAM") as! String
                
                volgendeInfokantoor.naam = String.init(idNaam)
                volgendeInfokantoor.subtype = jsonObject.value(forKey: "SUBTYPE") as? String
                volgendeInfokantoor.naam = jsonObject.value(forKey: "NAAM") as? String
                volgendeInfokantoor.adres_straat = jsonObject.value(forKey: "ADRES_STRAAT") as? String
                volgendeInfokantoor.adres_nr = jsonObject.value(forKey: "ADRES_NR") as? String
                volgendeInfokantoor.adres_bus = jsonObject.value(forKey: "ADRES_BUS") as? String
                volgendeInfokantoor.pnr = jsonObject.value(forKey: "PNR")  as? String
                volgendeInfokantoor.gemeente = jsonObject.value(forKey: "GEMEENTE") as? String
                volgendeInfokantoor.tel = jsonObject.value(forKey: "TEL") as? String
                volgendeInfokantoor.gsm = jsonObject.value(forKey: "GSM") as? String
                volgendeInfokantoor.web = jsonObject.value(forKey: "WEB") as? String
                volgendeInfokantoor.mail = jsonObject.value(forKey: "MAIL") as? String
                
                let latStr = jsonObject.value(forKey: "LAT") as! String
                volgendeInfokantoor.lat = Double.init(latStr)!
                let lonStr = jsonObject.value(forKey: "LON") as! String
                volgendeInfokantoor.lon = Double.init(lonStr)!            }
        }catch{
            print("foutieve informatie infokantoren")
        }
    }
    
    
    //LOGEMENTEN (commentaar bij functie zie func parseTramhaltes)
    func parseLogies( context: NSManagedObjectContext)
    {
        let url = URL(string:"http://web10.weopendata.com/measurements/logies")
        do{
            let jsonData = try Data(contentsOf: url!)
            let jsonArray:NSArray = try JSONSerialization.jsonObject(with: jsonData) as! NSArray
            for item in jsonArray{
                let jsonObject:NSDictionary = item as! NSDictionary
                let volgendeLogie = Logement(context: context)
                let idStr = jsonObject.value(forKey: "ID_WESTKANS") as! String
                volgendeLogie.id_westkans = String.init(idStr)!
                let naamStr = jsonObject.value(forKey: "NAAM") as! String
                volgendeLogie.naam = String.init(naamStr)
                
                let latStr = jsonObject.value(forKey: "LAT") as! String
                volgendeLogie.lat = Double.init(latStr)!
                let lonStr = jsonObject.value(forKey: "LON") as! String
                volgendeLogie.lon = Double.init(lonStr)!
            }
        }catch{
            print("foutieve informatie logementen")
        }
    }
    
    //HELLINGEN(commentaar bij functie zie func parseTramhaltes)
    
    func parseHellingen( context: NSManagedObjectContext)
    {        let url = URL(string:"http://web10.weopendata.com/measurements/dijk")
        do{
            let jsonData = try Data(contentsOf: url!)
            let jsonArray:NSArray = try JSONSerialization.jsonObject(with: jsonData) as! NSArray
            for item in jsonArray{
                let jsonObject:NSDictionary = item as! NSDictionary
                let volgendeHelling = Helling(context: context)
                let idStr = jsonObject.value(forKey: "ID_WESTKANS") as! String
                volgendeHelling.id_westkans = String.init(idStr)!
                let latStr = jsonObject.value(forKey: "LAT") as! String
                volgendeHelling.lat = Double.init(latStr)!
                let lonStr = jsonObject.value(forKey: "LON") as! String
                volgendeHelling.lon = Double.init(lonStr)!
            }
        }catch{
            print("Hellingen konden niet weergegeven worden.")
        }
    }
    
    
}
