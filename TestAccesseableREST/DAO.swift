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
        //parsen en laten opslaan binnen context: arrays vd entiteiten opvullen
        parser.parseTramhaltes(context: persistentContainer.viewContext)
        parser.parseReca(context: persistentContainer.viewContext)
        parser.parseSanitair(context: persistentContainer.viewContext)
        //parser.parseVPP(context: persistentContainer.viewContext)
        parser.parsePOI(context: persistentContainer.viewContext)
        parser.parseInfokantoor(context: persistentContainer.viewContext)
        parser.parseLogies(context: persistentContainer.viewContext)
        parser.parseHellingen(context: persistentContainer.viewContext)
        
        //context (waardes in de entiteiten) laten opslaan binnen xcdatamodel
        saveContext()
    }
    
    
    //Tramhaltes
    //Tramhaltes binnentrekken
    func getAllTramHaltes() -> [Tramhalte]    {
        let request = NSFetchRequest<NSFetchRequestResult>.init(entityName: "Tramhalte")
        do {
            let haltes = try persistentContainer.viewContext.fetch(request) as! [Tramhalte]
            return haltes
        } catch {
            print("opvragen haltes niet mogelijk")
        }
        return []
    }
    //Tramhaltes kunnen opzoeken op naam (adres/straat zit niet in entiteit)
    func getAllTramHaltesSearchBar(naam:String) -> [NSManagedObject]    {
        let request = NSFetchRequest<NSFetchRequestResult>.init(entityName: "Tramhalte")
        let zoekfilter = NSPredicate.init(format: "stop_name CONTAINS[c] %@", naam)
        request.predicate = zoekfilter
        do {
            let haltes = try persistentContainer.viewContext.fetch(request) as! [NSManagedObject]
            return haltes
        } catch {
            print("opvragen haltes niet mogelijk")
        }
        return []
    }
    
    ///RESTAURANTS EN CAFE'S
    //ReCa binnentrekken
    func getAllReCa() -> [Restaurant]    {
        let request = NSFetchRequest<NSFetchRequestResult>.init(entityName: "Restaurant")
        do {
            let reca = try persistentContainer.viewContext.fetch(request) as! [Restaurant]
            return reca
        } catch {
            print("opvragen restaurants en café's niet mogelijk")
        }
        return []
    }
    //ReCa's kunnen opzoeken op naam & straatnaam
    func getAllReCaSearchBar(naam:String) -> [NSManagedObject]    {
        let request = NSFetchRequest<NSFetchRequestResult>.init(entityName: "Restaurant")
        let zoekfilter = NSPredicate.init(format: "naam CONTAINS[c] %@ && adres_straat CONTAINS[c] %@", naam, naam)
        request.predicate = zoekfilter
        do {
            let recas = try persistentContainer.viewContext.fetch(request) as! [NSManagedObject]
            return recas
        } catch {
            print("opvragen ReCa niet mogelijk")
        }
        return []
    }
    
    //SANITAIR
    //binnentrekken
    func getAllSanitair() -> [Sanitair]    {
        let request = NSFetchRequest<NSFetchRequestResult>.init(entityName: "Sanitair")
        do {
            let sanni = try persistentContainer.viewContext.fetch(request) as! [Sanitair]
            return sanni
        } catch {
            print("opvragen sanitaire voorzieningen niet mogelijk")
        }
        return []
    }
    //Sanitair kunnen opzoeken op naam & straatnaam
    func getAllSanitairSearchBar(naam:String) -> [NSManagedObject]    {
        let request = NSFetchRequest<NSFetchRequestResult>.init(entityName: "Sanitair")
        let zoekfilter = NSPredicate.init(format: "naam CONTAINS[c] %@ && adres_straat CONTAINS[c] %@", naam, naam)
        request.predicate = zoekfilter
        do {
            let sanni = try persistentContainer.viewContext.fetch(request) as! [NSManagedObject]
            return sanni
        } catch {
            print("opvragen sanitair niet mogelijk")
        }
        return []
    }
    
    //POI (Musea etc)
    //binnentrekken
    func getAllPOI() -> [POI]    {
        let request = NSFetchRequest<NSFetchRequestResult>.init(entityName: "POI")
        do {
            let poi = try persistentContainer.viewContext.fetch(request) as! [POI]
            return poi
        } catch {
            print("opvragen bezienswaardigheden niet mogelijk")
        }
        return []
    }
    //POI kunnen opzoeken op naam & straatnaam
    func getAllPoiSearchBar(naam:String) -> [NSManagedObject]    {
        let request = NSFetchRequest<NSFetchRequestResult>.init(entityName: "POI")
        let zoekfilter = NSPredicate.init(format: "naam CONTAINS[c] %@ && adres_straat CONTAINS[c] %@", naam, naam)
        request.predicate = zoekfilter
        do {
            let poi = try persistentContainer.viewContext.fetch(request) as! [NSManagedObject]
            return poi
        } catch {
            print("opvragen point of interest niet mogelijk")
        }
        return []
    }
    
    
    //INFOPUNTEN
    //binnentrekken
    func getAllInfoPunten() -> [Infokantoor]    {
        let request = NSFetchRequest<NSFetchRequestResult>.init(entityName: "Infokantoor")
        do {
            let infokantoor = try persistentContainer.viewContext.fetch(request) as! [Infokantoor]
            return infokantoor
        } catch {
            print("opvragen infokantoren niet mogelijk")
        }
        return []
    }
    //Infopunten kunnen opzoeken op naam, straatnaam, gemeente en telefoonnummer
    func getAllInfopuntenSearchBar(naam:String) -> [NSManagedObject]    {
        let request = NSFetchRequest<NSFetchRequestResult>.init(entityName: "Infokantoor")
        let zoekfilter = NSPredicate.init(format: "naam CONTAINS[c] %@ && adres_straat CONTAINS[c] %@ && tel CONTAINS[c] %@ && gemeente CONTAINS[c] %@", naam, naam, naam, naam)
        request.predicate = zoekfilter
        do {
            let info = try persistentContainer.viewContext.fetch(request) as! [NSManagedObject]
            return info
        } catch {
            print("opvragen infkantoren niet mogelijk")
        }
        return []
    }
    
    
    //LOGEMENTEN
    //binnentrekken
    func getAllLogementen() -> [Logement]    {
        let request = NSFetchRequest<NSFetchRequestResult>.init(entityName: "Logement")
        do {
            let logement = try persistentContainer.viewContext.fetch(request) as! [Logement]
            return logement
        } catch {
            print("opvragen overnachtings logementen niet mogelijk")
        }
        return []
    }
    //Logementen kunnen opzoeken op naam, straatnaam en gemeente
    func getAllLogementenSearchBar(naam:String) -> [NSManagedObject]    {
        let request = NSFetchRequest<NSFetchRequestResult>.init(entityName: "Logement")
        let zoekfilter = NSPredicate.init(format: "naam CONTAINS[c] %@ && adres_straat CONTAINS[c] %@ && gemeente CONTAINS[c] %@", naam, naam, naam)
        request.predicate = zoekfilter
        do {
            let loge = try persistentContainer.viewContext.fetch(request) as! [NSManagedObject]
            return loge
        } catch {
            print("opvragen logementen niet mogelijk")
        }
        return []
    }
    
    
    
    
    //HELLINGEN
     //binnentrekken
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
    //Hellingen kunnen opzoeken op naam
    func getAllHellingenSearchBar(naam:String) -> [NSManagedObject]    {
        let request = NSFetchRequest<NSFetchRequestResult>.init(entityName: "Helling")
        let zoekfilter = NSPredicate.init(format: "naam CONTAINS[c] %@", naam)
        request.predicate = zoekfilter
        do {
            let hell = try persistentContainer.viewContext.fetch(request) as! [NSManagedObject]
            return hell
        } catch {
            print("opvragen hellingen niet mogelijk")
        }
        return []
    }

    
    //OPSLAAN - Gegevens die binnengetrokken zijn oplaan als Core Data
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

