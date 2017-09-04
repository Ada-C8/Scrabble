require_relative 'spec_helper'

describe "Player" do
  before "Player Instance" do
    @player_test = Scrabble::Player.new("PlayerName")
  end

  describe "#name" do
    it "returns the value of the @name instance variable" do
      @player_test.name.must_equal "PlayerName"
    end

    it "ensures name is a string" do
      proc { Scrabble::Player.new(["name", 2, :test]) }.must_raise ArgumentError
    end
  end#of_"#name"

  describe "#plays" do
    it "returns an Array of the words played by the player" do
      @player_test.plays.class.must_equal Array
    end
  end#of_"#plays"

  describe "#play(word)" do
    it "adds the input word to the plays Array" do
      player1 = Scrabble::Player.new("Ada")
      player1.play("cat")
      player1.plays.must_include "cat"
    end

    it "returns the score of the word" do
      word = "apple"
      expected_output = 9
      @player_test.play(word).must_equal(expected_output)
    end

  end#of_"#play(word)"

  it "#total_score: Returns the sum of scores of played words" do
    player1 = Scrabble::Player.new("Ada")
    plays = ["apple", "kiwi", "tomato"]
    plays.each do |word|
      player1.play(word)
    end
    player1.total_score.must_equal 28
  end

  describe "#won?" do
    it "returns true if the player has over 100 points, otherwise returns false" do
      @player_test.play("animals")
      @player_test.play("animals")
      @player_test.play("animals") #total_score = 177
      @player_test.won?.must_equal(true)
    end

    it "returns false if the player has less than 100 points" do
      @player_test.play("apple")
      @player_test.play("banana")
      @player_test.play("kiwi")
      @player_test.won?.must_equal(false)
    end
  end#_of_"#won?"

  it "#highest_scoring_word: returns the word with the highest score" do
    player1 = Scrabble::Player.new("Ada")
    plays = ["apple", "kiwi", "quizzed"]
    plays.each do |word|
      player1.play(word)
    end
    player1.highest_scoring_word.must_equal "quizzed"
  end

  it "#highest_word_score: returns the score of the highest scored word" do
    player1 = Scrabble::Player.new("Ada")
    plays = ["apple", "kiwi", "quizzed"]
    plays.each do |word|
      player1.play(word)
    end
    player1.highest_word_score.must_equal 85
  end

  describe "#tiles" do
    it "returns a collection of letters that the player can play (max 7)" do
      @player_test.tiles.must_be_kind_of Array
    end
  end#of_"#tiles"

  describe "#draw_tiles(tile_bag)" do
    it "fills tiles array until it has 7 letters from the given tile bag" do
      tile_bag_test = Scrabble::TileBag.new
      @player_test.draw_tiles(tile_bag_test).length.must_equal 7

    end
  end#of_"#tiles"

end#of_"Player"
