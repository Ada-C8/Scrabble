module Scrabble
  class Player
    # name: returns the value of the @name instance variable
    # plays: returns an Array of the words played by the player
    # tiles: a collection of letters that the player can play (max 7)

    attr_reader :name, :plays

    def initialize(name)
      @name = name.to_s
      @plays = []
    end

    def play(word)
      if won?
        return false
      end
      @plays << word
      Scoring.score(word)
      # Returns false if player has already won
    end

    def total_score
      total = 0
      @plays.each do |word|
        total += Scoring.score(word)
      end
      total
      # total_score: Returns the sum of scores of played words
    end

    def highest_scoring_word
      Scoring.highest_score_from(@plays)
    end

    def highest_word_score
      Scoring.score(highest_scoring_word)
    end

    #draw_tiles(tile_bag) fills tiles array until it has 7 letters from the given tile bag

    private

    def won?
      total_score > 100
    end
  end # end of Player class
end # end of Scrabble module
