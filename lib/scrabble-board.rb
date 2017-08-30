module Scrabble
  class Board

    def initialize(size)
      @size = size
      @board_spaces = []
      size.times do
        @board_spaces << Array.new(size)
      end
    end


    def print_row
      print "----"*@size
      puts "-"
    end
    def print_col
      print "|   "*@size
      puts "|"
    end

    def print_board
      print_row
      @size.times do
        print_col
        print_row
      end
    end

  end


  def check_placement(word,direction)

  end

end
end
