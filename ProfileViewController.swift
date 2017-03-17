//
//  ProfileViewController.swift
//  TestAccesseableREST
//
//  Created by mobapp03 on 14/03/17.
//  Copyright © 2017 mobapp06. All rights reserved.
//

import UIKit
import CoreData

class ProfileViewController: UIViewController {
    
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var lblLengte: UILabel!
    @IBOutlet weak var lblRolstoel: UILabel!
    @IBOutlet weak var lblDrempel: UILabel!
    @IBOutlet weak var sliderRol: UISlider!
    @IBOutlet weak var sliderDrempel: UISlider!
    @IBOutlet weak var naam: UITextField!
    @IBOutlet weak var switchHelling: UISwitch!
    @IBOutlet weak var sliderToilet1: UISlider!
    @IBOutlet weak var sliderToilet2: UISlider!
    @IBOutlet weak var lblToilet1: UILabel!
    @IBOutlet weak var lblToilet2: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
  
    
    @IBAction func sliderSlided2(_ sender: UISlider) {
        
        lblLengte.text = "\(slider.value)"
        lblRolstoel.text = "\(sliderRol.value)"
        lblDrempel.text = "\(sliderDrempel.value)"
        lblToilet2.text = "\(sliderToilet2.value)"
        lblToilet1.text = "\(sliderToilet1.value)"
        
    }
    

 
    @IBAction func saveProfile(_ sender: UIButton) {
        
        let context = DAO.sharedDAO.persistentContainer.viewContext
        
        //nieuw leeg item om op te slaan
        let profile:NSManagedObject = NSEntityDescription.insertNewObject(forEntityName: "Profile", into: context)
        //leeg item opvullen met waarden uit scherm
        profile.setValue(naam.text, forKey: "naam")
        //toDoItem.setValue(tfTitle.text , forKey:"title")
        //toDoItem.setValue(tvDescription.text, forKey:"details" )
        //toDoItem.setValue(dpDueDate.date, forKey:"date")
        
        //save
        do {
            try context.save()
        } catch  {
            print("opslaan gefaald")
        }
        
        //modal scherm weer wegdoen
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func screenTapped(_ sender: UITapGestureRecognizer) {
        
        naam.resignFirstResponder()
    }
    
    }

