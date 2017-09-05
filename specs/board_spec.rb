require_relative 'spec_helper'

describe "Board class" do

  describe "initialize" do
    before do
      @board = Scrabble::Board.new
    end

    it "Creates a new board as an array of arrays" do
      @board.must_be_instance_of Scrabble::Board

      @board.board.must_be_kind_of Array
      @board.board[0].must_be_kind_of Array
    end

    it "creates a board of dimensions BOARD_SIZE (15)" do
      height = @board.board.length
      width = @board.board[0].length

      height.must_equal Scrabble::BOARD_SIZE
      width.must_equal Scrabble::BOARD_SIZE
    end

  end
end
