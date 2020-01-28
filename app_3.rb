require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/game'

my_game = Game.new("Wolverine")
binding pry