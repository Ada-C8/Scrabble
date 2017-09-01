require_relative 'spec_helper.rb'
require_relative '../lib/scrabble-player'
require_relative '../lib/scrabble-tilebag'
require_relative '../lib/scrabble-board'


describe "Scrabble::Board" do
  before do
    @user_size = 6
    @board = Scrabble::Board.new(@user_size)
  end
  it "can be initialized" do
    Scrabble::Board.new(6).must_be_instance_of Scrabble::Board
  end
  it "is the correct size" do
    @board.board_spaces.length.must_equal @user_size
    @board.board_spaces.each do |line|
      line.length.must_equal @user_size
    end
  end
  it "responds to check placement method" do
    @board.must_respond_to :check_placement
  end
  it "responds to print board" do
    @board.must_respond_to :print_board
  end
  it "throws error for the wrong start indices" do
    proc { @board.check_placement("test",[7,0],:down)}.must_raise ArgumentError
    proc { @board.check_placement("test",[2,7],:down)}.must_raise ArgumentError
    proc { @board.check_placement("test",[6,6],:down)}.must_raise ArgumentError
  end
  it "throws error for the wrong direction" do
    proc { @board.check_placement("test",[0,0],:up)}.must_raise ArgumentError
    proc { @board.check_placement("test",[1,1],:left)}.must_raise ArgumentError
    proc { @board.check_placement("test",[2,0],:random)}.must_raise ArgumentError
  end
  it "returns true if word can be played" do
    @board.check_placement("test",[0,0],:down).must_equal true
  end
  it "correctly places the word on the board" do
    word = "test"
    @board.check_placement(word,[0,0],:down)
    word.length.times do |i|
      @board.board_spaces[i][0].must_equal word[i]
    end
  end
  it "is nil where no letter has been " do
    word = "test"
    @board.check_placement(word,[0,0],:down)
    @board.board_spaces[word.length][0].must_be_nil
  end
  it "can't play a word off the board in down direction" do
    @board.check_placement("test",[4,4],:down).must_equal false
  end
  it "can't play a word off the board in right direction" do
    @board.check_placement("test",[4,4],:right).must_equal false
  end
  it "won't play word that creates other non-words" do
    @board.check_placement("test",[0,0],:down)
    @board.check_placement("dog",[0,1],:down).must_equal false
  end
  it "can't play word that intersects at non-matching letter in down direction" do
    @board.check_placement("test",[0,0],:down)
    @board.check_placement("dog",[0,0],:down).must_equal false
  end
  it "can't play word that intersects at non-matching letter in right direction" do
    @board.check_placement("dog",[0,1],:down)
    @board.check_placement("test",[1,0],:right).must_equal false
  end
  it "won't play a non-word" do
    @board.check_placement("asdfg",[0,0],:down).must_equal false
  end
  it "will play intersecting words where letters match" do
    @board.check_placement("test",[0,0],:down)
    @board.check_placement("touch",[0,0],:right).must_equal true
    @board.check_placement("hog",[0,4],:down).must_equal true
  end

end
