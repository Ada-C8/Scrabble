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
      test_strings = ["hello", "quiz", "aardvark"]
      test_scores = []

      test_strings.each do |string|
        test_scores << Scrabble::Scoring.score(string)
      end

      test_scores.must_equal([8, 22, 16])
    end
  end
end
