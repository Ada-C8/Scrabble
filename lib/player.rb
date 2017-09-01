require 'pry'
module Scrabble
  class PlayerClass
    attr_reader :name, :plays, :tiles
    #name: returns the value of the @name instance variable
    #plays: returns an Array of the words played by the player
    def initialize(name)
      @name = name
      @plays = []
      @tiles = []
    end

    def total_score
      # total_score: Returns the sum of scores of played words
      running_score = 0
      @plays.each do |word|
        running_score += Scrabble::ScoringClass.score(word)
      end
      return running_score
    end

    def draw_tiles(tile_bag)
      until @tiles.length == 7 do
          @tiles << tile_bag.draw_tiles(1)
      end
    end

    def play(word)
      legit_word?(word)
      # Returns false if player has already won
      # Returns the score of the word
      @plays << word
      won? ? (return false) : (return Scrabble::ScoringClass.score(word))
    end

    def is_alphabet?(input)
      is_string?(input) == false ? (raise ArgumentError.new("#{input} is an invalid entry - you may only enter strings")) : (return /^[a-z]+$/.match(input))
    end

    def is_string?(input)
      input.class == String
    end

    def legit_word?(player_word)
      raise ArgumentError.new("#{player_word} is an invalid entry - you may only enter letters in the the english alphabet") if is_alphabet?(player_word) == nil
    end

    def highest_scoring_word
      #highest_scoring_word: Returns the highest scoring played word
      return Scrabble::ScoringClass.highest_score_from(@plays)
    end

    def highest_word_score
      #highest_word_score: Returns the highest_scoring_word score
      # score highest scoring word
      Scrabble::ScoringClass.score(highest_scoring_word)
    end

    private

    def won?
      # won?: If the player has over 100 points, returns true, otherwise returns false
      # This should be a private method
      total_score >= 100 ? (return true) : (return false)
    end
  end
end
