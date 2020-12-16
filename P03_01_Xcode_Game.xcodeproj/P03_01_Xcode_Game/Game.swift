//
//  Game.swift
//  P03_01_Xcode_Game
//
//  Created by Symbioz on 30/10/2020.
//

import Foundation

class Game {
    var championList : [Champion] = [Necromancer(), Monk(), DemonHunter(), Wizzard(), Crusader(), Barbarian()]
    var player1 : Player = Player(pName: "Player1")
    var player2 : Player = Player(pName: "Player2")
    var round : Int = 1
    var legendaryWeapons = [Gungnir(), Trisula(), Mjöllnir()]
    
    
    
    
    func hello(player: Player) -> String {
        // MARK: CC - Si tu utilises uniquement le name de player et aucune autre de ses propriétes, pourquoi passer l'objet en entier ?
        print("\nHello \(player.name) ! What's your name ?")
        let summonerName = readLine()
        // MARK: CC - Forcecast à supprimer
        return summonerName!
    }
    
    // algo qui vérifie dans les 2 tableaux J1 et J2 si le nom y est ou pas (retourne true or false)
    func isUserNameAvailable(userName: String) -> Bool {
        if self.player1.championSelected.contains(where: {$0.name == userName}) || self.player2.championSelected.contains(where: {$0.name == userName}) {
            return false
        }
        return true
    }
    
    // MARK: CC - pXXX à renommer
    func createChampion(pCategory: Category) -> Champion? {
        var result : Champion?
        // récupère la valeur de readLine() dans prompt et on rentre dans le if uniquement si prompt != nil
        // MARK: CC - Forcecast à supprimer
        if let prompt = Int(readLine()!) {
            // va chercher dans champions le premier champion dont le nom = prompt
            if let vChampion = self.championList.first(where: {$0.index == prompt}) {
                // on a trouvé un champion du mm nom on vérifie que ca soit bien la category demandé
                if vChampion.category == pCategory {
                    print("\nQuel nom souhaitez vous pour le \(vChampion.name) ?")
                    if let promptUserName = readLine() {
                        if self.isUserNameAvailable(userName: promptUserName) {
                            result = vChampion.copy()
                            // MARK: CC - Forcecast à supprimer
                            result!.name = promptUserName
                        } else {
                            print("\n⚠️ This name \(promptUserName) is not available ⚠️, try again.\n")
                        }
                    }
                } else {
                    print(" \n⚠️ This champion \(vChampion.name) is not a \(pCategory), it's a \(vChampion.category) ⚠️\n")
                }
            } else {
                print("\n⚠️ Unknow champion with name \(prompt), ⚠️ try again.\n")
            }
        } else {
            print("\nThis is not a valid choice. Try again.")
        }
        return result
    }
    
    
    
    // ajouter les champions selectionnés dans le tableau passé en paramètre
    func promptChampions(_ player: Player) {
        var tank : Champion?
        var heal : Champion?
        var dps : Champion?
        
        // MARK: CC - 3 boucles qui se ressemblent beaucoup -> A refact

        // Boucle jusqu'à ce que les deux teams soient complètes
        while tank == nil {
            print("\nWitch tank would you select in your team ?")
            tank = self.createChampion(pCategory: .tank)
            if tank != nil {
                tank!.index = 1
                player.championSelected.append(tank!)
            }
        }
        print("\nYou choose \(tank!.name) for tank.\n")
        
        while heal == nil {
            print("\nWitch heal would you select in your team ?")
            heal = self.createChampion(pCategory: .heal)
            if heal != nil {
                heal!.index = 2
                player.championSelected.append(heal!)
            }
        }
        print("\nYou choose \(heal!.name) for heal.\n")
        
        while dps == nil {
            print("\nWitch dps would you select in your team ?")
            dps = self.createChampion(pCategory: .DPS)
            if dps != nil {
                dps!.index = 3
                player.championSelected.append(dps!)
            }
        }
        print("\nYou choose \(dps!.name) for dps.\n")
        player.championStat.append(contentsOf: player.championSelected)
    }
    
    
    // Print list of champions enable for champion select or game.
    func printChampionList(pChampions: [Champion]) {
        for champion in pChampions {
            print("\(champion.index).               \(champion.name)               \(champion.category)                \(champion.life)HP               \(champion.weapon.weaponName)                      \(champion.weapon.weaponDamage) dmg.\n")
        }
    }
    
    // Game continue ? Calculate if team have 3 dead champions it's over.
    func endGame(round: Int) -> Bool {
        // MARK: CC - 2 conditions qui se ressemblent -> à refact
        if self.player1.championSelected.isEmpty {
            print("\n🎉 Victory of \(player1.name) in \(round) rounds 🎉\n")
            return true
        } else if self.player2.championSelected.isEmpty {
            print("\n🎉 Victory of \(player2.name) in \(round) rounds 🎉\n")
            return true
        }
        return false
    }
    
    // decide who start
    func whoStart() -> (Player, Player) {
        var alea = [self.player1, self.player2]
        alea.shuffle()
        print("🎲 Chance will decide who will strike the first blood ! 🎲\n")
        print("___________________________________________________")
        print("\(String(describing: alea.first!.name)) begin.\n")
        // MARK: CC - Forcecast à supprimer
        return (alea.first!, alea.last!)
    }
    
