class Player
    attr_accessor :name, :life_points

    #Création des Pokémons
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
      end
      
end

