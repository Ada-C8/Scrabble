require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scrabble.rb'

describe "Scoring class" do
  describe "initialize" do
    it "Creates an instance" do
      Scrabble::Scoring.new.must_be_kind_of Scrabble::Scoring
    end
  end

  describe "Self.Score" do
    it "tests a letter returns a number" do
      Scrabble::Scoring.score("x").must_equal 8
      Scrabble::Scoring.score("aeioulnrst").must_equal 10
    end

  end

  describe "Self.highest_score_from" do
    it "Exists" do
      word_list = ['One', 'Two', 'Three']
      Scrabble::Scoring.highest_score_from(word_list).must_be_instance_of Array
    end
  end
end
