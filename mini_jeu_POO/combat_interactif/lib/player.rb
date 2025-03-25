class Player
    attr_accessor :name, :life_points

    #Création des joueurs
    def initialize(name)
        @name = name
        @life_points = 10
    end
    
    #PV
    def show_state
        puts "#{@name} a #{@life_points} points de vie"
    end

    def gets_damage(damage_received)
        @life_points -= damage_received

        @life_points = 0 if @life_points < 0   
        end

    #Calcule les dommages de l'attaque
    def compute_damage
        return rand(1..6)
    end

    #Lance une attaque
    def attacks(player)
        puts "#{@name} attaque #{player.name}"
        damage_received = compute_damage
        player.gets_damage(damage_received)
        puts "il lui inflige #{damage_received} points de dommages"
        puts "                                                    "
      end
      
end

class HumanPlayer < Player 
    attr_accessor :weapon_level

    #Joueurs
    def initialize(name)
        super(name)
        @life_points = 100
        @weapon_level = 1
    end

    #PV
    def show_state
        puts "----------------------------------"
        puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end

  #Calcul des dommages de l'attaque
  def compute_damage
    rand(1..6) * @weapon_level
  end

  #Recherche d'armes
  def search_weapon
    new_weapon_level = rand(1..6)
    puts "----------------------------------"
    puts "Tu as loot une arme de niveau #{new_weapon_level} !"
    if new_weapon_level > @weapon_level
        @weapon_level = new_weapon_level
        puts "Génial ! Elle a un niveau supérieur à ton armes actuelle : tu la prends."
    else
        puts "M@*#$... Elle n'est pas mieux que ton arme actuelle..."
    end
end

    #Recherche pack de soins
    def search_health_pack
        dice_roll = rand(1..6)
        puts "-----------------------------"
        if dice_roll == 1
            puts "Tu n'as rien trouvé..."
          elsif dice_roll >= 2 && dice_roll <= 5
            puts "Bravo, tu as trouvé un pack de +50 points de vie !"
            @life_points += 50
          else # dice_roll ==6
            puts "Waow, tu as trouvé un pack de +80 points de vie !"
            @life_points += 80
          end

          @life_points = 100 if @life_points > 100
    end
end
