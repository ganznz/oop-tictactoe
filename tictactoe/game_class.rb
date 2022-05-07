# frozen_string_literal: true

require_relative 'game_text_module'
require_relative 'string_class'
require_relative 'player_class'

# game functions and logic
class Game
  include GameText

  def initialize; end

  def define_player_name(plr_no, plr_one = nil)
    puts player_name_selection_text(plr_no)
    name = gets.chomp

    until name[0].match('^[a-zA-Z]*$') && (name.length >= 3 && name.length <= 9)
      puts player_name_first_char_not_alpha_text unless name[0].match('^[a-zA-Z]*$')
      unless name.length >= 3 && name.length <= 9
        puts player_name_too_short_text unless name.length >= 3
        puts player_name_too_long_text unless name.length <= 9
      end
      name = gets.chomp
    end

    (puts player_name_taken_text while name == plr1.name) unless plr1.nil?
    name
  end

  def define_player_gameboard_char(plr_name)
    puts player_marker_selection_text(plr_name)
    char = gets.chomp
    until char.length == 1
      puts player_marker_not_one_char_text
      char = gets.chomp
    end
    char
  end
end
