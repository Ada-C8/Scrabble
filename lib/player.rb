module Scrabble
  class Player
    attr_reader :name, :plays

    def initialize(name)
      raise ArgumentError.new("Name must be a string") if !name.is_a? String
      @name = name
      @plays = []

    end

    #plays method: returns an Array of the words played by the player
    # def plays
    #   return @plays
    # end

    def play(word)
      if won? == true
        return false #Returns false if player has already won
      else
        @plays << word.upcase #Adds the input word to the plays Array
        return Scrabble::Scoring.score(word) #Returns the score of the word
      end

    end
  end#of_Player_class
end#of_Scrabble_module
