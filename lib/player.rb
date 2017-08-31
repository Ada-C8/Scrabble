require_relative 'tilebag'

module Scrabble

  class Player
    @@gamebag = TileBag.new

    attr_reader :name, :plays, :tiles

    attr_writer :tiles

    def initialize(name)
      @name = name
      @plays = []
      @tiles = @@gamebag.draw_tiles(7)
    end

    def play(word)
      if @plays != [] && won?
        return false
      else
        @plays << word.upcase
        return Scoring.score(word)
      end
    end

    def draw_tiles
      num = 7 - @tiles.length
      replacement = @@gamebag.draw_tiles(num)
      replacement.each do |letter|
        @tiles << letter
      end
    end

    def total_score
      total_score = @plays.map { |word| Scoring.score(word)}.reduce(:+)
      return total_score
    end

    def highest_scoring_word
      return Scoring.highest_score_from(@plays)
    end

    def highest_word_score
      return Scoring.score(highest_scoring_word)
    end



    private

    def won?
      return total_score > 100
    end

  end
end
