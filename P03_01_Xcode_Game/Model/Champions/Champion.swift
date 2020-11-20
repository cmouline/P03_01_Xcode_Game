//
//  Champion.swift
//  P03_01_Xcode_Game
//
//  Created by Symbioz on 30/10/2020.
//

import Foundation

enum Category: String {
    case heal = "Heal"
    case tank = "Tank"
    case DPS = "Dps"
    
}

class Champion {
    var name: String
    var life: Int
    var weapon: Weapon
    var category: Category
    
    init(name: String, life: Int, category: Category, weapon: Weapon) {
        self.name = name
        self.life = life
        self.category = category
        self.weapon = weapon
    }
    
    
    func copy() -> Champion {
        return Champion(name: self.name, life: self.life, category: self.category, weapon: self.weapon)
    }
}



