require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/Player'

describe "Scrabble::Player class " do
  describe "initialize" do
    it "requires one argument, name" do
      proc {Scrabble::Player.new}.must_raise ArgumentError
    end

    it "sets the name equal to the argument passed to it " do
      input = "Ada"
      player = Scrabble::Player.new(input)

      player.name.must_equal input
    end
  end

  describe "plays" do
    it "returns an array" do
      Scrabble::Player.new("Ada").plays.must_be_instance_of Array
      Scrabble::Player.new("Ada").plays.must_equal []
    end
  end

  describe "play(word)" do
    it "adds the input word to the plays array" do
      player = Scrabble::Player.new("Ada")
      word = "hello"
      player.play(word)

      player.plays.must_include word
    end

    it "returns false if the game is over" do

    end

    it "returns the score of the word if not won" do

    end
  end

  describe "won?" do
    it "returns true if player has at least 100 points" do

    end

    it "returns false if player has less than 100 points" do

    end

  end

  describe "total_score" do
    it "returns the sum of all played words" do
      player = Scrabble::Player.new("Ada")
      words = ["apple", "hello", "zoo", "ufo"]
      words.each do |word|
        player.play(word)
      end

      player.total_score.must_be_instance_of Integer

      player.total_score.must_equal 35

    end

    it "initializes with value of 0" do

    end

    it "updates after every valid play" do

    end

    it "does not update after the game has been won " do

    end

  end
end
