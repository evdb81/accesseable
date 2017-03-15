//
//  BuurtCategorieënViewController.swift
//  TestAccesseableREST
//
//  Created by mobapp06 on 10/03/17.
//  Copyright © 2017 mobapp06. All rights reserved.
//

import UIKit

class BuurtCategorieenViewController: UIViewController {
    
    @IBOutlet weak var swReCa: UISwitch!
    @IBOutlet weak var swToilet: UISwitch!
    @IBOutlet weak var swMusea: UISwitch!
    @IBOutlet weak var swInfopunten: UISwitch!
    @IBOutlet weak var swHotels: UISwitch!
    @IBOutlet weak var swParking: UISwitch!
    @IBOutlet weak var swTramhalte: UISwitch!
    @IBOutlet weak var swHellingen: UISwitch!

    let defaults = UserDefaults.standard //wegschrijven waarde
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //opvragen defaults
        
        swReCa.isOn = defaults.bool(forKey: "Reca")
        swToilet.isOn = defaults.bool(forKey: "Toilet")
        swMusea.isOn = defaults.bool(forKey: "Museum")
        swInfopunten.isOn = defaults.bool(forKey: "Info")
        swHotels.isOn = defaults.bool(forKey: "Hotel")
        swParking.isOn = defaults.bool(forKey: "Parking")
        swTramhalte.isOn = defaults.bool(forKey: "Halte")
        swHellingen.isOn = defaults.bool(forKey: "Helling")

    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let buurtVC = segue.destination as! BuurtViewController
        
        let welkeSwitchStaatAan:[String:Bool] = ["Reca":swReCa.isOn, "Toilet":swToilet.isOn,"Museum":swMusea.isOn,"Info":swInfopunten.isOn,"Hotel":swHotels.isOn, "Parking":swParking.isOn, "Halte":swTramhalte.isOn, "Helling":swHellingen.isOn]
        
        defaults.set(swReCa.isOn, forKey: "Reca")
        defaults.set(swToilet.isOn, forKey: "Toilet")
        defaults.set(swMusea.isOn, forKey: "Museum")
        defaults.set(swInfopunten.isOn, forKey: "Info")
        defaults.set(swHotels.isOn, forKey: "Hotel")
        defaults.set(swParking.isOn, forKey: "Parking")
        defaults.set(swTramhalte.isOn, forKey: "Halte")
        defaults.set(swHellingen.isOn, forKey: "Helling")
        
        
        
        buurtVC.items = welkeSwitchStaatAan
    }
    
}


