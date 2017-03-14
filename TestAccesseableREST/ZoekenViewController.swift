//
//  ZoekenViewController.swift
//  TestAccesseableREST
//
//  Created by mobapp06 on 09/03/17.
//  Copyright © 2017 mobapp06. All rights reserved.
//

import UIKit
import CoreData

class ZoekenViewController:UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    
    @IBOutlet weak var tvZoekResultaten: UITableView!
    @IBOutlet weak var zoekbalk: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    //zoeken op woord in titel, omschrijving & straatnaam
    func zoekbalkActie (_searchBar: UISearchBar, textDidChange searchText: String)
    {
        //request voor items
        let request = NSFetchRequest<NSFetchRequestResult>(entityName:"Sanitair")
        request.returnsObjectsAsFaults = false
        
        //omschrijving hoe gegevens te sorteren
        let sorteren = NSSortDescriptor(key:"id_westhoek", ascending: true)
        request.sortDescriptors = [sorteren]
    }
    

    //weergeven in tabel
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
    cell?.textLabel?.text = "IN TE VULLEN NOG!!!!"//uit zoekresultaat de waarde weergeven
       
    return cell!
    }
    
    
    
}
