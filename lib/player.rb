module Scrabble
  class Player
    attr_reader :name, :plays
    def initialize(name)
      @name = name
      @plays = []
    end


    def play(word)
      if won?
        return false
      else
        @plays << word
        return Scrabble::Scoring.score(word)
		end
    end


    def total_score
        total_so_far = 0
        @plays.each do |i|
            total_so_far += Scrabble::Scoring.score(i)
          end
        return total_so_far
    end


    def won?
       total_score > 100 ? true : false
    end



    def highest_scoring_word
      current_highest_word = ""
      @plays.each do |j|
        if Scrabble::Scoring.score(j) > Scrabble::Scoring.score(current_highest_word)
          current_highest_word = j
        end
      end
      return current_highest_word
    end


    def highest_word_score
      return Scrabble::Scoring.score(highest_scoring_word)
    end
	
    #private :won?
	#I think there might be a bug in wave-2-game.rb or in the spec.
	#The spec says won? should be a private method.
	#If won? is made private then line 54 in wave-2-game.rb shouldn't 
	#work because the method is private. I'm not sure if I'm missing
	#something, but this doesn't seem possible.
  end
end
