module Scrabble
  class Player
    attr_reader :name, :player_words, :total_score, :tiles_in_hand
    def initialize(name)
      @name = name
      @player_words = []
      @total_score = 0
      @tiles_in_hand = []
    end

    def plays
      return @player_words
    end #plays

    def play(word)
      @player_words << word.upcase
      result = Scrabble::Scoring.score(word)
      @total_score += result
      if won?
        return false
      else
        return result # Score of the word
      end
    end #play

    def highest_scoring_word
      # This returns the highest scoring word from the array
      Scrabble::Scoring.highest_score_from_array(@player_words)
    end #def highest_score_word(word_array)

    def highest_word_score
      # Returns the highest scoring total as an integer
      Scrabble::Scoring.score(highest_scoring_word)
    end

    def won?
      if @total_score > 100
        return true
      else
        return false
      end
    end # DEF

    def draw_tiles(tile_bag)
      num_to_draw = 7 - @tiles_in_hand.length
      tiles_to_add = tile_bag.draw_tiles(num_to_draw)
      tiles_to_add.each do |tile|
        @tiles_in_hand << tile
      end
    end #def draw_tiles(tile_bag)

  end # Player
end # Scrabble
