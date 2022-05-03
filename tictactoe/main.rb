# frozen_string_literal: true

require_relative 'gameboard_class'
require_relative 'player_class'
require_relative 'game_text_module'

puts Game_text.welcome_text
player1 = Player.new('ganz', '!')
game_board = Gameboard.new

game_board.create_board
game_board.update_board(player1)

# class Game
#   def initialize; end

#   def start_game; end
# end
