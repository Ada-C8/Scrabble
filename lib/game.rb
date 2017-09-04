require_relative 'dictionary'
require_relative 'tile_bag'
require_relative 'player'
require_relative 'scoring'
require_relative 'board'

module Scrabble

  class Game
    attr_reader :board, :tile_bag, :dictionary, :players

    def initialize
      @board = Scrabble::Board.new
      @tile_bag = Scrabble::TileBag.new
      @dictionary = Scrabble::Dictionary.new
      @players = Array.new #array of players

    end

    def start
      puts "Welcome to Scrabble!"

      print "How many players will be playing? "
      num_players = gets.chomp
      while num_players.to_i < 2  #if we could mock, we would test edge cases and novelties
        puts "Please enter a number of players (2+)"
        num_players = gets.chomp
      end

      num_players.to_i.times do |i| #if we could mock, we would test results of @players
        print "What is Player ##{i+1}'s name? "
        name = gets.chomp
        @players << Scrabble::Player.new(name)
      end

      @players.each do |player| #first tiles drawn during setup, could mock, would check they have tiles
        player.draw_tiles(@tile_bag)
      end

      # draw board
      @board.draw

      #executive decision: @players[0] begins play
    end

    def play
      # while not game over, loop through players, show them tiles, ask for word and where to play, play word

      while !game_over?
        @players.each do |player|
          player.draw_tiles(@tile_bag)
          show_tiles(player)
          takes_turn(player)
        end
      end
    end

    def show_tiles(player)
      tiles = player.tiles.join(" ")
      puts "#{player.name}, these are your tiles!: #{tiles}"
    end

    def takes_turn(player)
      # get a word or pass

      puts "Play a word? y/n"
      answer = y_or_n

      if answer == 'n'
        puts "Passing your turn to next player"
        return
      else
        puts "What word do you want to play?"
        word = gets.chomp

        # check if a valid word
        while !@dictionary.is_word?(word)
          puts "Not a valid word. Do you want to play another word?"
          answer = y_or_n
          if answer == y
            puts "What word do you want to play?"
            word = gets.chomp
          else
            puts "Passing your turn to next player"
            return
          end
        end

        player.play(word)
      end

    end

    def y_or_n
      answer = gets.chomp.downcase
      while answer != "y" && answer != "n"
        puts "Y or N"
        answer = gets.chomp.downcase
      end

      return answer
    end

    def location
      puts "Which row do you want to play your first tile? (1 for top row, #{Scrabble::BOARD_SIZE} for bottom row):"
      row = gets.chomp.to_i

      while row < 1
        puts "Choose a row from 1 to #{Scrabble::BOARD_SIZE}:"
        row = gets.chomp.to_i
      end

      puts "Which column do you want to play your first tile? (1 for left-most column, #{Scrabble::BOARD_SIZE} for right-most row):"
      col = gets.chomp.to_i

      while col < 1
        puts "Choose a column from 1 to #{Scrabble::BOARD_SIZE}:"
        col = gets.chomp.to_i
      end

      #TODO : Check if there's a letter to play off of in an ideal Scrabblicious world

      puts "Would you like to play across or down? (A or D)?:"
      dir = gets.chomp.upcase

      while dir != "A" && dir != "D"
        puts "Please pick a valid direction (A or D): "
        dir = gets.chomp.upcase
      end

      # subtract 1 from user row/col to get idx
      if dir == "A"
        check_space(word,col - 1)
      else
        check_space(word,row - 1)
      end

      # TODO Check whatever letters exist there- Scrabblicious land again

    end

    def check_space(word,index)
      if word.length + index > Scrabble::BOARD_SIZE
        #pick another spot...
      end
    end
    private

    def game_over?
      @players.each do |player|
        if player.total_score > 100
          return true
        end
      end

      return false

      # TODO if both players pass

    end

  end #end of Game class

  #Game Play
  #
  # new_game = Game.new
  # new_game.start
  # new_game.play

end # end of module
