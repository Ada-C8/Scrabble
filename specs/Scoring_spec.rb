require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
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
  end
end
