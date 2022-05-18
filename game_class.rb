# frozen_string_literal: true

require_relative 'string_class'
require_relative 'player_class'
require_relative 'gameboard_class'
require_relative 'game_text_module'
# game functions and logic
class Game
  include GameText

  def initialize; end

  def define_player_name(plr_no)
    puts player_name_selection_text(plr_no)
    name = gets.chomp
    valid_name?(name)
  end

  def define_player_gameboard_char(plr_name)
    puts player_marker_selection_text(plr_name)
    char = gets.chomp
    is_valid_length = char.length == 1
    is_number = char.length.positive? ? char.ord >= 49 && char.ord <= 57 : false
    until is_valid_length && !is_number && !same_gameboard_char_as_plr_one?(char)
      puts player_marker_not_one_char_text unless is_valid_length
      puts player_marker_cannot_be_num_text if is_number
      puts player_marker_taken_text if same_gameboard_char_as_plr_one?(char)
      char = gets.chomp
      is_valid_length = char.length == 1
      is_number = char.length.positive? ? char.ord >= 49 && char.ord <= 57 : false
    end
    char
  end

  def end_game?(gameboard_instance)
    return true if gameboard_instance.winning_combos_met?
    return true if gameboard_instance.gameboard_full?
  end

  def play_another_game?
    puts play_another_game_text
    player_input = gets.chomp.downcase
    until %w[y n].include?(player_input)
      puts invalid_replay_game_input_text
      player_input = gets.chomp.downcase
    end

    # return bool value to determine whether another game gets played or not
    player_input == 'y'
  end

  private

  def valid_name?(name)
    is_valid_length = name.length >= 3 && name.length <= 15
    until is_valid_length && !same_name_as_plr_one?(name)
      puts player_name_invalid_length unless is_valid_length
      puts player_name_taken_text if same_name_as_plr_one?(name)

      # updates values for next loop iteration
      name = gets.chomp
      is_valid_length = name.length >= 3 && name.length <= 15
    end
    name
  end

  def same_name_as_plr_one?(name)
    player_instances = Player.class_eval '@@player_instances'
    return false if player_instances.length.zero? # returns false if plr1 is non-existent

    name.downcase == player_instances[0].name.downcase
  end

  def same_gameboard_char_as_plr_one?(char)
    player_instances = Player.class_eval '@@player_instances'
    return false if player_instances.length.zero? # returns false if plr1 is non-existent

    char == player_instances[0].gameboard_character
  end
end
