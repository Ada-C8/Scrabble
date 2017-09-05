require_relative 'wave-1-scoring.rb'
require_relative 'wave-2-player.rb'
require_relative 'wave-3-TileBag.rb'
require_relative 'board.rb'
require_relative 'dictionary'

module Scrabble
  class Game
    def initialize
      @words = []
      @players = setup_players
      @tilebag = Scrabble::TileBag.new
      @board = Scrabble::Board.new
      @board.create_board
    end

    def play
      start

      while continue?
        @players.each do |player|
          @board.show_table

          puts "It is #{player.name}'s turn"

          player.draw_tiles(@tilebag)

          puts "#{player.name} has the following tiles: #{player.tiles}"

          player_word = get_word_for(player)

          word_validation = Scrabble::Dictionary.look_up(player_word)
          if word_validation == false
            puts "Not a real word"
          end

          loc_num = get_loc_num_for(player)
          loc_let = get_loc_letter_for(player)
          direction = get_direction_for(player)

          tiles_needed = @board.check_if_possible(player_word, loc_let, loc_num, direction)

          if tiles_needed == false
            puts "Not a valid word for that location"
          else
            tiles_needed = tiles_needed.join
            compare_tiles = player.compare_to_tiles(tiles_needed)
            if compare_tiles == false
              puts "player doesn't have the tiles needed"
            end
          end

          @words << player_word
          @board.play_word(player_word, loc_let, loc_num.to_i, direction)
          @board.show_table

          player.play(player_word)

          player_has_won = !player_word

          if player_word
            print_score(player_word)
          end

          if player_has_won
            crown_winner(player)
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
      # @players.each do |player|
      #   if player.won?
      #     crown_winner(player)
      #     return false
      #   end
      # end

      puts "Would you like to play another round? (Y/N)"
      continue = gets.chomp.upcase
      (continue == "Y") ? true : false
    end

    def get_word_for(player)

      word_validation = false

      while word_validation == false
        puts "Enter a word to score:"
        word = gets.chomp.upcase

        while word.match(/[\W_\d]/) || word == ""
          puts "You must enter a word."
            word = gets.chomp.upcase
        end

        return word
      end
    end

    def get_loc_num_for(player)
      loc_num = String.new
      until loc_num.match(/^([1-9]|1[012])$/)
        puts "What column (number) would you like the word to begin?"
        loc_num = gets.chomp
      end
      return loc_num.to_i
    end

    def get_loc_letter_for(player)
      loc_let = String.new
      until loc_let =~ (/[A-Za-z]/)
        puts "What row (letter) would you like the word to begin?"
        loc_let = gets.chomp
      end
      loc_let = loc_let.upcase
    end

    def get_direction_for(player)
      direction = String.new
      until direction == "across" || direction == "down"
        puts "Would you like to play down or across?"
        direction = gets.chomp.downcase
      end
      return direction
    end

    def print_score(word)
      result = Scrabble::Scoring.score(word)
      puts "The score of #{ word } is #{ result }"
    end

    def crown_winner(player)
      puts "#{player.name} has won!"
    end

    def conclude
      highest_word = Scrabble::Scoring.highest_score_from(@words)
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




game = Scrabble::Game.new
game.play
