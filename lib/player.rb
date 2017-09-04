module Scrabble
  class Player
    attr_reader :name, :plays, :tiles

    def initialize(name)
      raise ArgumentError.new("Name must be a string") if !name.is_a? String
      @name = name
      @plays = []
      @tiles = []
    end

    def play(word)
      if won?
        return false #Returns false if player has already won
      else
        @plays << word #Adds the input word to the plays Array
        return Scoring.score(word) #Returns the score of the word
      end
    end

    def total_score
      return 0 if @plays == []
      @plays.map{ |word| Scoring.score(word)}.reduce(:+)
    end

    def highest_scoring_word
      Scoring.highest_score_from(@plays)#returns highest scoring word
    end

    def highest_word_score
      Scoring.score(highest_scoring_word)#returns score of highest scoring word
    end
#
# private
#
    def won?
      if total_score > 100
        return true
      else
        return false
      end
    end

    def draw_tiles(tile_bag)
      if @tiles.length < 7
        #use tile_bag's draw_tiles method; for number argument use available spaces
        new_tiles_drawn = tile_bag.draw_tiles(7 - @tiles.length)
        @tiles.concat(new_tiles_drawn)
      end
    end

  end#of_Player_class
end#of_Scrabble_module
