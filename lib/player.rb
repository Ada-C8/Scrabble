## Don't forget to commit

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


end # end of the class
