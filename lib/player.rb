module Scrabble
  class Player
    def initialize(name)
      @name = name
      @plays = []
    end


    def play(word)
      if won?
        return false
      else
        @plays << word
        return Scrabble::Score.score(word)
    end


    def total_score
        total_so_far = 0
        @plays.each do |i|
            total_so_far += Scrabble::Score.score(i)
          end
        return total_so_far
    end


    def won?
       total_score > 100 ? true:false
    end



    def highest_scoring_word
      current_highest_word = ""
      @plays.each do |j|
        if Scrabble::Score.score(j) > Scrabble::Score.score(current_highest_word)
          current_highest_word = j
        end
      end
      return current_highest_word
    end


    def highest_word_score
      return Scrabble::Score.score(highest_scoring_word)
    end

    private :won?

  end

end
