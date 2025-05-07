# frozen_string_literal: true

require_relative 'display'
require_relative 'board'
require_relative 'player'

# This file contains the game logic for Tic Tac Toe.
class Game
  include Display

  def initialize
    @board = Board.new
    @player1 = nil
    @player2 = nil
    @current_player = nil
  end

  def play
    game_set_up
    create_players
    play_rounds
    display_result
  end

  private

  # This method sets up the game by displaying the introduction message
  def game_set_up
    puts display_intro
    @board.display_board
  end

  # This method creates two players and assigns them symbols
  def create_players
    players = []

    2.times do |i|
      player_number = i + 1
      puts display_name_prompt(player_number)
      name = gets.chomp
      puts display_symbol_prompt(name)

      symbol = gets.chomp.upcase
      until %w[X O].include?(symbol)
        puts 'Invalid symbol. Please choose X or O.'
        symbol = gets.chomp.upcase
      end

      players << Player.new(name, symbol)
    end

    @player1, @player2 = players

    # Ensure symbols are unique
    while @player1.symbol == @player2.symbol
      puts duplicate_symbol
      puts display_symbol_prompt(@player2.name)
      @player2.symbol = gets.chomp.upcase
    end

    @current_player = @player1
  end

  # This method alternates between players until the game is over
  def play_rounds
    until game_over?
      take_turn
      break if game_over?

      # Checks if game over before switiching players
      switch_player
    end
  end

  # This method displays the current player's turn and updates the board
  def take_turn
    @board.display_board
    puts display_player_turn(@current_player.name)
    position = @board.valid_move?(gets)
    @board.update_cell(position, @current_player.symbol)
  end

  # This method allows us to switch between players
  def switch_player
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  # This method checks if the game is over
  def game_over?
    @board.winner?(@current_player.symbol) || @board.full?
  end

  # This method displays the winner or a tie message
  def display_result
    @board.display_board
    if @board.winner?(@player1.symbol)
      puts display_winner(@player1.name)
    elsif @board.winner?(@player2.symbol)
      puts display_winner(@player2.name)
    else
      puts display_tie
    end
  end
end
