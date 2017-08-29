require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scoring'

describe "Wave 1 Scoring" do
  describe "self.score(letter)" do
    it "Returns the value that corressponds to a single letter" do
      # Arrange
      letter = 'A'
      value = 1
      # Act
      points = Scrabble::Scoring.score(letter)
      # Assert
      points.must_equal value

      letter = 'B'
      value = 3
      points = Scrabble::Scoring.score(letter)
      points.must_equal value
    end
    it "Adds all of the letters in the string to calculate a total score" do
      string = "hahaha"
      expected_value = 15

      Scrabble::Scoring.score(string).must_equal expected_value
    end

    it "has a score of 0 if not a valid letter" do
      Scrabble::Scoring.score("0*&@1").must_equal 0
    end

    it "Raises an argument error for strings longer than 7 characters" do
      proc{Scrabble::Scoring.score("toolongstring")}.must_raise ArgumentError
    end

    it "Gives a score of zero if an empty string is passed in" do
      Scrabble::Scoring.score("").must_equal 0
    end

    it "Adds a 50 point bonus if the string is exactly 7 characters long" do
      Scrabble::Scoring.score("seven**").must_equal 58
    end
  end

  describe "self.highest_score_from(array_of_words)" do
    it "Raises an argument error unless passed an array" do
      proc{Scrabble::Scoring.highest_score_from("string")}.must_raise ArgumentError
    end
    it "Raises an argument error unless given at least 2 elements to compare" do
      proc{Scrabble::Scoring.highest_score_from(["one element"])}.must_raise ArgumentError
    end
    it "Raises an argument error of array elements are not strings" do
      proc{Scrabble::Scoring.highest_score_from([1, 2, 3])}.must_raise ArgumentError
    end
    it "Returns the score of the highest scoring word" do

    end
    it "Returns ths score of the seven letter word in case of a tie" do

    end
    it "Returns the score of the shortest word if 2 words have the same score" do

    end
    it "Returns the first word in a list of words with same score and length" do

    end
  end
end
