//
//  ZoekenViewController.swift
//  TestAccesseableREST
//
//  Created by mobapp06 on 09/03/17.
//  Copyright © 2017 mobapp06. All rights reserved.



import UIKit
import CoreData

class ZoekenViewController:UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    //outlet voor zoekbar
    @IBOutlet weak var zoekbalk: UISearchBar!
    //outlet voor tabel met zoekresultaten
    @IBOutlet weak var tvZoekResultaten: UITableView!
    
    //variabelen van sharedDAO gebruiken (waar alle waarden van alle entiteiten inzitten)
    
    var items:[NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private class func getContext() -> NSManagedObjectContext {
        return DAO.sharedDAO.persistentContainer.viewContext
    }
    
    //aantal kolommen in tabel
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //aantal rijen
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    //Verwijzen naar searchbar functies in DAO -> zoekfunctie toepassen
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        items.removeAll()
       
/* foutmeldingen op de code hiertussen
        items.append(contentsOf: DAO.sharedDAO.getAllInfopuntenSearchBar(naam:searchText))
        items.append(contentsOf: DAO.sharedDAO.getAllReCaSearchBar(naam:searchText))
        items.append(contentsOf: DAO.sharedDAO.getAllSanitairSearchBar(naam:searchText))
        items.append(contentsOf: DAO.sharedDAO.getAllLogementenSearchBar(naam:searchText))
        items.append(contentsOf: DAO.sharedDAO.getAllPoiSearchBar(naam:searchText))
        items.append(contentsOf: DAO.sharedDAO.getAllVPPSearchBar(naam:searchText))
        items.append(contentsOf: DAO.sharedDAO.getAllTramHaltesSearchBar(naam: searchText))
*/
 
 
        tvZoekResultaten.reloadData()
    }
    
    //ZOEKRESULTAAT WEERGEVEN IN TABEL (ROW_ID = CELL)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        cell?.textLabel?.text = items[indexPath.row].value(forKey: "stop_name") as? String
        cell?.textLabel?.text = items[indexPath.row].value(forKey: "naam") as? String
        cell?.textLabel?.text = items[indexPath.row].value(forKey: "adres_straat") as? String
        cell?.textLabel?.text = items[indexPath.row].value(forKey: "tel") as? String
        cell?.textLabel?.text = items[indexPath.row].value(forKey: "gemeente") as? String
        
        return cell!
    }
    
}
