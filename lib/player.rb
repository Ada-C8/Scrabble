require_relative 'scoring'
module Scrabble
  class Player

  attr_accessor :name, :plays
  attr_reader :total_score

    def initialize(name)
      @name = name
      @plays = []
    end

    def play(word)
      return false if won?
      plays << word
      return Scrabble::Scoring.score(word)
    end

    def total_score
      scores = []
      plays.each do |word|
        scores << Scrabble::Scoring.score(word)
      end
      sum = scores.inject(0, :+)
      return sum
    end

    def highest_word_score
      scores = []
      plays.each do |word|
        scores << Scrabble::Scoring.score(word)
      end
      return scores.max
    end

    def highest_scoring_word
      return Scrabble::Scoring.highest_scoring_word(@plays)
    end


    private

    def won?
      return total_score > 100 ? true : false
    end

  end #(class end)
end #(module)
