# frozen_string_literal: true

require_relative 'game_text_module'

# represents both Player instances
class Player
  include Game_text
  attr_reader :name, :player_colours
  attr_accessor :gameboard_character

  @@player_colours = "%w[green red]"

  def initialize(name, gameboard_character)
    @name = name
    # @colour = player_colours.pop(0)
    self.gameboard_character = gameboard_character
  end

  def choose_tile
    puts "#{name}, choose a tile between 1-9"
    chosen_tile = gets.chomp.to_i
    while chosen_tile < 1 || chosen_tile > 9
      puts invalid_input_text
      chosen_tile = gets.chomp.to_i
    end
    chosen_tile.to_s
  end
end
