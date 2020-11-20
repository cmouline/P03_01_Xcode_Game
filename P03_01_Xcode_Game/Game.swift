//
//  Game.swift
//  P03_01_Xcode_Game
//
//  Created by Symbioz on 30/10/2020.
//

import Foundation

enum State {
    case onGoing, pause, over
}

enum result {
    case winner, looser
}

class Game {
    var score = 0
    public var currentIndex = 0
    var state: State = .onGoing
    var championList : [Champion] = [Charmer(), DemonHunter(), Wizzard(), Crusader(), Barbarian(), Monk()]
    var championSelected = [Champion]()
    
    
    func refresh() {
        score = 0
        currentIndex = 0
        state = .over
    }
    
    // implémenter un algo qui vérifie dans les 2 tableaux J1 et J2 si le nom y est ou pas (retourne true or false)
    func isUserNameAvailable(userName: String) -> Bool {
        return true
    }
    
    
    
    // Ajouter un paramètre tableau de champions
    // ajouter les champions selectionnés dans le tableau passé en paramètre
    
    func promptChampions() {
        var tank : Champion?
        var heal : Champion?
        var dps : Champion?
        
        
        while tank == nil {
            print("Witch tank would you select in your team ?")
            // récupère la valeur de readLine() dans prompt et on rentre dans le if uniquement si prompt != nil
            if let prompt = readLine() {
                // va chercher dans champions le premier champions dont le nom = prompt
                if let champion = self.championList.first(where: {$0.name == prompt}) {
                    // si on est là c'est qu'on à trouvé un champ qui a le m nom que prompt
                    if champion.category == .tank {
                        tank = champion.copy()
                        print("Quel nom souhaitez vous pour le \(tank!.name) ?")
                        if let promptUserName = readLine() {
                            tank?.name = promptUserName
                        }
                    } else {
                        print("This champion \(champion.name) is not a tank, it's a \(champion.category)")
                    }
                } else {
                    print("Unknow tank with name \(prompt), try again.")
                }
            }
        }
        print("You choose \(tank!.name) for tank.")
        
        while heal == nil {
            print("Witch heal would you select in your team ?")
            // récupère la valeur de readLine() dans prompt et on rentre dans le if uniquement si prompt != nil
            if let prompt = readLine() {
                // va chercher dans champions le premier champions dont le nom = prompt
                if let champion = self.championList.first(where: {$0.name == prompt}) {
                    // si on est là c'est qu'on à trouvé un champ qui a le m nom que prompt
                    if champion.category == .heal {
                        heal = champion.copy()
                        print("Quel nom souhaitez vous pour le \(heal!.name) ?")
                        if let promptUserName = readLine() {
                            heal?.name = promptUserName
                        }
                    } else {
                        print("This champion \(champion.name) is not a heal, it's a \(champion.category)")
                    }
                } else {
                    print("Unknow heal with name \(prompt), try again.")
                }
            }
        }
        print("You choose \(heal!.name) for heal.")
        
        while dps == nil {
            print("Witch dps would you select in your team ?")
            // récupère la valeur de readLine() dans prompt et on rentre dans le if uniquement si prompt != nil
            if let prompt = readLine() {
                // va chercher dans [champions] le premier champion dont le nom = prompt
                if let champion = self.championList.first(where: {$0.name == prompt}) {
                    // si on est là c'est qu'on à trouvé un champ qui a le mm nom que prompt
                    if champion.category == .DPS {
                        dps = champion.copy()
                        print("Quel nom souhaitez vous pour le \(dps!.name) ?")
                        if let promptUserName = readLine() {
                            dps?.name = promptUserName
                        }
                    } else {
                        print("This champion \(champion.name) is not a dps, it's a \(champion.category)")
                    }
                } else {
                    print("Unknow dps with name \(prompt), try again.")
                }
            }
        }
        print("You choose \(dps!.name) for dps.")
        
    }
    
}




