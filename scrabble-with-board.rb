require_relative 'lib/scrabble'

module Scrabble
  class Game
    def initialize
      @words = []
      @players = setup_players
      @tilebag = Scrabble::TileBag.new
      @board = Scrabble::Board.new
    end

    def play
      start

      while continue?
        @players.each do |player|
          @board.draw_board
          puts "It is #{player.name}'s turn"

          player.draw_tiles(@tilebag)

          puts "#{player.name} has the following tiles: #{player.tiles}"

          player_word = get_word_for(player)
          words_made_before = player.plays.length
          player_has_won = !player_word
          words_made_after = player.plays.length

          if player_word
            print_score(player_word)
          end

          if player_has_won && words_made_before != words_made_after
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

      puts "Would you like to play another round? (Y/N)"
      continue = gets.chomp
      (continue == "Y") ? true : false
    end

    def get_word_for(player)
      placed_word_on_board = false
      word = ""
      direction = ""
      tile_num = 0
      until placed_word_on_board != false
        puts "Enter a word to score:"
        word = gets.chomp
        puts "Enter the direction to place the word on the board [horizontal OR vertical]: "
        direction = gets.chomp.downcase
        until direction.downcase == "vertical" ||  direction.downcase == "horizontal"
          puts "The only available directions are 'vertical' or 'horizontal'"
          direction = gets.chomp.downcase
        end
        puts "Enter the tile number to place the word on: "
        tile_num = gets.chomp.to_i
        until tile_num > 0 && tile_num <= 225
          puts "Invalid entry. Choose a number from 1 - 225."
          tile_num = gets.chomp.to_i
        end

        placed_word_on_board = player.play(word) # False means player won or word was invalid
        if placed_word_on_board == false
          puts "That word is an invalid play. Create a word using the tiles available."
        end
      end

      @words << word
      keep_playing = @board.put_on_board(word, direction, tile_num)
      #true, was able to put the word
      #false, wasn't able to put the word

      if keep_playing
        @board.draw_board
        return word
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
