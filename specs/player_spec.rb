require_relative 'spec_helper'

describe "Player" do
  describe "#initialize" do
    it "must take name as a parameter" do
      Scrabble::Player.new(name)
    end
    it "must raise an Argument Error if name is not a string" do
      proc { Scrabble::Player.new(12*56) }.must_raise ArgumentError
    end
  end
  describe "#name" do
    it "returns @name" do
      Scrabble::Player.new("Gale").name.must_equal "Gale"
      Scrabble::Player.new("Stef").name.must_equal "Stef"
    end
  end
  describe "#play(word)" do
    it "raises an argument error if word is not a string" do
      player1 = Scrabble::Player.new("player1")
      proc { player1.play(123) }.must_raise ArgumentError
    end
    it "raises an argument error if word is more than 7 characters" do
      player1 = Scrabble::Player.new("player1")
      proc { player1.play("tooolonng")}.must_raise ArgumentError
    end
    it "adds the input word to plays array" do
      player1 = Scrabble::Player.new("player1")
      player1.play("Gale").must_equal ["Gale"]
    end
    it "returns false if player has already won" do #total_score had to be called in order for it to incrememnt anything!
      player1 = Scrabble::Player.new("player1")
      2.times do
        player1.play("zzzzz")
      end
      player1.play("word").must_equal false
    end
    it "returns the score of input word" do

    end
  end
  describe "#plays" do
    it "returns an array of words played" do

    end
  end
  describe "#total_score" do
    it "returns the sum of played words' scores" do

    end
  end
  # describe "won" do
  #   it "returns true if player has >= 100 points" do
  #
  #   end
  #   it "returns false if the player has < 100 points" do
  #
  #   end
  # end
  describe "highest_scoring_word" do
    it "returns the highest scoring played word" do

    end
  end
  describe "highest_word_score" do
    it "returns the highest_scoring_word score" do

    end
  end
end
