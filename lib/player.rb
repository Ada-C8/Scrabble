require_relative '../lib/tilebag'

module Scrabble
  class Player
    attr_reader :name, :plays, :tiles
    def initialize(name, debug = false)
      @name = name
      @plays = []
      @score_array = []
      @tiles = []
      @debug = debug
    end#initialize

    def play(word)
      if won?
        false
      else
        @plays << word.upcase
        delete_tiles_from_tiles_array(word)
        word_score = Scrabble::Scoring.score(word)
        @score_array << word_score
        return word_score
      end
    end #play word end

    def delete_tiles_from_tiles_array(word)
      word = word.upcase
      word.split("").each do |letter|
        if @tiles.include?(letter)
          @tiles.slice!(@tiles.index(letter))
        else
          raise ArgumentError.new("You cannot play this word.")
        end
      end
    end

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

    def draw_tiles(tile_bag, test_array = [])
      # tile_bag.draw_tiles(amount_of_tiles_i_want)
      if @debug
        @tiles = test_array
        return @tiles
      else
        if @tiles.length < 7
          tiles_drawn = tile_bag.draw_tiles(7 - @tiles.length)
          tiles_drawn.each do |letter|
            @tiles << letter
          end
        end
        return @tiles
      end
      # return @tiles
    end






    #We comment this out for now to make sure our won? method pass the test.
    # private :won?

  end # class

end # module
