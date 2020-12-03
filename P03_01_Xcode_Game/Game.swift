//
//  Game.swift
//  P03_01_Xcode_Game
//
//  Created by Symbioz on 30/10/2020.
//

import Foundation

class Game {
    var score = 0
    var championList : [Champion] = [Charmer(), Monk(), DemonHunter(), Wizzard(), Crusader(), Barbarian()]
    var player1 : Player = Player(pName: "Player1")
    var player2 : Player = Player(pName: "Player2")
    var round : Int = 0
    
    
    
    
    func hello() -> String {
        print("Hello Summoner ! What's your name ?")
        let summonerName = readLine()!
        return summonerName
    }
    
    // algo qui vérifie dans les 2 tableaux J1 et J2 si le nom y est ou pas (retourne true or false)
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
        if let prompt = Int(readLine()!) {
            // va chercher dans champions le premier champion dont le nom = prompt
            if let vChampion = self.championList.first(where: {$0.index == prompt}) {
                // on a trouvé un champion du mm nom on vérifie que ca soit bien la category demandé
                if vChampion.category == pCategory {
                    print("Quel nom souhaitez vous pour le \(vChampion.name) ?")
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
        } else {
            print("This is not a valid choice. Try again.")
        }
        return result
    }
    
    
    
    // ajouter les champions selectionnés dans le tableau passé en paramètre
    func promptChampions(_ player: Player) {
        var tank : Champion?
        var heal : Champion?
        var dps : Champion?
        
        
        
        // Boucle jusqu'à ce que les deux teams soient complètes
        while tank == nil {
            print("Witch tank would you select in your team ?")
            tank = self.createChampion(pCategory: .tank)
            if tank != nil {
                tank!.index = 1
                player.championSelected.append(tank!)
            }
        }
        print("You choose \(tank!.name) for tank.\n")
        
        while heal == nil {
            print("Witch heal would you select in your team ?")
            heal = self.createChampion(pCategory: .heal)
            if heal != nil {
                heal!.index = 2
                player.championSelected.append(heal!)
            }
        }
        print("You choose \(heal!.name) for heal.\n")
        
        while dps == nil {
            print("Witch dps would you select in your team ?")
            dps = self.createChampion(pCategory: .DPS)
            if dps != nil {
                dps!.index = 3
                player.championSelected.append(dps!)
            }
        }
        print("You choose \(dps!.name) for dps.\n")
    }
    
    
    // Print list of champions enable for the champion select.
    func printChampionList(pChampions: [Champion]) {
        for champion in pChampions {
            print("\(champion.index). \(champion.name) is a \(champion.category) with \(champion.life) HP and he got a \(champion.weapon.weaponName) for \(champion.weapon.weaponDamage) point damage.\n")
        }
    }
    
    // Game continue ? Calculate if team have 3 dead champions it's over.
    func endGame(round: Int) -> Bool {
        if self.player1.championSelected.isEmpty {
            print("\n🎉 Victory of \(player1.name) in \(round) rounds 🎉")
            return true
        } else if self.player2.championSelected.isEmpty {
            print("\n🎉 Victory of \(player2.name) in \(round) rounds 🎉")
            return true
        }
        return false
    }
    
    
    func whoStart() -> (Player, Player) {
        var truc = [self.player1, self.player2]
        truc.shuffle()
        print("🎲Le hasard décidera qui portera le premier coup!🎲\n")
        print("___________________________________________________")
        print("\(String(describing: truc.first?.name)) begin.\n")
        return (truc.first!, truc.last!)
    }
    
    
    
    
    func play() {
        let whoStart = self.whoStart()
        var playerAttacker = whoStart.0
        var playerTarget = whoStart.1
        
        while self.endGame(round: self.round) == false {
            print("Round n°\(round)")
            print("Voici la team de \(playerAttacker.name)")
            printChampionList(pChampions: playerAttacker.championSelected)
            print("_____________________________________________________")
            print("Voici la team de \(playerTarget.name)")
            printChampionList(pChampions: playerTarget.championSelected)
            
            print("\(playerAttacker.name) please select a champion for Attack")
            
            var prompt = Int(readLine()!)
            // prompt récupère la valeur de readLine en tant qu'Int
            if let championAttacker = playerAttacker.championSelected.first(where: {$0.index == prompt}) {
                //On a trouvé le champion correspondant
                print("Quel champion souhaitez vous attaquer ?")
                prompt = Int(readLine()!)
                if let championTarget = playerTarget.championSelected.first(where: {$0.index == prompt}) {
                    //On a trouvé le champion correspondant
                    championTarget.life = championTarget.life - championAttacker.weapon.weaponDamage
                    if championTarget.isAlive() {
                        print("\(championTarget.name) à subit \(championAttacker.weapon.weaponDamage) dégâts il lui reste \(championTarget.life) points de vie")
                    } else {
                        print(" ⚠️ Warning \(championTarget.name) is dead !! ☠️")
                        if let iD = playerTarget.championSelected.firstIndex(of: championTarget) {
                            playerTarget.championSelected.remove(at: iD)
                            
                        }
                    }
                    swap(&playerAttacker , &playerTarget)
                    self.round += 1
                } else {
                    print("Choix incorrect veuillez recommencer")
                }
            } else {
                print("Choix incorrect veuillez recommencer")
            }
            
            
        }
        
        
        
    }
    
    
    
    
    
    
}
