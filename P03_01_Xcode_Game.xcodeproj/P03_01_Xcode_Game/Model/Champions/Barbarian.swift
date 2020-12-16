//
//  Barbarian.swift
//  P03_01_Xcode_Game
//
//  Created by Symbioz on 02/11/2020.
//

import Foundation
class Barbarian : Champion {
    
    init() {
        super.init(pIndex: 6, pName: "barbarian", pLife: 150, category: .tank, weapon: Sword())
    }
   
 }


