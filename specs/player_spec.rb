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
  end

  describe "#plays" do
    it "returns an Array of the words played by the player" do
      @player_test.plays.class.must_equal Array
    end
  end

  describe "#play(word)" do
    it "adds the input word to the play array" do
      @player_test.play("word")
      word_array = @player_test.plays
      word_array.include?("WORD").must_equal(true)
    end

    it "returns the score of the word" do
      word = "apple" #9
      expected_output = 9
      @player_test.play(word).must_equal(expected_output)
    end

    it "returns false if player has already won" do

    end

  end
end#of_"Player"
