require_relative "scoring"

require 'pry'
module Scrabble
  class Player
    attr_reader :name, :plays

    def initialize(name)
      @name = name
      @plays = []
    end



    def play(word)
      @plays << word
    end

    def total_score
      total_score = 0
      @plays.each do |word|
      total_score += Scrabble::Scoring.score(word)
      end
      return total_score
    end

    def highest_scoring_word
      return Scrabble::Scoring.highest_score_from(@plays)
    end

    def highest_word_score
      return Scrabble::Scoring.score(highest_scoring_word)
    end

    private
    def won?
      return (total_score > 100) ? true : false
    end

  end
end

# test = Scrabble::Player.new("Ada")

# test.play("zzzzzx")
# test.play("z")
# puts test.highest_word_score
# # test.play("zzzzz")
#
# test.play("zzzzzx")
# test.play("z")
# test.play("cat")
# test.play("laurend")
# test.play("bat")
# puts test.total_score
# puts test.name
# puts test.highest_scoring_word
