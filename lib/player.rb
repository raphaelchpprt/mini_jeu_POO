class Player
  attr_accessor :name, :life_points

  def initialize(name, life_points = 10)
    @name = name
    @life_points = life_points
  end

#Afficher les pv
  def show_state
    puts "\n #{name} a #{life_points} points de vie."
  end

#Dommages infligés
  def gets_damage(damage_received)
    @life_points -= damage_received
    if @life_points <= 0
      @life_points = 0
      puts "Le joueur #{name} a été tué !"
    end
  end

#Faire perdre des pv
  def attacks(player)
    puts "\nLe joueur #{@name} attaque le joueur #{player.name} !"
    damage_done = compute_damage
    puts "Il lui inflige #{damage_done} points de dommages !"
    player.gets_damage(damage_done)
  end

  def compute_damage
    return rand(1..6)
  end

end

#Classe fille
class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    super (name)
    @weapon_level = 1
    @life_points = 100
  end

  def show_state
    puts "\n#{name} a #{life_points} points de vie et une arme de niveau #{weapon_level}."
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

#changement d'arme à condition qu'elle soit mieux l'arme initiale
  def search_weapon
    new_weapon_level = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon_level} !"
    if new_weapon_level > @weapon_level
      @weapon_level = new_weapon_level
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends !"
      puts "Tu possèdes désormais une arme de niveau #{weapon_level}."
    else
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end

#essayer de trouver un pack soin pour gagner des pv
  def search_health_pack
    health_pack = rand(1..6)
    if health_pack == 1
      puts "Dommage, tu n'as rien trouvé..."
    elsif health_pack >= 2 && health_pack <= 5
      @life_points += 50
        if @life_points > 100
          @life_points = 100
        end
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
    else
      @life_points += 80
        if @life_points > 100
          @life_points = 100
        end
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
    end
  end

end