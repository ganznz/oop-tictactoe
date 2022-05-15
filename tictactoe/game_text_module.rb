# frozen_string_literal: true

require_relative 'string_class'

# module including text methods that gets printed in-game
module GameText
  def welcome_text
    'Welcome to Tic Tac Toe.'
  end

  def player_name_selection_text(plr_no)
    "What is player ##{plr_no}'s name?".green
  end

  def player_marker_selection_text(plr_name)
    "#{plr_name}, what 1-character letter/symbol do you want your gameboard marker to be?".green
  end

  def player_marker_not_one_char_text
    "\s\s >>Please choose a game marker thats one character in length.".red
  end

  def player_name_first_char_not_alpha_text
    "\s\s >>Name has to start with a letter.".red
  end

  def player_name_invalid_length
    "\s\s >>Please input a name between 3 and 15 characters.".red
  end

  def player_name_taken_text
    "\s\s >>That name is already taken!".red
  end

  def player_marker_taken_text
    "\s\s >>That marker is already taken!".red
  end

  def invalid_input_text
    "\s\s >>Invalid input: Choose a tile between 1-9.".red
  end

  def tile_already_selected_text
    "\s\s >>This tile is taken, select another one.".red
  end

  def choose_tile_text(plr_name)
    "#{plr_name}, choose a tile between 1-9.".green
  end

  def display_board_placeholder_text
    row_separator = '---+---+---'
    puts ' 1 | 2 | 3 '
    puts row_separator
    puts ' 4 | 5 | 6 '
    puts row_separator
    puts ' 7 | 8 | 9 '
  end

  def won_game_text(plr_name)
    "#{plr_name} has won the game!"
  end

  def gameboard_full_text
    'Tie! Gameboard is full.'
  end
end
