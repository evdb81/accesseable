//
//  DetailLocationViewController.swift
//  TestAccesseableREST
//
//  Created by Erik Vandeborne on 16/03/17.
//  Copyright © 2017 mobapp06. All rights reserved.
//

import UIKit
import CoreData

class DetailLocationViewController: UIViewController {

    var object:NSManagedObject?
    
    @IBOutlet weak var lblNaam: UILabel!
    @IBOutlet weak var lblCategorie: UILabel!
    @IBOutlet weak var lblAdres: UILabel!
    @IBOutlet weak var lblTel: UILabel!
    @IBOutlet weak var lblSite: UILabel!
    @IBOutlet weak var lblMail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print("\(object?.description)")
        
        if(object is POI)
        {
            //scherm opbouwen voor POI
            lblNaam.text = object?.value(forKey: "naam") as! String?
            
            
            lblCategorie.text = object?.value(forKey: "subtype") as! String?
            
            
            lblAdres.text = object?.value(forKey: "adres_straat") as! String?
            //lblTel.text = object?.value(forKey: "tel") as! String?
            lblSite.text = object?.value(forKey: "web") as! String?
            lblMail.text = object?.value(forKey: "mail") as! String?
           
        }
        else if (object is Tramhalte)
        {
            lblNaam.text = object?.value(forKey: "stop_name") as! String?
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
