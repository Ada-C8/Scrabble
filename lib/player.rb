## Don't forget to commit
require_relative 'scoring'

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
    if total_score >= 100
      false
    else 
      return total_score
    end
  end

  def highest_scoring_word
    Scoring.highest_score_from(@plays)
  end


end # end of the class

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
