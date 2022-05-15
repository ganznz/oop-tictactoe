# frozen_string_literal: true

require_relative 'string_class'
require_relative 'player_class'
require_relative 'gameboard_class'
require_relative 'game_text_module'

# game functions and logic
class Game
  include GameText

  def initialize; end

  def define_player_name(plr_no, plr1 = nil)
    puts player_name_selection_text(plr_no)
    name = gets.chomp
    valid_name?(name, plr1)
  end

  def define_player_gameboard_char(plr_name, plr1 = nil)
    puts player_marker_selection_text(plr_name)
    char = gets.chomp
    is_valid_length = char.length == 1
    until is_valid_length && !same_gameboard_char_as_plr_one?(char, plr1)
      puts player_marker_not_one_char_text unless is_valid_length
      puts player_marker_taken_text if same_gameboard_char_as_plr_one?(char, plr1)
      char = gets.chomp
      is_valid_length = char.length == 1
    end
    char
  end

  def end_game?(gameboard_instance)
    return true if gameboard_instance.winning_combos_met?
    return true if gameboard_instance.gameboard_full?
  end

  private

  def valid_name?(name, plr1)
    is_valid_first_char = name[0].match('^[a-zA-Z]*$')
    is_valid_length = name.length >= 3 && name.length <= 15

    until is_valid_first_char && is_valid_length && !same_name_as_plr_one?(name, plr1)
      puts player_name_first_char_not_alpha_text unless is_valid_first_char
      puts player_name_invalid_length unless is_valid_length
      puts player_name_taken_text if same_name_as_plr_one?(name, plr1)

      # updates values for next loop iteration
      name = gets.chomp
      is_valid_first_char = name[0].match('^[a-zA-Z]*$')
      is_valid_length = name.length >= 3 && name.length <= 15
    end
    name
  end

  def same_name_as_plr_one?(name, plr1)
    return false if plr1.nil? # returns false if plr1 is non-existent

    name.downcase == plr1.name.downcase
  end

  def same_gameboard_char_as_plr_one?(char, plr1)
    return false if plr1.nil? # returns false if plr1 is non-existent
    char == plr1.gameboard_character
  end
end
