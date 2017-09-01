require_relative '../lib/tilebag'

module Scrabble
  class Player
    attr_reader :name, :plays, :tiles
    def initialize(name)
      @name = name
      @plays = []
      @score_array = []
      @tiles = []
    end#initialize

    def play(word)
      if won?
        false
      else
        @plays << word.upcase
        #word = word.upcase
        #word.split("").each do |letter|
        #   @tiles.slice!(@tiles.index(letter))
        #end
        word_score = Scrabble::Scoring.score(word)
        @score_array << word_score
        return word_score
      end
    end #play word end

    def total_score
      return @score_array.inject(0){|sum, x| sum + x}
    end #total score end

    def won?
      if total_score > 100
        return true
      else
        return false
      end
    end #won end

    def highest_scoring_word_score
      if @score_array  == []
        raise ArgumentError.new("No words to compare")
      else
        index = @score_array.index(@score_array.max)
        max_word = @plays[index]
        max_score = @score_array.max
        return max_word, max_score
      end
    end


    def draw_tiles(tile_bag)
      # tile_bag.draw_tiles(amount_of_tiles_i_want)
      if @tiles.length < 7
        tiles_drawn = tile_bag.draw_tiles(7 - @tiles.length)
        tiles_drawn.each do |letter|
          @tiles << letter
        end
      end
      return @tiles
    end





    # private :won?

  end # class

end # module
