//
//  Weapons.swift
//  P03_01_Xcode_Game
//
//  Created by Symbioz on 30/10/2020.
//

import Foundation
class Weapon {
    
    var weaponName: String
    var weaponDamage: Int
    var heal: Int
    
    init(weaponName: String, weaponDamage: Int, heal: Int) {
        self.weaponName = weaponName
        self.weaponDamage = weaponDamage
        self.heal = heal
    }
    
}
