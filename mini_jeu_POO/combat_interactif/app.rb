require 'bundler'
Bundler.require

require_relative 'lib/player'

#binding.pry

# Accueil
puts "------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"

#Joueur
puts "Quel est ton prénom ?"
user_name = gets.chomp
user = HumanPlayer.new(user_name)

#Ennemis
player1 = Player.new("Josiane")
player2 = Player.new("Jean")

ennemis = [player1, player2]

#Boucle combat
while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
    #Etat joueur
    user.show_state

    #Etat ennemis
    puts "-----------------------------------"
    puts "Voici les ennemis en face de toi :"
    puts "0 - #{player1.name} a #{player1.life_points} points de vie"
    puts "1 - #{player2.name} a #{player2.life_points} points de vie"

    #Option d'action
    puts "-----------------------------------"
    puts "Quelle action veux-tu effectuer ?"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts "                                "
    puts "Choisis une action !"
    print ">"
    action = gets.chomp

    case action
    when "a"
        user.search_weapon
    when "s"
        user.search_health_pack
    when "0"
        user.attacks(player1)
    when "1"
        user.attacks(player2)
    else
        puts "Choix invalide, veuillez réessayer."
  end

    #Attaque ennemis
    puts "-----------------------------------"
     puts "Les autres joueurs t'attaquent !"
     puts "                                    "
     ennemis.each do |enemy|
        if enemy.life_points > 0
        enemy.attacks(user)
        end
    end
end

#fin du jeu
puts "--------------------"
puts "Fin de la partie !"
if user.life_points > 0
    puts "BRAVO ! TU AS GAGNE ! "
else
    puts "Loser ! Tu as perdu !"
end
