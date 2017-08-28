require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require 'minitest/pride'
require 'pry'

require_relative 'spec_helper'

describe "Scoring class" do
  describe "initialize" do
    it "can instantiate a scoring class" do
      Scrabble::Scoring.new.must_be_kind_of Scrabble::Scoring
    end
  end
  describe "score_letter method" do
    it "can take in letters worth 1 point and return" do
      input =["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"]

      input.each do |letter|
        Scrabble::Scoring.score_letter(letter).must_equal 1
      end
    end

    it "can take letters worth 4 and return 4" do
      input =['F', 'H', 'V', 'W', 'Y']

      input.each do |letter|
        Scrabble::Scoring.score_letter(letter).must_equal 4
      end
    end
  end

  describe "score method" do
    it "takes short word and returns score" do
      Scrabble::Scoring.score("HI").must_equal 5
    end

    it "takes a 7 letter word and adds 50 points" do
      Scrabble::Scoring.score("QUIZZED").must_equal 85
    end
  end
end
