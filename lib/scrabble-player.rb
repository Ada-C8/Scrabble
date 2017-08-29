require_relative "scrabble-scoring"

module Scrabble
  class Player
    attr_reader :name, :plays

    def initialize(name)
      @name = name
      @plays = []
      @hand = []
    end

    def tiles
      pretty_string = ""
      @hand.each do |letter|
        pretty_string << "#{letter} "
      end
      return pretty_string
    end

    def draw_tiles(tile_bag)
      @hand.concat(tile_bag.draw_tiles(7-@hand.length))
    end

    def play(word)
      if won?
        return false
      else
        @plays << word
        return Scrabble::Scoring.score(word)
      end
    end


    def total_score
      total = 0
      plays.each do |word|
        total += Scrabble::Scoring.score(word)
      end
      return total
    end

    def highest_scoring_word
      return Scrabble::Scoring.highest_score_from_array(@plays)
    end

    def highest_word_score
      return Scrabble::Scoring.score(highest_scoring_word)
    end


    # private

    def won?
      if total_score > 100
        return true
      else
        return false
      end
    end

  end
end
