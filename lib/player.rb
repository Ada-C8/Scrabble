module Scrabble
  class Player
    attr_reader :name, :plays

    def initialize(name)
      raise ArgumentError.new("Name must be a string") if !name.is_a? String
      @name = name
      @plays = []
    end

    def play(word)
      if won?
        return false #Returns false if player has already won
      else
        @plays << word #Adds the input word to the plays Array
        return Scrabble::Scoring.score(word) #Returns the score of the word
      end
    end

    def total_score
      return 0 if @plays == []
      @plays.map{ |word| Scoring.score(word)}.reduce(:+)
    end

    def highest_word
      Scoring.highest_score_from(@plays)
    end

    def highest_score
      Scoring.score(highest_word)
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
  end#of_Player_class
end#of_Scrabble_module
