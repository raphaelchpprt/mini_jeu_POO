require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("José")
# la boucle while pour que le jeu s'arrête quand au moins un des joueurs n'a plus de pv
while player1.life_points > 0 && player2.life_points > 0
  puts "\n\nVoici l'état de chaque joueur : "
  print player1.show_state
  puts player2.show_state

  puts "\nPassons à la phase d'attaque :"
  player1.attacks(player2)
  if player2.life_points <= 0
    break
  end
  player2.attacks(player1)
end