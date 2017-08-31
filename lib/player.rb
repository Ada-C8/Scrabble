module Scrabble
  class Player
    attr_reader :name, :plays, :total, :highest_word_score, :highest_scoring_word

    def initialize(input_name)
      @name = input_name
      @plays = []
      @total = 0
      @highest_word_score = 0
      @highest_scoring_word = "marisa"
    end

    def play(input_word)
      total_score #TODO 99 vs. 101 edge case.

       if won? == true
         return false
       end
      score = Scrabble::Scoring.score(input_word)
      @plays << input_word
      total_score

      return score
    end

    def total_score
      return 0 if @plays.length == 0
      scores = @plays.map{ |word| Scrabble::Scoring.score(word) }
      @total = scores.inject(:+)

      @highest_word_score = scores.max

      @highest_scoring_word = @plays.max_by do |word|
        Scrabble::Scoring.score(word)
      end

      return @total

    end

    def highest_scoring_word

    end

    private
    def won?
      @total > 99 ? true : false
    end

  end # => end of class
end # => end of module
