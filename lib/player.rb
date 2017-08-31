module Scrabble
  class Player

    attr_reader :name, :plays, :total

    def initialize(input_name)
      @name = input_name
      @plays = []
      @total = 0
    end

    def play(input_word)
      total_score
       if won? == true
         return false
       end
      score = Scrabble::Scoring.score(input_word)
      @plays << input_word
      return score
    end

    def total_score
      return 0 if @plays.length == 0
      scores = @plays.map{ |word| Scrabble::Scoring.score(word) }
      @total = scores.inject(:+)
    end

    def highest_scoring_word
    end

    private
    def won?
      @total > 99 ? true : false
    end

  end # => end of class
end # => end of module
