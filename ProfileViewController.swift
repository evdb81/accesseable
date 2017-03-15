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

 
    @IBAction func saveProfile(_ sender: UIButton) {
        
        let context = DAO.sharedDAO.persistentContainer.viewContext
        
        //nieuw leeg item om op te slaan
        let profile:NSManagedObject = NSEntityDescription.insertNewObject(forEntityName: "Profile", into: context)
        //leeg item opvullen met waarden uit scherm
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
    


