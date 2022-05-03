module Game_text
  def welcome_text; 'Welcome to a game of Tic Tac Toe.'; end

  def player_name_selection_text(player_no); "What is player ##{player_no}'s name?"; end

  def player_symbol_selection_text; 'What letter or symbol do you want your gameboard marker to be?'; end

  def invalid_input_text; 'Invalid input: Choose a tile between 1-9'; end

  def tile_already_selected_text; 'This tile is taken, select another one.'; end
end