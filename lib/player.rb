require 'pry'
module Scrabble
  class Player
    attr_reader :name, :plays, :total_score

    def initialize(name)
      @name = name
      @total_score = 0
      @plays = []
      @tiles = []
      raise ArgumentError.new("name must be a string") if (@name.class != String || @name.empty?)
    end

    def play(word)
      return false if won?

      word.chars.each do |char|
        unless @tiles.include?(char)
          raise ArgumentError.new ("Error: Play the tiles you have")
        end
      end

      @plays << word
      @total_score += Scrabble::Scoring.score(word)

      word.chars.each do |char|
        to_delete = @tiles.index(char)
        @tiles.delete_at(to_delete)

      end
    end

    def highest_scoring_word
      return Scoring.highest_score_from(@plays)
    end

    def highest_word_score
      return Scoring.score(highest_scoring_word)
    end
    #
    def tiles
      @tiles
    end

    def draw_tiles(tilebag)
      until @tiles.length == 7
        @tiles << tilebag.draw_tiles(1)
      end
      return @tiles
    end

    private
    def won?
      return (total_score > 100) 
    end

  end
end
