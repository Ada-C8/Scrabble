require_relative 'spec_helper'
require 'colorize'

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

    it "Initializes the tile numbers in the 2D array" do
      (1..225).each do |num|
        @board.board_grid.flatten.include?(num).must_equal true
      end
    end
  end

  describe "put_on_board" do
    it "Can put a word vertically on the board" do
      word = "apple"
      @board.put_on_board(word, "vertical", 32)
      word.each_char do |char|
        @board.board_grid.flatten.include?(char.colorize(:light_white)).must_equal true
      end
    end

    it "Can put a word horizontally on the board" do
      word = "bagel"
      @board.put_on_board(word, "horizontal", 100)
      word.each_char do |char|
        @board.board_grid.flatten.include?(char.colorize(:light_white)).must_equal true
      end
    end

    it "Can put words on the corners of the board" do
      word1 = "couple"
      @board.put_on_board(word1, "horizontal", 1).must_equal true
      word2 = "ant"
      @board.put_on_board(word2, "vertical", 15).must_equal true
      word3 = "cork"
      @board.put_on_board(word3, "horizontal", 211).must_equal true
      word4 = "bump"
      @board.put_on_board(word4, "vertical", 180).must_equal true
    end

    it "Can put a word on the board if it collides with a word it has a shared letter with" do
      initial_word = "berry"
      new_word = "boat"
      @board.put_on_board(initial_word, "vertical", 1)
      @board.put_on_board(new_word, "horizontal", 1).must_equal true
    end

    it "Does not put words on the board if it collides with another word that doesn't have shared letters" do
      initial_word = "berry"
      @board.put_on_board(initial_word, "vertical", 1)
      new_word = "cat"
      @board.put_on_board(new_word, "vertical", 1).must_equal false
      initial_word = "bump"
      @board.put_on_board(initial_word, "vertical", 3)
      new_word = "ben"
      @board.put_on_board(new_word, "horizontal", 17).must_equal false
    end

    it "Doesn't let you put a word if you give an invalid direction" do
      word = "muffin"
      @board.put_on_board(word, "diagonal", 4).must_equal false
    end

    it "Doesn't let you put a word in a non-existing tile/not between 1 - 225" do
      word = "pie"
      @board.put_on_board(word, "vertical", 226).must_equal false
    end

    it "Doesn't let you put in non-String objects" do
      not_word = 1123
      @board.put_on_board(not_word, "vertical", 141).must_equal false
    end

    it "Doesn't let you put in Strings with special characters" do
      not_word = "huh??"
      @board.put_on_board(not_word, "vertical", 141).must_equal false
    end

    it "Doesn't let you put a word if the word goes past the board" do
      word = "fluff"
      @board.put_on_board(word, "vertical", 225).must_equal false
      word = "bun"
      @board.put_on_board(word, "horizontal", 15).must_equal false
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
