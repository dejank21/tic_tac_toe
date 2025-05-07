# frozen_string_literal: true

# This file defines the Player class, which represents a player and their symbol.
class Player
  attr_accessor :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = valid_symbol(symbol)
  end

  # This method checks if the provided symbol is valid.
  def valid_symbol(symbol)
    valid_symbols = %w[X O]
    if valid_symbols.include?(symbol)
      symbol
    else
      puts "Invalid symbol. Please use 'X' or 'O'."
    end
  end
end
