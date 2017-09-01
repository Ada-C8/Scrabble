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
    it "#play(word) adds the input word to the plays Array" do
      player1 = Scrabble::Player.new("Ada")
      player1.play("cat")
      player1.plays.must_include "cat"
    end

    it "returns the score of the word" do
      word = "apple"
      expected_output = 9
      @player_test.play(word).must_equal(expected_output)
    end

    it "#total_score: Returns the sum of scores of played words" do
      player1 = Scrabble::Player.new("Ada")
      plays = ["apple", "kiwi", "tomato"]
        plays.each do |word|
          player1.play(word)
        end
      player1.total_score.must_equal 28
    end

    it "#highest_word returns the word with the highest score" do
      player1 = Scrabble::Player.new("Ada")
      plays = ["apple", "kiwi", "quizzed"]
        plays.each do |word|
          player1.play(word)
        end
      player1.highest_word.must_equal "quizzed"
    end

    it "#highest_score returns the score of the highest scored word" do
      player1 = Scrabble::Player.new("Ada")
      plays = ["apple", "kiwi", "quizzed"]
        plays.each do |word|
          player1.play(word)
        end
      player1.highest_score.must_equal 85
    end

  end
end#of_"Player"
