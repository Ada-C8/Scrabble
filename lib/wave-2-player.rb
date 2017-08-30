require_relative 'wave-1-scoring'

module Scrabble
  class Player
    attr_reader :name, :plays

    def initialize(name)
      @name = name
      @plays = []
      @word_score_arr = []
    end

    def play(word)
      raise ArgumentError.new "input must be a String" if word.class != String
      return false if won? == true
      @plays << word
      word_score = Scrabble::Scoring.score(word)
      @word_score_arr << word_score
      return word_score
    end

    def total_score
      @word_score_arr.inject(0, :+)
    end

    def won?
      total_score > 100 ? true : false
    end

    def highest_scoring_word
      if @plays.empty?
        return "none, because #{@name} did not play any words"
      else
        Scrabble::Scoring.highest_score_from(@plays)
        ### this is beautiful and it also works #####
        # words_hash = Hash[@plays.zip(@word_score_arr)]
        # words_hash.key(words_hash.values.max)
        # words_hash.max_by{|word,score| score}[0]
      end
    end

    def highest_word_score
      Scrabble::Scoring.score(highest_scoring_word)
    end
  end  #end of Player class
end  #end of Scrabble module
