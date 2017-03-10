//
//  DAO.swift
//  TestAccesseableREST
//
//  Created by mobapp06 on 09/03/17.
//  Copyright © 2017 mobapp06. All rights reserved.
//

import Foundation
import CoreData   //persistentContainer & saveContext() zijn gekopieerd uit de AppDelegate

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
    }
    
    
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
