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

      while !game_over
        @players.each do |player|
          show_tiles(player)

        end
      end
    end

    private

    def game_over?
      @players.each do |player|
        if player.total_score > 100
          return true
        end
      end

    # TODO if both players pass

    end

    def show_tiles(player)
      tiles = player.tiles.join(" ")
      puts "These are your tiles: #{tiles}"
    end

    def takes_turn(player)
      # get a word or pass
      puts "Play a word? y/n"

      answer = gets.chomp.downcase!
      while answer != "y" || answer != "n"
        puts "Y or N"
        answer = gets.chomp.downcase!
      end

      if answer == 'n'
        puts "Passing your turn to next player"
        break
      else
        puts "What word do you want to play?"
        word = gets.chomp

        # check if a valid word
        while !@dictionary.is_word?(word)
          puts "Not a valid word. "
          # need to put pass and word into separate methods so that player can pass if put in not valid word
        end
      end

    end



  end #end of Game class

  #Game Play
  #
  new_game = Game.new
  new_game.start






end # end of module
