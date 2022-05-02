# frozen_string_literal: true

# represents both Player instances
class Player
  attr_accessor :gameboard_character

  def initialize(name, gameboard_character)
    @name = name
    self.gameboard_character = gameboard_character
  end
end
