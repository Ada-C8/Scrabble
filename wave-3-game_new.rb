require_relative 'lib/scrabble-player_updated'
require_relative 'lib/scrabble-scoring'
require_relative 'lib/scrabble-tilebag'
require_relative 'lib/scrabble-board'


module Scrabble
  class Game
    def initialize(size)
      @words = []
      @players = setup_players
      @tilebag = Scrabble::TileBag.new
      @board = Scrabble::Board.new(size)
    end

    def play
      start
      while continue?
        @board.print_board
        @players.each do |player|
          puts "It is #{player.name}'s turn"

          player.draw_tiles(@tilebag)

          puts "#{player.name} has the following tiles: #{player.tiles}"

          player_word = get_word_for(player)
          player_has_won = !player_word

          if player_word
            print_score(player_word)
          end

          if player_has_won
            break
          end
        end
      end

      conclude
    end

    private

    def setup_players
      puts "How many players do you have?"
      num_of_players = get_int_input

      players = []
      num_of_players.times do |player|
        players << Player.new(get_player_name(player))
      end
      return players
    end

    def start
      puts "Welcome to our Scrabble game!"
    end

    def continue?
      return true if @words.length == 0 # haven't started playing yet
      @players.each do |player|
        if player.won?
          crown_winner(player)
          return false
        end
      end

      puts "Would you like to play another round? (Y/N)"
      continue = gets.chomp
      (continue == "Y") ? true : false
    end

    def get_word_for(player)
      puts "Enter a word to score:"
      word = gets.chomp
      good_word = player.play(word)

      col_index = @size
      until col_index < @size && col_index >= 0
        puts "Enter a column index: "
        col_index = gets.chomp.to_i
      end
      row_index = @size
      until row_index < @size && row_index >= 0
        puts "Enter a column index: "
        row_index = gets.chomp.to_i
      end
      direction = ""
      until [:down, :right].include? direction
        puts "What direction should your word be played? (down or right)"
        direction = gets.chomp.to_sym
      end


      @board.check_placement(good_word,[row,col],)
      @words << keep_playing

      if keep_playing
        return keep_playing
      else
        return false
      end
    end

    def print_score(word)
      result = Scrabble::Scoring.score(word)
      puts "The score of #{ word } is #{ result }"
    end

    def crown_winner(player)
      puts "#{player.name} has won!"
    end

    def conclude
      highest_word = Scrabble::Scoring.highest_score_from_array(@words)
      puts "The final highest scoring word for all players is #{ highest_word }"

      @players.each do |player|
        puts "The highest scoring word for #{player.name} is \"#{player.highest_scoring_word}\" for #{player.highest_word_score} points"
      end
    end

    def get_int_input
      input = gets.chomp
      while input.match(/\D/)
        puts "Please put in a valid integer"
        input = gets.chomp
      end
      return input.to_i
    end

    def get_player_name(player_number)
      puts "What is the name of Player \##{player_number + 1}?"
      return gets.chomp
    end
  end
end


size = 0
until size > 0
  puts "How big of a board would you like to play on?"
  size = gets.chomp.to_i
end

game = Scrabble::Game.new(size)
game.play
