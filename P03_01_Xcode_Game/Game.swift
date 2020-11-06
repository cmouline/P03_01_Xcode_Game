//
//  Game.swift
//  P03_01_Xcode_Game
//
//  Created by Symbioz on 30/10/2020.
//

import Foundation
class Game {
    var score = 0
    
    public var currentIndex = 0
    
    var state: State = .onGoing
    
    enum State {
        case onGoing, over
    }
    
    
    func refresh() {
        score = 0
        currentIndex = 0
        state = .over
    }
    
}
