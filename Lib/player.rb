require_relative 'scrabble'

module Scrabble
  class Player

    attr_accessor :name, :plays, :total_score

    def initialize
      @name = name
      @plays =[]
      @total_score = 0
    end


    def play_game
      #1. play word
      #2. score word.  add score to total
      #3. check if won
      #4. repeat
    end

    private

    def gets_word
      puts "Play a word"
      word = gets.chomp
    end

    #play(word): Adds the input word to the plays Array
    # Returns false if player has already won
    # Returns the score of the word
    # update total_score
    def play(word)
      @plays << word
      score = Scrabble::Scoring.scored(word)
      @total_score += score
      case
      when won?
        false
      when !won?
        score
      end
    end


    #won?: If the player has over 100 points, returns true, otherwise returns false
    #this is a private method
    def won?
      @total_score >= 100
    end

    # highest_scoring_word: Returns the highest scoring played word
    def highest_scoring_word
      #call mixin high_score_array and take index 0
    end

    #highest_word_score: Returns the highest_scoring_word score
    def highest_word_score
      #call mixin high_score_array and take scored(index 0)
    end

  end
end
