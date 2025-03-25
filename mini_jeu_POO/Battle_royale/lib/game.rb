class Game
    attr_accessor :human_player, :enemies_in_sight, :players_left
  
    def initialize(name)
      @human_player = HumanPlayer.new(name)
      @enemies_in_sight = []
      @players_left = 10
    end
  
    def kill_player(player)
      @enemies_in_sight.delete(player)
    end
  
    def is_still_ongoing?
        @human_player.life_points > 0 && @players_left > 0
    end
    
  
    def show_players
      @human_player.show_state
      puts "Il reste #{@players_left} ennemis à éliminer."
      puts "Ennemis en vue : #{@enemies_in_sight.count}"
    end
  
    def menu
      puts "-----------------------------------"
      puts "\nQuelle action veux-tu effectuer ?"
      puts "a - chercher une meilleure arme"
      puts "s - chercher à se soigner"
      puts "                                   "
      puts "             OU                  "
      puts "\nAttaquer des ennemis en vue :"
      @enemies_in_sight.each_with_index do |enemy, index|
        puts "#{index} - #{enemy.show_state} Attaquer" if enemy.life_points > 0
      end
    end
  
    def menu_choice(choice)
      case choice
      when "a"
        @human_player.search_weapon
      when "s"
        @human_player.search_health_pack
      else
        index = choice.to_i
        if index.between?(0, @enemies_in_sight.size - 1) && @enemies_in_sight[index].life_points > 0
          @human_player.attacks(@enemies_in_sight[index])
          kill_player(@enemies_in_sight[index]) if @enemies_in_sight[index].life_points <= 0
        else
          puts "Choix invalide."
        end
      end
    end
  
    def enemies_attack
      puts "Les ennemis attaquent !"
      @enemies_in_sight.each { |enemy| enemy.attacks(@human_player) if enemy.life_points > 0 }
    end
  
    def new_players_in_sight
        puts "-----------------------------------"
      if @players_left == @enemies_in_sight.size
        puts "Tous les joueurs sont déjà en vue."
        return
      end
      
      dice_roll = rand(1..6)
      if dice_roll == 1
        puts "-----------------------------------"
        puts "Aucun nouvel ennemi en vue."
      elsif dice_roll.between?(2, 4)
        new_enemy = Player.new("Joueur_#{rand(1000..9999)}")
        @enemies_in_sight << new_enemy
        @players_left -= 1
        puts "-----------------------------------"
        puts "Un nouvel ennemi est arrivé en vue !"
      else # dice_roll == 5 ou 6
        2.times do
          break if @players_left == @enemies_in_sight.size
          new_enemy = Player.new("Joueur_#{rand(1000..9999)}")
          @enemies_in_sight << new_enemy
          @players_left -= 1
        end
        puts "-----------------------------------"
        puts "Deux nouveaux ennemis sont arrivés en vue !"
      end
    end
  
    def end_game
      puts "-----------------------------------"
      puts "\nLa partie est finie."
      if @human_player.life_points > 0
        puts "BRAVO ! TU AS GAGNÉ !"
      else
        puts "Loser ! Tu as perdu !"
      end
      puts "-----------------------------------"
    end
  end
  