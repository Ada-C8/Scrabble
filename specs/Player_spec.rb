require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/Player'

describe "Scrabble::Player class " do
  before do

  end
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

    it "returns false if the game won? = true" do
      player = Scrabble::Player.new("Ada")
      words = ["quizzed", "zippers"]
      words.each_with_index do |word, index|
        player.play(word)
      end
      player.play("hello").must_equal false
    end

    it "returns the score of the word if won? = false" do
      player = Scrabble::Player.new("Ada")
      player.play("quizzed").must_equal 85
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
      player = Scrabble::Player.new("Ada")
      player.total_score.must_equal 0
    end

    it "updates after every valid play" do
      player = Scrabble::Player.new("Ada")
      words = ["apple", "hello", "zoo", "ufo"]

      words.each do |word|
        x = player.total_score
        player.play(word)
        player.total_score.must_be :>, x
      end
    end

    it "does not update after the game has been won " do
      player = Scrabble::Player.new("Ada")
      words = ["quizzed", "zippers"]
      words.each do |word|
        player.play(word)
      end
      x = player.total_score
      player.play("another")
      x.must_equal player.total_score
    end

  end

  describe "higest_scoring_word" do
    it "returns the word with the highest score" do
      player = Scrabble::Player.new("Ada")
      words = ["quizzed", "zippers"]

      words.each do |word|
        player.play(word)
      end

      player.highest_scoring_word.must_be_instance_of String

      player.highest_scoring_word.must_equal "quizzed"
    end
  end


end
