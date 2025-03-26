require 'bundler'
Bundler.require

require_relative 'lib/player'

#binding.pry

#Créations des pokémons
player1= Player.new("Pikachu")
player2= Player.new ("Salamèche")

#Proc du combat
puts "#{player1.name} provoque #{player2.name} !"
puts "                                                                "
puts "Ecris fight pour combattre !"
while gets.chomp.downcase != "fight"
    #Si le bon mot n'est pas entrée
    puts "Tu décide de fuir !"
end
puts "                                                                "
puts "#{player2.name} veut taper son tête !"
puts "                                                                "
puts "-------------------------"
puts "     DEBUT DU COMBAT "
puts "-------------------------"

turn_number = 1

#Boucle du combat
while player1.life_points > 0 && player2.life_points > 0
    #Affichage PV
    puts "                                                          "
    puts "Points de vie des Pokémons :"
    player1.show_state
    player2.show_state
    puts "                                                          "

    #Attaque P1 to P2
    puts "         ROUND #{turn_number}"
    puts "----------------------------"
    puts "#{player1.name} :'Tu vas mourrir !'"
    player1.attacks(player2)

    #Vérif si P1 mort, si oui, sortir de la boucle
    break if player2.life_points <= 0

    #Attaque P2 to P1
    puts "------------------------------------------"
    puts "#{player2.name} :'Prend-ça !'"
    player2.attacks(player1)

    #Vérif si P2 mort, si oui, sortir de la boucle
    break if player1.life_points <= 0
    turn_number += 1
end

#Fin de combat
if player1.life_points <= 0
    puts "#{player1.name} à perdu sont tête à tête !"
elsif player2.life_points <= 0
    puts "#{player2.name} à perdu sont tête à tête !"
end

puts "                             "
puts "-----------------------"
puts "     FIN DU COMBAT"
puts "-----------------------"
