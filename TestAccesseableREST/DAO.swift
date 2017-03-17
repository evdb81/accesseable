//
//  DAO.swift
//  TestAccesseableREST
//
//  Created by mobapp06 on 09/03/17.
//  Copyright © 2017 mobapp06. All rights reserved.
//

import Foundation
import CoreData

public class DAO{
    
    
    static let sharedDAO:DAO = DAO.init()
    //persistentcontainer bevat info waar je exact aan het werken bent, waar je gegevens opslaat, en hoe je entiteiten omschreven zijn waarin/waarmee je aan het werken bent
    var persistentContainer: NSPersistentContainer = {
        
        
        let container = NSPersistentContainer(name: "TestAccesseableREST")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    
    private init(){
        let parser = JSONParser()
        //parsen en laten opslaan binnen context: maak een parse 'tramhaltes' die de array gaat opvullen
        parser.parseTramhaltes(context: persistentContainer.viewContext)
        parser.parseReca(context: persistentContainer.viewContext)
        parser.parseSanitair(context: persistentContainer.viewContext)
        //parser.parseVPP(context: persistentContainer.viewContext)
        parser.parsePOI(context: persistentContainer.viewContext)
        parser.parseInfokantoor(context: persistentContainer.viewContext)
        parser.parseLogies(context: persistentContainer.viewContext)
        parser.parseHellingen(context: persistentContainer.viewContext)
        
    }
    
    
    //Tramhaltes
    func getAllTramHaltes() -> [Tramhalte]
    {
        let request = NSFetchRequest<NSFetchRequestResult>.init(entityName: "Tramhalte")
        
        do {
            let haltes = try persistentContainer.viewContext.fetch(request) as! [Tramhalte]
            return haltes
        } catch {
            print("opvragen haltes niet mogelijk")
        }
        return []
    }
    //tramhaltes weergeven op stop_naam & straatnaam (adres_straat)
     func getAllTramHaltesSearchBar(naam: searchText)
    {
    
    
    }
    
    
    //Restaurants en Café's
    func getAllReCa() -> [Restaurant]
    {
        let request = NSFetchRequest<NSFetchRequestResult>.init(entityName: "Restaurant")
        
        do {
            let reca = try persistentContainer.viewContext.fetch(request) as! [Restaurant]
            return reca
        } catch {
            print("opvragen restaurants en café's niet mogelijk")
        }
        return []
    }
    
    //Toiletten
    func getAllSanitair() -> [Sanitair]
    {
        let request = NSFetchRequest<NSFetchRequestResult>.init(entityName: "Sanitair")
        
        do {
            let sanni = try persistentContainer.viewContext.fetch(request) as! [Sanitair]
            return sanni
        } catch {
            print("opvragen sanitaire voorzieningen niet mogelijk")
        }
        return []
    }
    
    
    //POI (Musea etc)
    func getAllPOI() -> [POI]
    {
        let request = NSFetchRequest<NSFetchRequestResult>.init(entityName: "POI")
        
        do {
            let poi = try persistentContainer.viewContext.fetch(request) as! [POI]
            return poi
        } catch {
            print("opvragen bezienswaardigheden niet mogelijk")
        }
        return []
    }
    
    
    
    //Infopunten
    func getAllInfoPunten() -> [Infokantoor]
    {
        let request = NSFetchRequest<NSFetchRequestResult>.init(entityName: "Infokantoor")
        
        do {
            let infokantoor = try persistentContainer.viewContext.fetch(request) as! [Infokantoor]
            return infokantoor
        } catch {
            print("opvragen infokantoren niet mogelijk")
        }
        return []
    }
    
    
    
    //Logementen
    func getAllLogementen() -> [Logement]
    {
        let request = NSFetchRequest<NSFetchRequestResult>.init(entityName: "Logement")
        
        do {
            let logement = try persistentContainer.viewContext.fetch(request) as! [Logement]
            return logement
        } catch {
            print("opvragen overnachtings logementen niet mogelijk")
        }
        return []
    }
    
    
    
    //Parkeerplaatsen
    func getAllVPP() -> [VPP]
    {
        let request = NSFetchRequest<NSFetchRequestResult>.init(entityName: "VPP")
        
        do {
            let vpp = try persistentContainer.viewContext.fetch(request) as! [VPP]
            return vpp
        } catch {
            print("opvragen parkeerplaatsen niet mogelijk")
        }
        return []
    }
    */
    
    
    
    
    //Hellingen
    
    func getAllHellingen() -> [Helling]
    {
        let request = NSFetchRequest<NSFetchRequestResult>.init(entityName: "Helling")
        
        do {
            let helling = try persistentContainer.viewContext.fetch(request) as! [Helling]
            return helling
           }
            
        catch {
            print("opvragen hellingen niet mogelijk")
            }
        return []
    }
    
    
    



// MARK: - Core Data Saving support
func saveContext () {
    let context = persistentContainer.viewContext
    if context.hasChanges {
        do {
            try context.save()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
    
}

}

