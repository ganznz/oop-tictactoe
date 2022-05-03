# frozen_string_literal: true

require_relative 'game_text_module'

# the board in which the game is displayed on
class Gameboard
  include Game_text
  attr_accessor :tiles_hash

  def initialize
    @tiles_hash = {}
    (1..9).each { |num| tiles_hash["tile#{num}"] = num.to_s }
  end

  def create_board
    row1 = " #{tiles_hash['tile1']} | #{tiles_hash['tile2']} | #{tiles_hash['tile3']} "
    row2 = " #{tiles_hash['tile4']} | #{tiles_hash['tile5']} | #{tiles_hash['tile6']} "
    row3 = " #{tiles_hash['tile7']} | #{tiles_hash['tile8']} | #{tiles_hash['tile9']} "
    row_separator = '---+---+---'
    puts "#{row1}\n#{row_separator}\n#{row2}\n#{row_separator}\n#{row3}"
  end

  def update_board(player_instance)
    player_selected_tile = player_instance.choose_tile

    # if selected tile is already occupied
    while @tiles_hash["tile#{player_selected_tile}"] != player_selected_tile
      puts tile_already_selected_text
      player_selected_tile = player_instance.choose_tile
    end

    # updates selected tile
    @tiles_hash["tile#{player_selected_tile}"] = player_instance.gameboard_character
    create_board
  end
end
