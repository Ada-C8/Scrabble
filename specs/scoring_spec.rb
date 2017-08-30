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
      Scrabble::Scoring.highest_score_from(["animals"]).class.must_equal Array
    end




  end#of_self#highest_score_from

end
