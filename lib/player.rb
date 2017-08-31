## Don't forget to commit
require_relative 'scoring'
module Scrabble

class Player
  attr_accessor :name

  def initialize(name)
    @name  = name
    @plays = []
  end

  def plays
    return @plays
  end

  def play(word)
    @plays << word
    total_score = 0
    @plays.each do |played_word|
      total_score += Scoring.score(played_word)
    end
    if won?(total_score)
      false
    else
      return total_score
    end
  end

  def highest_scoring_word
    Scoring.highest_score_from(@plays)
  end

  def highest_word_score
    Scoring.score(highest_scoring_word)
  end

  private

  def won?
    if total_score < 100
      return @won = false
    else
      return @won = true
    end
  end


end # end of the class
end

######TESTING######
# bob = Player.new("bob")
# puts bob.play("cats")
# puts
# puts bob.plays
# puts
# puts bob.play("dots")
# puts
# print bob.plays
# puts
# puts bob.play("books")
# puts
# print bob.plays
# puts bob.play("trouble")
# puts
# print bob.plays
# puts
# puts bob.highest_scoring_word
