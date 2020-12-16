//
//  Players.swift
//  P03_01_Xcode_Game
//
//  Created by Symbioz on 30/10/2020.
//

import Foundation

class Player {
    var championSelected = [Champion]() // Tableau de champion selectionnés par le joueur
    var championStat = [Champion]() // Tableau de champion selectionnés par le joueur pour l'affichage des stats de fin
    var deadChampion: Int = 0 // Stock the number of dead champions of the team
    var name : String
    
    // MARK: CC - Rename pXXX variables
    init(pName: String) {
        self.name = pName
    }
}

