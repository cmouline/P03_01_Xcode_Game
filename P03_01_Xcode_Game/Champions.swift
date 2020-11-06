//
//  Champions.swift
//  P03_01_Xcode_Game
//
//  Created by Symbioz on 30/10/2020.
//

import Foundation
class Champion {
    var name : String
    var life : Int
    
    enum category : String {
        case heal = "Vous avez la possibilité de soigner vos coéquipiers."
        case tank = "Vous disposez d'un bouclier pouvant bloquer tout ou partie des dégâts subis."
        case DPS = "Vous êtes au coeur des dégâts de votre équipe."
    }
    
    init(name: String, life: Int) {
        self.name = name
        self.life = life
    }

    
    }


