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
    @IBOutlet weak var swHellingen: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func zoekOpCategorie(_ sender: UIButton) {

        //als een switch aanstaat//toon deze dan op de map 'in de buurt'
        if (swReCa.isOn)
            {
                
            }
    }
    
}


