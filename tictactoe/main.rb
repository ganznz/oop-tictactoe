# frozen_string_literal: true

require_relative 'gameboard_class'
require_relative 'player_class'
require_relative 'game_text_module'

player1 = Player.new('ganz', '!')
game_board = Gameboard.new

game_board.display_board
game_board.display_board(player1)
