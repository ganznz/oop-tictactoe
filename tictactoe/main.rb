# frozen_string_literal: true

require_relative 'game_class'
require_relative 'gameboard_class'
require_relative 'player_class'

game = Game.new
puts game.welcome_text

plr1_name = game.define_player_name(1)
plr1_gameboard_char = game.define_player_gameboard_char(plr1_name)
player1 = Player.new(plr1_name, plr1_gameboard_char)

plr2_name = game.define_player_name(2, player1)
plr2_gameboard_char = game.define_player_gameboard_char(plr2_name, player1)
player2 = Player.new(plr2_name, plr2_gameboard_char)

game_board = Gameboard.new
game_board.display_board
game_board.display_board(player1)
