# frozen_string_literal: true

require_relative 'game_class'
require_relative 'string_class'
require_relative 'player_class'
require_relative 'game_text_module'

# the board in which the game is displayed on
class Gameboard
  include GameText
  attr_accessor :tiles_hash, :action_history

  @@winning_combinations = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
    [1, 4, 7],
    [2, 5, 8],
    [3, 6, 9],
    [1, 5, 9],
    [3, 5, 7]
  ]

  def initialize
    @tiles_hash = {}
    (1..9).each { |num| tiles_hash["tile#{num}"] = num.to_s }
    # @player_action_history = []
    @plr_turn = 1
    system 'clear' # clears console after player initialisations
  end

  def display_board(plr_instance = nil)
    update_board(plr_instance)
    system 'clear' # clears console before showing updated board

    row1 = "\n #{tiles_hash['tile1']} | #{tiles_hash['tile2']} | #{tiles_hash['tile3']} "
    row2 = " #{tiles_hash['tile4']} | #{tiles_hash['tile5']} | #{tiles_hash['tile6']} "
    row3 = " #{tiles_hash['tile7']} | #{tiles_hash['tile8']} | #{tiles_hash['tile9']} "
    row_separator = '---+---+---'
    puts "#{row1}\n#{row_separator}\n#{row2}\n#{row_separator}\n#{row3}"

    puts won_game_text(plr_instance.name) if winning_combos_met?
    puts gameboard_full_text if gameboard_full?
  end

  def winning_combos_met?
    player_instances = Player.class_eval '@@player_instances'
    winning_combos = Gameboard.class_eval '@@winning_combinations'
    winning_combo_met = false

    player_instances.each do |player|
      coloured_characters = [player.gameboard_character.green, player.gameboard_character.red]
      player_marker = coloured_characters[@plr_turn % 2]
      winning_combos.each do |combo_list|
        scan_result = combo_list.all? { |num| tiles_hash["tile#{num}"] == player_marker }
        winning_combo_met = true if scan_result
      end
    end
    winning_combo_met
  end

  def gameboard_full?
    !winning_combos_met? && (1..9).all? { |num| tiles_hash["tile#{num}"] != num.to_s }
  end

  def determine_next_player
    player_instances = Player.class_eval '@@player_instances'
    plr_index = @plr_turn % 2
    @plr_turn += 1

    # determines what player makes the next move
    player_instances[plr_index]
  end

  private

  def update_board(plr_instance)
    plr_selected_tile = plr_instance.choose_tile
    coloured_characters = [plr_instance.gameboard_character.green, plr_instance.gameboard_character.red]

    # if selected tile is already occupied
    while @tiles_hash["tile#{plr_selected_tile}"] != plr_selected_tile
      puts tile_already_selected_text
      plr_selected_tile = plr_instance.choose_tile
    end

    # updates selected tile
    @tiles_hash["tile#{plr_selected_tile}"] = coloured_characters[@plr_turn % 2]
  end
end
