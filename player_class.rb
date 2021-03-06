# frozen_string_literal: true

require_relative 'game_text_module'

# represents both Player instances
class Player
  include GameText
  attr_reader :name
  attr_accessor :gameboard_character, :colour

  @@player_colours = %w[green red]
  @@player_instances = []
  @@player_instance_count = 0

  def initialize(name, gameboard_character)
    @name = name
    self.colour = @@player_colours[@@player_instance_count % 2]
    # @@player_colours.shift # determines colour of next Player instance
    self.gameboard_character = gameboard_character
    @@player_instances.unshift(self)
    @@player_instance_count += 1
  end

  def choose_tile
    puts choose_tile_text(name)
    chosen_tile = gets.chomp.to_i
    while chosen_tile < 1 || chosen_tile > 9
      puts invalid_input_text
      chosen_tile = gets.chomp.to_i
    end
    chosen_tile.to_s
  end
end
