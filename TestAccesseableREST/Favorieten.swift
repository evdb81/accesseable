//
//  Favorieten.swift
//  TestAccesseableREST
//
//  Created by mobapp06 on 14/03/17.
//  Copyright © 2017 mobapp06. All rights reserved.
//

import Foundation

public class Favorieten{
    
//iedere keer dat een gebruiker op de knop 'favoriet" drukt (het hartje) dan moet die locatie als een waarde van Favorieten aangemaakt worden (init) en opgeslagen worden in de Array [favorieten]
//Nadien kan via DAO deze Array weergegeven worden in een Table View op het 'MIJN LOCATIES' scherm

    var favIdWesthoek:Int
    var favNaam:String
    
    
    init (favIdWesthoek:Int, favNaam:String) {
    self.favIdWesthoek = favIdWesthoek
    self.favNaam = favNaam
    }
    
    
    
  
    
}
