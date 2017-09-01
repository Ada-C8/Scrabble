module Scrabble

  BOARD_SIZE = 15

  class Board

    attr_reader :board

    def initialize
      @board = []

      BOARD_SIZE.times do
        @board << Array.new(15)
      end
    end

    def draw
      # returns human readable representation of board
      rep = ""

      BOARD_SIZE.times do
        rep += "_" * BOARD_SIZE + "_" * (BOARD_SIZE + 1) + "\n"
        
      end

      return rep
    end

  end # end of board class

end # end of module

board = Scrabble::Board.new
puts board.draw
