# frozen_string_literal: true

# overwrite String class with functions that can colour strings in the terminal
class String
  def red
    "\e[31m#{self}\e[0m"
  end

  def green
    "\e[32m#{self}\e[0m"
  end
end
