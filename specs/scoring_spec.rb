require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scoring.rb'
require_relative 'spec_helper'
require 'pry'

describe "Scoring Class" do
  describe "initialize scoring class" do
    it "ScoringClass.new is an instance of scrabble module" do
      #arrange
      scoring = Scrabble::ScoringClass.new
      #act
      #assert
      scoring.must_be_instance_of Scrabble::ScoringClass
    end

    describe "self.score method" do
      it "A single letter in the alphabet returns the correct score" do
        Scrabble::ScoringClass.score("a").must_equal 1
        Scrabble::ScoringClass.score("d").must_equal 2
        Scrabble::ScoringClass.score("b").must_equal 3
        Scrabble::ScoringClass.score("f").must_equal 4
        Scrabble::ScoringClass.score("k").must_equal 5
        Scrabble::ScoringClass.score("j").must_equal 8
        Scrabble::ScoringClass.score("q").must_equal 10
      end
      it "Returns the score for a word" do
        Scrabble::ScoringClass.score("agmvJqk").must_equal 33
      end
    end
  end
  #arrange
  #act
  #assert
end
