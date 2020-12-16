//
//  main.swift
//  P03_01_Xcode_Game
//
//  Created by Symbioz on 30/10/2020.
//

import Foundation

var game = Game()

// MARK: Tout ton code du main pourrait se trouver dans une fonction new() de la classe Game


// MARK: CC - Pour les prints en pagaille je conseille de les intégrer dans une classe à part genre :
//
// class Output {
/// Welcome to Sword Conquest! ⚔️
//     static func intro() {
//         print("Welcome to Sword Conquest! ⚔️\n")
//     }
// }
//
// Et tu l'utilises comme ça : Output.intro()
// C'est pas obligatoire, si tu choisis cette option choisis des noms de fonctions parlant pour qu'on puisse comprendre ce qui va être affiché à la lecture du code. Tu peux même commenter ta fonction comme j'ai fait avec un triple / pour que quand tu consultes la doc de ta fonction avec option + clic sur la fonction on voit le texte qui s'affiche.
print("Welcome to Sword Conquest! ⚔️\n")

game.player1.name = game.hello(player: game.player1)
game.player2.name = game.hello(player: game.player2)



print("""

  *******************************************************************

  *****************  ⚔️⚔️   CHAMPION SELECT   ⚔️⚔️  *****************

  ********************************************************************
""")

print("\n \(game.player1.name) you have too choose 3 champions 🧙🏼‍♀️🧟‍♀️🧝🏾 in your team, 1 heal, 1 tank and 1 DPS in the following list.\n")
print("*************************************************************************************************************************")
print("Index----------------Name----------------Category----------------Life Points----------------Weapon----------------Damage")
print("*************************************************************************************************************************")

game.printChampionList(pChampions: game.championList)
game.promptChampions(game.player1)
print("\nSuper! Team is ready, let's GO!\n")


print("\n\(game.player2.name) is u turn to select a team!\n You have too choose 3 champions 🧙🏼‍♀️🧟‍♀️🧝🏾 in your team, 1 heal, 1 tank and 1 DPS in the following list.\n")
print("*************************************************************************************************************************")
print("Index----------------Name----------------Category----------------Life Points----------------Weapon----------------Damage")
print("*************************************************************************************************************************")

game.printChampionList(pChampions: game.championList)
game.promptChampions(game.player2)
print("\nSuper! Team is ready, let's GO!\n")


print("""

   ********************************************************************

   *****************  ⚔️⚔️   LET'S FIGHT !!!   ⚔️⚔️  *****************

   ********************************************************************
""")


game.play()
game.stats()









