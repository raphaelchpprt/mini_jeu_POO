require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "
-------------------------------------------------------
|      Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|   Le but du jeu est d'être le dernier survivant !   |
-------------------------------------------------------
"

puts "\nChoisis ton nom de joueur :"
print "\n> " 
human_player = gets.chomp 
user = HumanPlayer.new(human_player)

player1 = Player.new("Josiane")
player2 = Player.new("José")
enemies = [player1, player2]

while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
  puts user.show_state
  if player1.life_points > 0 && player2.life_points > 0 #Menu quand les deux ennemis sont tous les deux vivants
    puts "Quelle action veux-tu effectuer ?

    a - chercher une meilleure arme
    s - chercher à se soigner 
    
    attaquer un joueur en vue :
    0 - #{player1.name} a #{player1.life_points} points de vie
    1 - #{player2.name} a #{player2.life_points} points de vie"

  elsif player1.life_points <= 0 #Menu quand la Josiane elle est morte
    puts "Quelle action veux-tu effectuer ?

    a - chercher une meilleure arme
    s - chercher à se soigner 
    
    attaquer un joueur en vue :
    1 - #{player2.name} a #{player2.life_points} points de vie"

  elsif player2.life_points <= 0 #Menu quand le José il est mort
    puts "Quelle action veux-tu effectuer ?

    a - chercher une meilleure arme
    s - chercher à se soigner 
    
    attaquer un joueur en vue :
    0 - #{player1.name} a #{player1.life_points} points de vie"
  end

  print "\n> "
  menu_choice = gets.chomp
  if menu_choice == "a"
    user.search_weapon
  elsif menu_choice == "s"
    user.search_health_pack
  elsif menu_choice == "0"
    user.attacks(player1)
  elsif menu_choice == "1"
    user.attacks(player2)
  end

  STDIN.getch #Press any key to continue

  if player1.life_points > 0 || player2.life_points > 0
  puts"\nLes autres joueurs t'attaquent !"
  STDIN.getch #Press any key to continue
  end
  
  enemies.each do |player|
    if player.life_points > 0
      player.attacks(user)
      STDIN.getch #Press any key to continue
    end
  end
end

puts "\nLa partie est finie"
if user.life_points > 0
  puts "\nBRAVO ! TU AS GAGNÉ !"
else
  puts "\nLoooooser ! Tu as perdu !"
end
