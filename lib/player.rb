module Scrabble
  class Player
    attr_reader :name, :plays
    def initialize(name)
      @name = name
      @plays = []
    end#initialize

    def play(word)
      if won?
        return false
      else
        @plays << word.upcase
        return Scrabble::Scoring.score(word)
      end
    end #play word end

    def total_score
    end #total score end

    def won?
      false
    end #won end

    def highest_scoring_word
    end

    def highest_word_score
    end

  end # class

end # module
