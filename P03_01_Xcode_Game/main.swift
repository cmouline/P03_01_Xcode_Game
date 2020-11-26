//
//  main.swift
//  P03_01_Xcode_Game
//
//  Created by Symbioz on 30/10/2020.
//

import Foundation

print("Hello, Summoner! Welcome to Sword Conquest! ⚔️")

// print("Do you play with a friends ? Type friend. Or you want to fight against the bot ? Type bot ")
var game = Game()
game.championSelect() // Appeller la méthode pour J1 avec le tableau de J1
game.promptChampions()
print("Super! Team is ready, let's GO!")


print("Player 2 is u turn to select a team!")
game.championSelect() // penser appeller tab j2 en paramètre de la méthode
game.promptChampions()
print("Super! Team is ready, let's GO!")

State.onGoing

// Sélection d'un champion par son nom et choix d'une action pour J1
print(" Player 1, choose a champion and his action for this turn.")
// Le programme applique les choix et détermine si la partie continue ou non

// Sélection d'un champion par son nom et choix d'une action pour J2
print(" Player 2, choose a champion and his action for this turn.")

// Le programme applique les choix et détermine si la partie continue ou non
// Tout ceci boucle jusqu'à ce qu'une des deux équipes voit ses champions à 0 PV

print("Félicitation winner vous avez gagné la partie")
// Affichage des statistiques de la partie

// print(\(dmg), \(tour)) 









