require_relative 'spec_helper'


describe "Scoring" do
  describe "self.score" do
    it "returns the total score for the given word" do
      Scrabble::Scoring.score("hello").must_equal 8
    end

    it "awards 50 bonus points for a 7-letter word" do
      Scrabble::Scoring.score("plumped").must_equal 64
    end

    it "is case-insensitive" do
      Scrabble::Scoring.score("HELLO").must_equal 8
      Scrabble::Scoring.score("HeLlO").must_equal 8
    end

    it "raises an error if the argument is not a string" do
      proc { Scrabble::Scoring.score("*@?;!^") }.must_raise ArgumentError
      proc { Scrabble::Scoring.score(2384) }.must_raise ArgumentError
      proc { Scrabble::Scoring.score("") }.must_raise ArgumentError
      proc { Scrabble::Scoring.score("2384") }.must_raise ArgumentError
      proc { Scrabble::Scoring.score(["h", "e", "l", "l", "o"]) }.must_raise ArgumentError
    end
  end

  describe "self.highest_score_from(array_of_words)" do
    it "returns the word in the array with the highest score" do
      words = ["Cut", "Qqqqq"]
      Scrabble::Scoring.highest_score_from(words).must_be_instance_of String
      Scrabble::Scoring.highest_score_from(words).must_equal "qqqqq"
    end

    it "returns the word in the array with fewer letters in a tie" do
      words = ["kfc", "xy", "fdfd"]
      Scrabble::Scoring.highest_score_from(words).must_equal "xy"
    end

    it "returns the word in the array with 7 letters as opposed to word with fewer letters" do
      words = ["qqqqqq", "qqqqqjg"]
      Scrabble::Scoring.highest_score_from(words).must_equal "qqqqqjg"
    end

    it "returns the first word in the array when all words have the same points and length" do
      words = ["dog", "dug", "dig", "God"]
      Scrabble::Scoring.highest_score_from(words).must_equal "dog"
    end

    it "raises an error if one of the words in the array is not composed of only letters" do
      words1 = ["dog", "*@?;!^", ["b", "y", "e"], ""]
      words2 = ["*@?;!^", "apple", "!@%"]
      words3 = ["banana", "pine", nil]

      proc { Scrabble::Scoring.highest_score_from(words1) }.must_raise ArgumentError
      proc { Scrabble::Scoring.highest_score_from(words2) }.must_raise ArgumentError
      proc { Scrabble::Scoring.highest_score_from(words3) }.must_raise ArgumentError
    end

  end
end
