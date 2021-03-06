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
    
    @IBOutlet weak var ivLogo: UIImageView!
    
    @IBOutlet weak var lblNaam: UILabel!
    @IBOutlet weak var lblCategorie: UILabel!
    
    @IBOutlet weak var ivMainPicture: UIImageView!
    
    @IBOutlet weak var lblAdresStraat: UILabel!
    @IBOutlet weak var lblAdresNr: UILabel!
    @IBOutlet weak var lblAdresBus: UILabel!
    @IBOutlet weak var lblPostcode: UILabel!
    @IBOutlet weak var lblGemeente: UILabel!
    @IBOutlet weak var lblTel: UILabel!
    @IBOutlet weak var lblGsm: UILabel!
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
            
            ivLogo.image = UIImage.init(named: "POI.png")
                
            lblAdresStraat.text = object?.value(forKey: "adres_straat") as! String?
            lblAdresNr.text = object?.value(forKey: "adres_nr") as! String?
            lblAdresBus.text = object?.value(forKey: "adres_bus") as! String?
            lblPostcode.text = object?.value(forKey: "pnr") as! String?
            lblGemeente.text = object?.value(forKey: "gemeente") as! String?
            
            //str opvragen van de parser, string omzetten naar url, url omzetten naar data, data omzetten naar afbeelding, afbeelding toevoegen aan de outlet
            
            do {
                let picMainStr = object?.value(forKey: "url_picture_main") as! String?
                let picMainUrl = URL(string: picMainStr!)
                
                let picMainData = try Data(contentsOf: picMainUrl!)
                let picMainImage = UIImage.init(data: picMainData)
                
                ivMainPicture.image = picMainImage


            } catch {
                ivMainPicture.image = UIImage.init(named: "POI")
            }
            
            
            
            
            lblTel.text = object?.value(forKey: "tel") as! String?
            lblGsm.text = object?.value(forKey: "gsm") as! String?
            lblSite.text = object?.value(forKey: "web") as! String?
            lblMail.text = object?.value(forKey: "mail") as! String?
           
        }
        else if (object is Tramhalte)
        {
            lblNaam.text = object?.value(forKey: "stop_name") as! String?
            lblGsm.isHidden = true
        }
        else if (object is Restaurant){
            
            //scherm opbouwen voor Restaurants
            
            lblNaam.text = object?.value(forKey: "naam") as! String?
            lblCategorie.text = "Restaurants"
            
            ivLogo.image = UIImage.init(named: "Restaurant.png")
            
            lblAdresStraat.text = object?.value(forKey: "adres_straat") as! String?
            lblAdresNr.text = object?.value(forKey: "adres_nr") as! String?
            lblAdresBus.text = object?.value(forKey: "adres_bus") as! String?
            lblPostcode.text = object?.value(forKey: "pnr") as! String?
            lblGemeente.text = object?.value(forKey: "gemeente") as! String?
            
            //str opvragen van de parser, string omzetten naar url, url omzetten naar data, data omzetten naar afbeelding, afbeelding toevoegen aan de outlet
            
            do {
                let picMainStr = object?.value(forKey: "url_picture_main") as! String?
                let picMainUrl = URL(string: picMainStr!)
                
                let picMainData = try Data(contentsOf: picMainUrl!)
                let picMainImage = UIImage.init(data: picMainData)
                
                ivMainPicture.image = picMainImage
                
                
            } catch {
                ivMainPicture.image = UIImage.init(named: "Restaurant")
            }

            
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
