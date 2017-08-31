require_relative 'scrabble'

module Scrabble
  class Player
    attr_reader :name, :plays, :won

    def initialize(name)
      @name = name
      @plays = []
      @won = false
      @total_score = 0
    end

    def play(word)
      if @won
        return false
      end

      plays << word
      total_score
      return Scrabble::Scoring.score(word) # new instance of score
    end

    def total_score
      sum_of_scores = []
      @plays.each do |word|
        sum_of_scores << Scrabble::Scoring.score(word)
      end
      @total_score = sum_of_scores.inject(:+)
      #puts "Your score is #{@total_score}"
      won?
      return @total_score
    end

    def highest_word_score #returns score
      num_hash = {}
      @plays.each do |word|
        num_hash[word] = Scrabble::Scoring.score(word)
      end

      return num_hash.values.max
    end

    def highest_scoring_word #returns word
      return Scrabble::Scoring.highest_score_from(@plays)
    end

    private

    def won?
      if @total_score > 99
        @won = true
        # puts "You win!"
      end
    end

  end # end of class
end #end of module

# patty = Scrabble::Player.new("Patty")
# patty.play("october")
# patty.play("happiness")
# patty.play("xyz")
# patty.play("happiness")
# # patty.play("xyz")
# # patty.total_score
