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


class Champion: Equatable {
    static func == (lhs: Champion, rhs: Champion) -> Bool {
        return lhs.index == rhs.index
    }
    
    
    var name: String
    var life: Int
    var weapon: Weapon
    var category: Category
    var index: Int
    
    init(pIndex: Int, pName: String, pLife: Int, category: Category, weapon: Weapon) {
        self.name = pName
        self.life = pLife
        self.category = category
        self.weapon = weapon
        self.index = pIndex
    }
    
    // Copie l'original pour le placer dans le tableau de championSelect du joueur
    func copy() -> Champion {
        return Champion(pIndex: self.index, pName: self.name, pLife: self.life, category: self.category, weapon: self.weapon)
    }
    
    
    // Détermine si le champion est vivant
    func isAlive() -> Bool {
        if self.life <= 0 {
            return false
        } else {
            return true
        }
    }
    
}



