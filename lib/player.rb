module Scrabble
  class Player
    attr_reader :name, :plays, :total_score, :tiles

    def initialize(name)
      @name = name
      @plays = []
      @total_score = 0
      @tiles = [] #max 7 
    end

    def play(word)

      unless word.class == String
        raise ArgumentError.new("Input must be a String")
      end

      if won?
        return false
      end

      #TO DO => check to see that the word argument is a valid word based on player's @tiles
      # word_arr = word.split("")
      #
      # word_arr.each do |letter|
      #   @tiles.include?(letter)
      # end

      @plays << word

      player_word_score = Scrabble::Scoring.score(word)

      @total_score += player_word_score

      #TO DO => How to remove tiles from players while still getting tests to pass? (in tests you don't know what @tiles will be so how to test the output of test word and remove the correct letters from @tiles?)

      #remove tiles from player's tile hand
      # word_arr = word.split("")
      # word_arr.each do |letter|
      #   @tiles.delete_at(@tiles.find_index(letter))
      # end

      return player_word_score
    end

    def highest_scoring_word
      highest_scoring_word = Scrabble::Scoring.highest_score_from(@plays)
      return highest_scoring_word
    end

    def highest_word_score
      best_word = highest_scoring_word
      highest_word_score = Scrabble::Scoring.score(best_word)
      return highest_word_score
    end

    def draw_tiles(tile_bag)#in wave_3_game passes an instance of TileBag stored in instance variable @tilebag of Game class
      tiles_needed = 7 - @tiles.length
      drawn_tiles = tile_bag.draw_tiles(tiles_needed)
      @tiles += drawn_tiles
      return @tiles
    end

    private

    def won?
      if @total_score > 100
        return true
      end
      return false
    end

  end#Player
end#Scrabble
