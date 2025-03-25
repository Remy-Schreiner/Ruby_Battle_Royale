require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#binding.pry

# Accueil
puts "------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"

# Initialisation du jeu
puts "Quel est ton prénom ?"
user_name = gets.chomp
my_game = Game.new(user_name)

# Boucle de jeu
while my_game.is_still_ongoing?
    my_game.show_players
    my_game.new_players_in_sight
    my_game.menu
    print "> "
    choice = gets.chomp
    my_game.menu_choice(choice)
    my_game.enemies_attack if my_game.is_still_ongoing?
end

#fin du jeux
my_game.end_game