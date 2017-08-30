module Scrabble
  class Player
    attr_reader :name, :plays, :total_score

    def initialize(name)
      @name = name
      @plays = []
      @total_score = 0
    end

    def play(word)

      if won?
        return false
      end

      @plays << word

      player_word_score = Scrabble::Scoring.score(word)

      @total_score += player_word_score

      return player_word_score
    end

    private

    def won?
      if @total_score > 100
        return true
      end
      return false
    end
  end#Player

end#Scrabble
