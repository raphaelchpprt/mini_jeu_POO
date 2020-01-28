require_relative 'player'

class Game
  attr_accessor :human_player, :enemies

  def initialize(name)
    @human_player = HumanPlayer.new(name)
    @enemies = Array.new
    4.times do |i|
      @enemies << Player.new("player#{i+1}")
    end
    puts @enemies
  end

  def kill_player(player)
    @enemies.each do |enemie|
      if enemie.name == player
        enemies.delete_at(enemie.index)
      end
    end
  end


end


