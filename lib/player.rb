require_relative 'scoring'
module Scrabble
  class Player
    attr_reader :name, :plays, :total_score
    def initialize(name)
      @name = name
      @plays = []
      @total_score = 0
      #@winning_word = ""
      # @highest_scoring_word = Scoring.highest_score_from(@plays)
      # @highest_word_score = Scoring.score(@highest_scoring_word)
    end

    def play(word)
      @plays << word.upcase
      @total_score += Scoring.score(word)
      if won?
        return false
      else
        return Scoring.score(word)
      end
    end

    def highest_scoring_word
      #sends player's array to highest_score_from and gets back the highest scoring word
      best_word = Scoring.highest_score_from(@plays)
      return best_word

      # @winning_word = Scoring.highest_score_from(@plays)
      # return @winning_word
    end

    def highest_word_score#(winning_word)
      # sends player's array to highest_score_from and gets back highest scoring word, then sends it to the score method to be scored.

      highest_score = Scoring.score(highest_scoring_word)
      return highest_score

      # @winning_word = Scoring.highest_score_from(@plays)
      # puts "This is the word for winning word: #{@winning_word}"
      # puts "This is the class for winning word: #{@winning_word.class}"
      # return Scoring.score(@winning_word)
    end

    private

    def won?
      @total_score > 100 ? true : false
    end

  end
end
