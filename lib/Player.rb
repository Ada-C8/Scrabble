require_relative 'Scoring'

module Scrabble
  class Player
    attr_reader :name, :plays, :total_score, :highest_scoring_word, :highest_word_score, :tiles

    def initialize(name)
      @name = name
      @plays = []
      @total_score = 0
      @tiles = []
    end

    def play(word)
      #TODO: remove tiles from @tiles when word is played
      return false if won?
      letters = word.split("")
      letters.each do |letter|
        raise ArgumentError if @tiles.count(letter) < letters.count(letter)
      end

      letters.each do |letter|
        @tiles.delete_at(@tiles.index(letter))
      end 

      @total_score += Scoring.score(word)
      @plays << word
      @highest_scoring_word = Scoring.highest_score_from(@plays)
      @highest_word_score = Scoring.score(@highest_scoring_word)
      return Scoring.score(word)
    end

    def draw_tiles(tilebag)
      num = 7 - @tiles.length
      @tiles.concat(tilebag.draw_tiles(num))
    end

    def won?
      return @total_score >= 100
    end

  end
end
