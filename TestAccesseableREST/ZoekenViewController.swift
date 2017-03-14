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
    
    //outlet voor zoekbar
     @IBOutlet weak var zoekbalk: UISearchBar!
    //outlet voor tabel met zoekresultaten
    @IBOutlet weak var tvZoekResultaten: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    //zoeken op woord in titel, omschrijving & straatnaam
    func zoekbalkActie (_searchBar: UISearchBar, textDidChange searchText: String)
    {
        //request voor items uit Infokantoor
        let requestInfo = NSFetchRequest<NSFetchRequestResult>(entityName:"Infokantoor")
        requestInfo.returnsObjectsAsFaults = false
        
        //request voor items uit Logement
        let requestLoge = NSFetchRequest<NSFetchRequestResult>(entityName:"Logement")
        requestLoge.returnsObjectsAsFaults = false
        
        //request voor items uit POI
        let requestPOI = NSFetchRequest<NSFetchRequestResult>(entityName:"POI")
        requestPOI.returnsObjectsAsFaults = false
        
        //request voor items uit Restaurant
        let requestReca = NSFetchRequest<NSFetchRequestResult>(entityName:"Restaurant")
        requestReca.returnsObjectsAsFaults = false
        
        //request voor items uit Sanitair
        let requestSani = NSFetchRequest<NSFetchRequestResult>(entityName:"Sanitair")
        requestSani.returnsObjectsAsFaults = false
        
        //request voor items uit Tramhalte
        let requestTram = NSFetchRequest<NSFetchRequestResult>(entityName:"Tramhalte")
        requestTram.returnsObjectsAsFaults = false
        
        //request voor items uit VPP
        let requestVPP = NSFetchRequest<NSFetchRequestResult>(entityName:"VPP")
        requestVPP.returnsObjectsAsFaults = false
        
        //functie om te sorten -> overslaan, is extra
    }
    

    //aantal kolommen in tabel
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    //aantal rijen
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    //ZOEKRESULTAAT WEERGEVEN IN TABEL (ROW_ID = CELL)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
   // cell?.textLabel?.text = requestInfo.text
        
    return cell!
    }
    
    
    
}
