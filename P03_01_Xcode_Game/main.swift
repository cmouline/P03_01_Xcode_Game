//
//  main.swift
//  P03_01_Xcode_Game
//
//  Created by Symbioz on 30/10/2020.
//

import Foundation

print("Hello, Summoner! Welcome to Sword Conquest! You can put the Game in pause at any moment with stop")

// print("Do you play with a friends ? Type friend. Or you want to fight against the bot ? Type bot ")

print("You have too choose 3 champions in your team, 1 heal, 1 tank and 1 DPS in the following list.")
var game = Game()

for champion in game.championList {
    print("The \(champion.name) is a \(champion.category)")
}
// Appeller la méthode pour J1 avec le tableau de J1
game.promptChampions()
print("Super! Team is ready, let's GO!")


print("Player 2 is u turn to select a team!")
print("You have too choose 3 champions in your team, 1 heal, 1 tank and 1 DPS in the following list.")

for champion in game.championList {
    print("The \(champion.name) is a \(champion.category)")
}
// penser appeller tab j2 en paramètre de la méthode
game.promptChampions()
print("Super! Team is ready, let's GO!")




State.onGoing

// Sélection d'un champion par son nom et choix d'une action pour J1
print("J1 choisi un champion et sélectionne son action")
// Le programme applique les choix et détermine si la partie continue ou non
// Sélection d'un champion par son nom et choix d'une action pour J2
// Le programme applique les choix et détermine si la partie continue ou non
// Tout ceci boucle jusqu'à ce qu'une des deux équipes voit ses champions à 0 PV

//print("Félicitation \(winner) vous avez gagné la partie")
// Affichage des statistiques de la partie
// print(\(dmg), \(tour)) 









