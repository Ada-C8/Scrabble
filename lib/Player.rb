require_relative 'Scoring'
require_relative 'TileBag'
require_relative 'Dictionary'

module Scrabble
  class Player
    attr_reader :name, :plays, :total_score, :highest_scoring_word, :highest_word_score, :tiles

    def initialize(name)
      @name = name
      @plays = []
      @total_score = 0
      @tiles = []
      @max_tiles = 7
    end

    def play(word)
      return false if won?
      letters = word.split("")
      check_errors(word, letters)
      @total_score += Scoring.score(word)
      @plays << word
      @highest_scoring_word = Scoring.highest_score_from(@plays)
      @highest_word_score = Scoring.score(@highest_scoring_word)
      letters.each do |letter|
        @tiles.delete_at(@tiles.index(letter))
      end
      return Scoring.score(word)
    end

    def draw_tiles(tilebag)
      num = @max_tiles - @tiles.length
      @tiles.concat(tilebag.draw_tiles(num))
    end

    private

    def won?
      return @total_score >= 100
    end

    def check_errors(word, letters_array)
      raise ArgumentError.new("All words must be between 1 and 7 letters long.") if (word.length > 7 || word.length == 0)
      raise ArgumentError.new("All input must be letters between a & z.") if /^[A-Z]{1,7}$/i.match?(word) == false
      raise ArgumentError if Scrabble::Dictionary.valid?(word) == false
      letters_array.each do |letter|
        raise ArgumentError if @tiles.count(letter) < letters_array.count(letter)
      end
    end

  end
end
