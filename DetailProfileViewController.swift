//
//  DetailProfileViewController.swift
//  TestAccesseableREST
//
//  Created by mobapp03 on 15/03/17.
//  Copyright © 2017 mobapp06. All rights reserved.
//

import UIKit
import CoreData

class DetailProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    
    var pofileList:[NSManagedObject] = []
    var context:NSManagedObjectContext?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        context = DAO.sharedDAO.persistentContainer.viewContext
        fillTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        fillTableView()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: TableView
    func fillTableView(){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Profile")
        request.returnsObjectsAsFaults = false
        
        do {
            try pofileList = context?.fetch(request) as! [NSManagedObject]
        } catch  {
            print("no access to entities for fetch request")
        }
        
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pofileList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        //object voor de juiste rij
        let profile = pofileList[indexPath.row]
        //waarden uit object halen
        let naam = profile.value(forKey: "naam")
        let breedte = profile.value(forKey:"breedte")
        let draaicirkel = profile.value(forKey: "draaicirkel")
        let drempel = profile.value(forKey: "drempel")
        let helling = profile.value(forKey: "helling")
        
        
        //cell opvullen
        cell?.textLabel?.text = naam as? String
        //cell?.detailTextLabel?.text = "\(breedte)" as String?
        
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            
            context?.delete(pofileList[indexPath.row])
            
            do {
                try context?.save()
            } catch  {
                print("delete failed")
            }
            
            pofileList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        
    }
    

    

}
