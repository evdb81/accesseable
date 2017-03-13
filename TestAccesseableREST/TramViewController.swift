//
//  ViewController.swift
//  TestAccesseableREST
//
//  Created by mobapp06 on 09/03/17.
//  Copyright © 2017 mobapp06. All rights reserved.
//

import UIKit

class TramViewController: UIViewController {

    @IBOutlet weak var tvTramhaltes: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tvTramhaltes.text = "\(DAO.sharedDAO.getAllTramHaltes())"
    }

   
}

