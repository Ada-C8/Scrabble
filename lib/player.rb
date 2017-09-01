module Scrabble
  class Player

    attr_reader :name, :plays, :tiles

    def initialize(name)
      @name = name
      @plays = []
      @tiles = []
    end

    def play(word)
      if won?
        return false
      else
        plays << word
        Scoring.score(word)
      end
    end

    # total_score: Returns the sum of scores of played words
    def total_score
      plays.inject(0) { |sum, word| sum + Scoring.score(word) }
    end

    # highest_scoring_word: Returns the highest scoring played word
    def highest_scoring_word
      Scoring.highest_score_from(plays)
    end

    # highest_word_score: Returns the highest_scoring_word score
    def highest_word_score
      Scoring.score(highest_scoring_word)
    end

    # WAVE 3
    # tiles a collection of letters that the player can play (max 7)

    # draw_tiles(tile_bag) fills tiles array until it has 7 letters from the given tile bag
    #     - It is not in the primary requirements to modify the existing #play(word) to use #tiles or check against the player's tiles
    def draw_tiles(tile_bag)
      until tiles.length == 7
        tiles.concat(tile_bag.draw_tiles(1)) #because draw_tiles returns an array

      end
    end

    private
    # won?: If the player has over 100 points, returns true, otherwise returns false
    # This should be a private method
    def won?
      total_score > 100 ? true : false
    end

  end
end
