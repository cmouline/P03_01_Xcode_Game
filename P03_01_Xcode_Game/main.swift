//
//  main.swift
//  P03_01_Xcode_Game
//
//  Created by Symbioz on 30/10/2020.
//

import Foundation

var game = Game()
print("Welcome to Sword Conquest! ⚔️\n")

game.player1.name = game.hello()
game.player2.name = game.hello()



print("""
  *******************************************************************

  *****************  ⚔️⚔️   CHAMPION SELECT   ⚔️⚔️  *****************

  ********************************************************************
""")

print(" \(game.player1.name) you have too choose 3 champions 🧙🏼‍♀️🧟‍♀️🧝🏾 in your team, 1 heal, 1 tank and 1 DPS in the following list.\n")

// print("Do you play with a friends ? Type friend. Or you want to fight against the bot ? Type bot ")

game.printChampionList(pChampions: game.championList)
game.promptChampions(game.player1)
print("Super! Team is ready, let's GO!\n")


print("\(game.player2.name) is u turn to select a team!\n You have too choose 3 champions 🧙🏼‍♀️🧟‍♀️🧝🏾 in your team, 1 heal, 1 tank and 1 DPS in the following list.\n")

game.printChampionList(pChampions: game.championList)
game.promptChampions(game.player2)
print("Super! Team is ready, let's GO!\n")


print("""
   ********************************************************************

   *****************  ⚔️⚔️   LET'S FIGHT !!!   ⚔️⚔️  *****************

   ********************************************************************
""")


game.play()




//print("Félicitation \(winner) vous avez gagné la partie")
// Affichage des statistiques de la partie
// print(\(dmg), \(tour)) 









