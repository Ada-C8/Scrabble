require_relative 'scrabble'

module Scrabble
  class Game
    attr_reader :tilebag

    def initialize
      @tilebag = TileBag.new
      @player1 = Player.new("name", @tilebag)
    end

  end
end
