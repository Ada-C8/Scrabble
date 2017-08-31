module Scrabble
  class Player
    attr_reader :name, :plays, :tiles

    def initialize(name)
      @name = name.to_s
      @plays = []
      @tiles = []
    end

    def play(word)
      return false if won?
      @plays << word
      Scoring.score(word)
    end

    def total_score
      total = 0
      @plays.each do |word|
        total += Scoring.score(word)
      end
      total
    end

    def highest_scoring_word
      Scoring.highest_score_from(@plays)
    end

    def highest_word_score
      Scoring.score(highest_scoring_word)
    end

    def draw_tiles(tilebag)
      num_tiles = 7 - @tiles.length
      @tiles += tilebag.draw_tiles(num_tiles)
    end

    private

    def won?
      total_score > 100
    end
  end # end of Player class
end # end of Scrabble module
