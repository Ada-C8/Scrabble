require_relative 'scrabble'
require 'pry'
module Scrabble
  class Player

    attr_accessor :name, :plays, :total_score

    def initialize(name = "Pipes")
      @name = name
      @plays =[] #words played
      @total_score = 0 #will add all instances of Scoring class which are also each word in plays
    end


    def play_game
      #1. play word
      #2. score word.  add score to total
      #3. check if won
      #4. repeat
    end



    def gets_word
      word = ""
      begin
      puts "Play a word"
      word = gets.chomp
    rescue !word.match(/^[A-Za-z]+$/)
        puts "Only letters, please.  Try again."
        retry
      end
      word
    end

    #play(word): Adds the input word to the plays Array
    # Returns false if player has already won
    # Returns the score of the word
    # update total_score

    def play(word)
      @plays << word
      word_score = Scrabble::Scoring.scored(word)
      @total_score += word_score
      case
      when won?
        true
      when !won?
        word_score
      end
    end


    # highest_scoring_word: Returns the highest scoring played word
    def highest_scoring_word
      Scrabble::Scoring.highest_score_from(@plays)
      #call mixin high_score_array and take index 0
    end

    #highest_word_score: Returns the highest_scoring_word score
    def highest_word_score
      Scrabble::Scoring.scored(highest_scoring_word)
      #call mixin high_score_array and take scored(index 0)
    end

    private
    #won?: If the player has over 100 points, returns true, otherwise returns false
    #this is a private method
    def won?
      @total_score >= 100
    end

  end
end
