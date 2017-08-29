require_relative 'spec_helper'


describe "Scoring" do
  describe "self.score" do
    it "returns the total score for the given word" do
      Scoring.score("hello").must_equal 8
    end

    it "awards 50 bonus points for a 7-letter word" do
      Scoring.score("plumped").must_equal 64
    end

    it "is case-insensitive" do
      Scoring.score("HELLO").must_equal 8
      Scoring.score("HeLlO").must_equal 8
    end

    it "raises an error if the argument is not a string" do
      proc { Scoring.score("*@?;!^") }.must_raise ArgumentError
      proc { Scoring.score(2384) }.must_raise ArgumentError
      proc { Scoring.score("") }.must_raise ArgumentError
      proc { Scoring.score("2384") }.must_raise ArgumentError
      proc { Scoring.score(["h", "e", "l", "l", "o"]) }.must_raise ArgumentError
    end
  end
end
