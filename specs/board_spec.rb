require_relative 'spec_helper'

describe "Board" do
  before do
    @board = Scrabble::Board.new
  end

  describe "initialize" do
    it "Initializes a class Board object" do
      @board.must_be_instance_of Scrabble::Board
    end

    it "Initializes a 2D array that serves as the board" do
      @board.board_grid.must_be_instance_of Array
      row_col_size = @board.board_grid.length
      row_col_size.must_equal 15
      @board.board_grid[rand(15)].must_be_instance_of Array
    end
  end

  describe "draw_board" do
    it "Draws a board" do
      output = capture_io { @board.draw_board } #"captures" what gets printed by a puts statement
      output[0].include?("+-----" * 15 + "+\n").must_equal true
    end

    it "Prints values of the current board state" do
      @board.put_on_board("paw", "vertical", 143)
      output = capture_io { @board.draw_board }
      output[0].include?("p").must_equal true

      @board.put_on_board("zeitgeist", "horizontal", 1)
      output = capture_io { @board.draw_board }
      output[0].include?("z").must_equal true
    end
  end

end
