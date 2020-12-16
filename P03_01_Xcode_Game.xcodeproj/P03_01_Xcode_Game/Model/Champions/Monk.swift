//
//  Monk.swift
//  P03_01_Xcode_Game
//
//  Created by Symbioz on 06/11/2020.
//

import Foundation

class Monk: Champion {
    
    init() {
        super.init(pIndex: 2, pName: "monk", pLife: 100, category: .heal, weapon: Stick())
    }
}


