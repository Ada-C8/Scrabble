module Scrabble
  class Player

    attr_reader :name, :plays, :total

    def initialize(input_name)
      @name = input_name
      @plays = []
      @total = 0
    end

    def play(input_word)
       if won? == true
         return false
      end
      score = Scrabble::Scoring.score(input_word)
      @plays << input_word
      return score
    end

    def total_score
      scores = @plays.map{ |word| Scrabble::Scoring.score(word) }
      @total = scores.inject(:+)
    end

    private
    def won?
      total_score
      @total >= 100 ? true : false
    end

  end # => end of class
end # => end of module
