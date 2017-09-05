require_relative 'spec_helper'

describe "Board class" do
  it 'initializes with a size that returns an array of arrays' do
    board1 = Scrabble::Board.new
    board1.board.must_be_kind_of Array
    board1.board.each do |row|
      row.must_be_kind_of Array
    end
  end

  it 'size of the arrays is 16' do
    board1 = Scrabble::Board.new
    board1.board.length.must_equal 16
    board1.board.each do |row|
      row.length.must_equal 16
    end
  end

  it 'the first array is filled with the numbers 0 - 16' do
    board1 = Scrabble::Board.new
    board1.board[0].must_equal ("0"..."16").to_a
  end

  it 'the first spot (0 index) of inner_arrays 2-15(incices 1-16) has a letter' do
    board1 = Scrabble::Board.new
    letters = ("A".."O").to_a
    i = 0
    15.times do
      board1.board[i+1][0].must_equal letters[i]
      i += 1
    end
  end
  it 'initilizes with all the other elements being nil' do
    board1 = Scrabble::Board.new
    board1.board.shift
    board1.board.each do |row|
      i = 1
      15.times do
        row[i].must_be_nil
        i += 1
      end
    end
  end

  it 'iniitializes with a Hash that correlates the letters to the index of the outer array' do
    Scrabble::Board::BOARD_HASH["A"].must_equal 1
    Scrabble::Board::BOARD_HASH["O"].must_equal 15
  end

  it 'has an attribute that returns the current state of the board when called' do
    board1 = Scrabble::Board.new
    board1.board.must_be_kind_of Array
    board1.board.each do |row|
      row.must_be_kind_of Array
    end
  end
end

describe "#play_letter" do
  it 'changes the value of the correct location in the array of arrays to the letter' do
    board1 = Scrabble::Board.new
    board1.play_letter("W", 1, 1)
    board1.board[1][1].must_equal "W"
  end
  it 'does not modify the array if the value is not nil' do
    board1 = Scrabble::Board.new
    board1.play_letter("W", 1, 1)
    board1.play_letter("Q", 1, 1)
    board1.board[1][1].must_equal "W"
  end
  it 'returns the letter that was played' do
    board1 = Scrabble::Board.new
    board1.play_letter("W", 1, 1).must_equal "W"
  end
  it 'returns false if the letter that is supposed to be played is different from the letter that is in the location' do
    board1 = Scrabble::Board.new
    board1.play_letter("W", 1, 1)
    board1.play_letter("Q", 1, 1).must_equal false
  end
  it 'returns true if the letter has already been played in that location' do
    board1 = Scrabble::Board.new
    board1.play_letter("W", 1, 1)
    board1.play_letter("W", 1, 1).must_equal true
  end
end

describe "play_word(word, location, direction)" do
  it "accepts words in lower_case or upper_case" do
    board1 = Scrabble::Board.new
    board1.play_word("hello", "C", 5, "across").must_equal ["H", "E", "L", "L", "O"]
    board1.play_word("HELLO", "E", 7, "down").must_equal ["H", "E", "L", "L", "O"]
  end
  it 'returns only the letters that could be played on the board' do
    board1 = Scrabble::Board.new
    board1.play_word("eating", "C", 3, "across")
    board1.play_word("salmon", "E", 5, "across")
    board1.play_word("tasty", "C", 5, "down").must_equal ["A", "T", "Y"]
  end
  it 'returns all the letters of the word if all the letters could be played on the board' do
    board1 = Scrabble::Board.new
    board1.play_word("eating", "C", 3, "across").must_equal ["E", "A", "T", "I", "N", "G"]
  end
  it 'returns false if the word cannot be played on the board because of letter interference' do
    board1 = Scrabble::Board.new
    board1.play_word("hello", "C", 5, "across")
    board1.play_word("HELLO", "C", 6, "down").must_equal false
    board1.play_word("okay", "C", 7, "across")
  end
end

describe "check_if_possible(word)" do
  it "accepts a word in lower_case or upper_case" do
      board1 = Scrabble::Board.new
      board1.check_if_possible("hello", "C", 5, "across").must_equal ["H", "E", "L", "L", "O"]
      board1.check_if_possible("HELLO", "C", 5, "down").must_equal ["H", "E", "L", "L", "O"]
  end
  it "returns false if the word cannot be played on the board" do
    board1 = Scrabble::Board.new
    board1.play_word("hello", "C", 5, "across")
    board1.check_if_possible("HELLO", "C", 6, "down").must_equal false
    board1.check_if_possible("okay", "C", 7, "across")
  end
  it 'returns all the letters of the word if there is no overlap on the board' do
    board1 = Scrabble::Board.new
    board1.check_if_possible("WATER", "A", 1, "across").must_equal ["W", "A", "T", "E", "R"]

    board1 = Scrabble::Board.new
    board1.check_if_possible("WATER", "A", 1, "down").must_equal ["W", "A", "T", "E", "R"]
  end

  it 'returns only the letters needed if some letters of the word overlap on the board' do
    board1 = Scrabble::Board.new
    board1.play_word("eating", "C", 3, "across")
    board1.play_word("salmon", "E", 5, "across")
    board1.check_if_possible("tasty", "C", 5, "down").must_equal ["A", "T", "Y"]
  end

  it "returns false if the word doesn't fit on the board" do
    board1 = Scrabble::Board.new
    # board1.check_if_possible("hi", "A", 16, "across").must_equal false
    board1.check_if_possible("bye", "N", 10, "down").must_equal false
  end
end
