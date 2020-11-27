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


class Game {
    var score = 0
    public var currentIndex = 0
    var state: State = .onGoing
    var championList : [Champion] = [Charmer(), DemonHunter(), Wizzard(), Crusader(), Barbarian(), Monk()]
    var player1 : Player = Player()
    var player2 : Player = Player()
    
    func refresh() {
        score = 0
        currentIndex = 0
        state = .over
    }
    
    // implémenter un algo qui vérifie dans les 2 tableaux J1 et J2 si le nom y est ou pas (retourne true or false)
    func isUserNameAvailable(userName: String) -> Bool {
        if self.player1.championSelected.contains(where: {$0.name == userName}) {
            return false
        }
        if self.player2.championSelected.contains(where: {$0.name == userName}) {
            return false
        }
        return true
    }
    
    
    func createChampion(pCategory: Category) -> Champion? {
        var result : Champion?
        // récupère la valeur de readLine() dans prompt et on rentre dans le if uniquement si prompt != nil
        if let prompt = readLine() {
            // va chercher dans champions le premier champion dont le nom = prompt
            if let vChampion = self.championList.first(where: {$0.name == prompt}) {
                // on a trouvé un champion du mm nom on vérifie que ca soit bien la category demandé
                if vChampion.category == pCategory {
                    print("Quel nom souhaitez vous pour le \(vChampion.name) ?\n")
                    if let promptUserName = readLine() {
                        if self.isUserNameAvailable(userName: promptUserName) {
                            result = vChampion.copy()
                            result!.name = promptUserName
                        } else {
                            print("⚠️ This name \(promptUserName) is not available ⚠️, try again.\n")
                        }
                    }
                } else {
                    print(" ⚠️ This champion \(vChampion.name) is not a \(pCategory), it's a \(vChampion.category) ⚠️\n")
                }
            } else {
                print("⚠️ Unknow champion with name \(prompt), ⚠️ try again.\n")
            }
        }
        return result
    }
    
    
    
    // ajouter les champions selectionnés dans le tableau passé en paramètre
    func promptChampions(_ player: Player) {
        var tank : Champion?
        var heal : Champion?
        var dps : Champion?
        
        
        
        
        while tank == nil {
            print("Witch tank would you select in your team ?\n")
            tank = self.createChampion(pCategory: .tank)
            if tank != nil {
                player.championSelected.append(tank!)
            }
        }
        print("You choose \(tank!.name) for tank.\n")
        
        while heal == nil {
            print("Witch heal would you select in your team ?\n")
            heal = self.createChampion(pCategory: .heal)
            if heal != nil {
                player.championSelected.append(heal!)
            }
        }
        print("You choose \(heal!.name) for heal.\n")
        
        while dps == nil {
            print("Witch dps would you select in your team ?\n")
            dps = self.createChampion(pCategory: .DPS)
            if dps != nil {
                player.championSelected.append(dps!)
            }
        }
        print("You choose \(dps!.name) for dps.\n")
    }
    
    func printChampionSelect() {
        print("You have too choose 3 champions 🧙🏼‍♀️🧟‍♀️🧝🏾 in your team, 1 heal, 1 tank and 1 DPS in the following list.\n")
        for champion in game.championList {
            print("The \(champion.name) is a \(champion.category) he have \(champion.life) heart point and he got a \(champion.weapon.weaponName) for \(champion.weapon.weaponDamage) point damage.\n")
        }
        
        
    }
    
    
}


