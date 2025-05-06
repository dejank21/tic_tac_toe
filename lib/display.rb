# frozen_string_literal: true

# This file contains the messages that will be displayed to the user
module Display
  
  def display_intro
    "\nWelcome to Tic Tac Toe!"
  end

  def display_name_prompt(player_number)
    "Please enter your name Player #{player_number}:"
  end

  def display_symbol_prompt(player_name)
    "#{player_name}, please choose your symbol (X or O):"
  end

  def duplicate_symbol
    "Symbol already taken. Please choose a different symbol."
  end

  def display_player_turn(player_name)
    "#{player_name}'s turn. Please enter your move (1-9):"
  end

  def display_invalid_move
    "Invalid move. Please try again."
  end

  def display_winner(player_name)
    "#{player_name} wins!"
  end

  def display_tie
    "It's a tie!"
  end
end