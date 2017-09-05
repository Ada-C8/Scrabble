module Scrabble

  BOARD_SIZE = 15

  class Board

    attr_reader :board

    def initialize
      @board = []

      BOARD_SIZE.times do
        @board << ([" "] * BOARD_SIZE)
      end
    end

    def draw
      # returns human readable representation of board
      display = ""

      line = "_" * (4 * BOARD_SIZE+ 1) + "\n"

      @board.each do |row|# going through rows
        display += line
        row.each do |char|# going through cols
          display += "| " + char + " "
        end
        display += "|\n"
      end
      display += line

      return display
    end

  end # end of board class

end # end of module
