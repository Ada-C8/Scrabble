require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require 'simplecov'
SimpleCov.start
require_relative '../lib/Scoring'

describe "Scrabble::Scoring" do
  describe "self.score" do
    it "returns an integer score" do
      input = "hello"
      Scrabble::Scoring.score(input).must_be_instance_of Integer
    end

    it "returns the correct score" do
      test_strings = ["hello", "quiz", "water"]
      test_scores = []

      test_strings.each do |string|
        test_scores << Scrabble::Scoring.score(string)
      end

      test_scores.must_equal([8, 22, 8])
    end

    it "adds a 50 point bonus to 7-letter words" do
      input = "jazzily"
      Scrabble::Scoring.score(input).must_equal 85
    end

    it "doesn't accept words greater than 7 letters long" do
      proc{Scrabble::Scoring.score("alongword")}.must_raise ArgumentError
    end

    it "doesn't accept empty strings as words" do
      proc{Scrabble::Scoring.score("")}.must_raise ArgumentError
    end
  end

  describe "self.highest_score_from method" do
    it "returns a string" do
      test_strings = ["hello", "quiz", "water"]
      highest = Scrabble::Scoring.highest_score_from(test_strings)
      highest.must_be_instance_of String

      test_strings.must_include highest
    end

    it "awards a tie to the shortest word except in the case of a seven letter word, and first word in case of 2 same-length words" do
      test_strings = ["jd", "q"]

      Scrabble::Scoring.highest_score_from(test_strings).must_equal "q"

      test_strings << "qzqzqz"
      test_strings << "aeioulf"
      test_strings << "ioulfae"

      Scrabble::Scoring.highest_score_from(test_strings).must_equal "aeioulf"
    end
  end
end
