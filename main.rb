# frozen_string_literal: true

require_relative 'game_class'
require_relative 'gameboard_class'
require_relative 'player_class'

run_game = true

while run_game
  system 'clear' # clears console whenever a new game starts

  # game instance initialisation
  game = Game.new
  puts game.welcome_text

  # player1 instance initialisation
  plr1_name = game.define_player_name(1)
  plr1_gameboard_char = game.define_player_gameboard_char(plr1_name)
  player1 = Player.new(plr1_name, plr1_gameboard_char)

  # player2 instance initialisation
  plr2_name = game.define_player_name(2)
  plr2_gameboard_char = game.define_player_gameboard_char(plr2_name)
  player2 = Player.new(plr2_name, plr2_gameboard_char)

  # gameboard instance initialisation
  gameboard = Gameboard.new
  gameboard.display_board_placeholder_text

  gameboard.display_board(gameboard.determine_next_player) until game.end_game?(gameboard)

  run_game = false unless game.play_another_game?
end

puts 'Thanks for playing!'
