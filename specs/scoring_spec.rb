require_relative 'spec_helper'

describe "Scoring" do
  describe "self#score" do

    it 'check to see if word passed in self.score is a string' do
      word = 100004

      proc { Scrabble::Scoring.score(word) }.must_raise ArgumentError
    end

    it "returns an integer for a letter tile" do
      Scrabble::Scoring.score("z").class.must_equal Integer
    end

    it "returns the correct value for a letter tile" do
      Scrabble::Scoring.score("z").must_equal 10
    end

    it "returns the correct value for a word" do
      Scrabble::Scoring.score("cat").must_equal 5
    end

    it "a seven-tile word returns a 50 point bonus" do
      Scrabble::Scoring.score("animals").must_equal 59

    end
  end#_of_self#score

  describe "self#highest_score_from(array_of_words)" do
    it "returns a string in the array" do
      Scrabble::Scoring.highest_score_from(["apple"]).class.must_equal String
    end

    it "ensures that the input is an array" do
      proc { Scrabble::Scoring.highest_score_from(12) }.must_raise ArgumentError
    end

    it "ensures elements in the inputted array are strings" do
      array_of_words = [ "apple", "banana", 12, "tomato"]
      proc { Scrabble::Scoring.highest_score_from(array_of_words) }.must_raise ArgumentError
    end

    it "returns the word in the array with the highest score" do
      array_of_words = [ "apple", "kiwi", "tomato"]
      Scrabble::Scoring.highest_score_from(array_of_words).must_equal "kiwi"
    end




  end#of_self#highest_score_from

end
