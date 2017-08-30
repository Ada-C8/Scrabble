module Scrabble
  class Player
    attr_reader :name, :plays, :total_score

    def initialize(name)
      @name = name
      @plays = []
      @total_score = 0
    end

    def play(word)

      unless word.class == String
        raise ArgumentError.new("Input must be a String")
      end

      if won?
        return false
      end

      @plays << word

      player_word_score = Scrabble::Scoring.score(word)

      @total_score += player_word_score

      return player_word_score
    end

    def highest_scoring_word
      highest_scoring_word = Scrabble::Scoring.highest_score_from_array(@plays)
      return highest_scoring_word
    end

    def highest_word_score
      best_word = highest_scoring_word
      highest_word_score = Scrabble::Scoring.score(best_word)
      return highest_word_score
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