    func magicChest(champion: Champion) {
        let randomAppear = Int.random(in: 1...10) // 1/10 chances chest pop up
        let randomContent = Int.random(in: 1...5) // 5 possibilities for the content of the chest
        if randomAppear == 2 || randomAppear == 6 || randomAppear == 9 {
            print("A Chest just popped up !!")
            print("")
            print("")
            print("You're opening the chest....")
            print("")
            print("")
            
            switch randomContent {
            case 1:
                print("You found a new weapon : Gungnir!! Your got the power of Odin 70 damage!")
                champion.weapon = Gungnir()
            case 2:
                print("The chest was empty")
            case 3:
                print("You found a new weapon: Trisula! with power of 30 and heal 40!")
                if champion.category == .heal {
                    champion.weapon = Trisula()
                } else {
                    print("Sorry, this weapon is only for heal, maybe more luck next time 🤪 ")
                }
            case 4:
                print("BBBOOOOOOOOMMM !!!  There was a bomb in the chest, you lose 10 points of life")
                champion.life -= 10
            case 5:
                print("You found a new weapon: Mjöllnir with a power of 50 !! ")
                champion.weapon = Mjöllnir()
            default: print("error")
            }
            print("*************************************************")
        }
    }
    
    // game logic with attack, heal
    func play() {
        let whoStart = self.whoStart()
        var playerAttacker = whoStart.0
        var playerTarget = whoStart.1
        
        // MARK: CC - Refact la fonction, penser que heal et attaquer c'est la même chose à la différence de 1. l'équipe de la cible 2. on ajoute des pv au lieu d'en retirer.
        while self.endGame(round: self.round) == false {
            print("\nRound n°\(round)")
            print("\nVoici la team de \(playerAttacker.name)\n")
            printChampionList(pChampions: playerAttacker.championSelected)
            print("_____________________________________________________\n")
            print("\nVoici la team de \(playerTarget.name)")
            printChampionList(pChampions: playerTarget.championSelected)
            //            if playerAttacker.championSelected[2].isAlive() {
            print("\(playerAttacker.name) do u want to\n 1.Attack an ennemy team\n 2.Heal one of your mates ?")
            let selectAction = readLine()
            if selectAction == "1" {  // le joueur chosit d'attaquer
                print("\(playerAttacker.name) please select a champion for Attack\n")
                var prompt = Int(readLine()!)
                // prompt récupère la valeur de readLine en tant qu'Int
                if let championAttacker = playerAttacker.championSelected.first(where: {$0.index == prompt}) {
                    //On a trouvé le champion correspondant
                    magicChest(champion: championAttacker)
                    var championTarget: Champion? = nil
                    while championTarget == nil {
                        print("Quel champion souhaitez vous attaquer ?\n")
                        prompt = Int(readLine()!)
                        championTarget = playerTarget.championSelected.first(where: {$0.index == prompt})
                        if championTarget != nil {
                            //On a trouvé le champion correspondant
                            championTarget!.life = championTarget!.life - championAttacker.weapon.weaponDamage
                            if championTarget!.isAlive() {
                                print("\(championTarget!.name) à subit \(championAttacker.weapon.weaponDamage) dégâts il lui reste \(championTarget!.life) points de vie\n")
                            } else {
                                print(" ⚠️ Warning \(championTarget!.name) is dead !! ☠️\n")
                                print("☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️\n")
                                if let iD = playerTarget.championSelected.firstIndex(of: championTarget!) {
                                    playerTarget.championSelected.remove(at: iD)
                                    
                                }
                            }
                            swap(&playerAttacker , &playerTarget)
                            self.round += 1
                        } else {
                            print("⚠️ Choix incorrect veuillez recommencer ⚠️\n")
                        }
                    }
                }else {
                    print("Choix incorrect veuillez recommencer\n")
                }
                
                
            } else if selectAction == "2" { // Le joueur choisit de soigner
                print("\(playerAttacker.name) please select a champion for heal\n")
                var prompt = Int(readLine()!)
                // prompt récupère la valeur de readLine en tant qu'Int
                if let championAttacker = playerAttacker.championSelected.first(where: {$0.index == prompt}), championAttacker.category == .heal {
                    //On a trouvé le champion correspondant
                    // Il faut vérifier que ça soit bien un heal
                    magicChest(champion: championAttacker)
                    print("Quel champion souhaitez vous soigner ?\n")
                    prompt = Int(readLine()!)
                    if let championAttacker = playerAttacker.championSelected.first(where: {$0.index == prompt}) {
                        //On a trouvé le champion correspondant
                        championAttacker.life = championAttacker.life + championAttacker.weapon.heal
                        if championAttacker.isAlive() {
                            print("\(championAttacker.name) à été soigné de \(championAttacker.weapon.heal) points de vie, il à désormais \(championAttacker.life) points de vie\n")
                        } else {
                            print(" ⚠️ Warning \(championAttacker.name) is dead !! ☠️\n")
                            print("☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️\n")
                            if let iD = playerAttacker.championSelected.firstIndex(of: championAttacker) {
                                playerTarget.championSelected.remove(at: iD)
                                
                            }
                        }
                        swap(&playerAttacker , &playerTarget)
                        self.round += 1
                    } else {
                        print("⚠️ Choix incorrect veuillez recommencer ⚠️\n")
                    }
                } else {
                    print("Choix incorrect ce champion n'est pas un heal veuillez recommencer\n")
                }
                
            }
        }
    }
    
    // Affichage des stats de fin de partie
    func stats() {
        if endGame(round: self.round) {
            print("Game end in \(self.round)")
            print("\(player1.championStat)")
            print("\(player2.championStat)")
            
        }    }
    
}
