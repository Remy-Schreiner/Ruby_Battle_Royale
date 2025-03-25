Mini Fighting Game

Description

This is a simple turn-based fighting game written in Ruby. Two Pokémons, Pikachu and Salamèche, engage in a battle where they attack each other until one of them loses all their life points.

Features

Two Pokémons with initial health points.

Players attack each other with randomly generated damage.

The fight continues until one player reaches zero health points.

The game displays the status of each player after every turn.

The fight begins only when the player types 'fight'.

Each round is tracked with a turn counter.

Installation

Ensure you have Ruby installed on your machine.

How to Play

$ ruby app.rb

The game will prompt you to type 'fight' to begin.

Players take turns attacking each other until one player is defeated.

The game announces the winner and ends.

Example Output

Pikachu provoque Salamèche !

Ecris fight pour combattre !
fight

Salamèche veut taper son tête

Début du combat !

Pikachu provoque Salamèche !

Ecris fight pour combattre !
fight

Salamèche veut taper son tête

-------------------------
     DEBUT DU COMBAT
-------------------------

Points de vie des Pokémons :
Pikachu a 10 points de vie
Salamèche a 10 points de vie

         ROUND 1
----------------------------
Pikachu :'Tu vas mourrir !'
Pikachu attaque Salamèche
il lui inflige 5 points de dommages
------------------------------------------
Salamèche :'Prend-ça !'
Salamèche attaque Pikachu
il lui inflige 5 points de dommages

Points de vie des Pokémons :
Pikachu a 5 points de vie
Salamèche a 5 points de vie

         ROUND 2
----------------------------
Pikachu :'Tu vas mourrir !'
Pikachu attaque Salamèche
il lui inflige 2 points de dommages
------------------------------------------
Salamèche :'Prend-ça !'
Salamèche attaque Pikachu
il lui inflige 6 points de dommages
Pikachu à perdu sont tête à tête !

-----------------------
     FIN DU COMBAT
-----------------------

Author

Rémy Schreiner

License

This project is licensed under the MIT License - see the LICENSE file for details.
