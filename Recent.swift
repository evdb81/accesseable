//
//  Recent.swift
//  TestAccesseableREST
//
//  Created by mobapp06 on 14/03/17.
//  Copyright © 2017 mobapp06. All rights reserved.
//

import Foundation

public class Recent{
    
//Wanneer de gebruiker het detailscherm bekijkt van een locatie, dient die als een waarde van Recent aangemaakt te worden (init) en opgeslagen te worden in de Array [recenteLocaties]
 //Nadien kan via DAO deze Array weergegeven worden in een Table View op het 'MIJN LOCATIES' scherm
    
    var recIdWesthoek:Int
    var recNaam:String
    
    init(recIdWesthoek:Int, recNaam:String) {
        self.recIdWesthoek = recIdWesthoek
        self.recNaam = recNaam
    }
    
    
    
}
