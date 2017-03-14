//
//  ProfileViewController.swift
//  TestAccesseableREST
//
//  Created by mobapp03 on 14/03/17.
//  Copyright © 2017 mobapp06. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var lblLengte: UILabel!
    @IBOutlet weak var lblRolstoel: UILabel!
    @IBOutlet weak var lblDrempel: UILabel!
    @IBOutlet weak var sliderRol: UISlider!
    @IBOutlet weak var sliderDrempel: UISlider!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func sliderSlided() {
        
        lblLengte.text = "\(slider.value)"
        lblDrempel.text = "\(sliderDrempel.value)"
        lblRolstoel.text = "\(sliderRol.value)"
    }

 

}
