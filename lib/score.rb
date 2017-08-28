# require_relative 'wave-1-game'
module Scrabble
  class Score
    attr_reader :words
    def initialize
      @words = []
    end
  end
end
