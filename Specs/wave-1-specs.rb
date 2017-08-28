require_relative '../lib/Scoring'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require 'pry'

describe "Scoring" do

  describe "initialize" do
    it "will initialize with appropriate scores" do
      score = Scrabble::Scoring.new
      score.must_be_instance_of Scrabble::Scoring
    end
  end

  describe "self.score" do
    before do
      new_word = Scrabble::Scoring.new
    end
    it "can be called on Scoring" do
      Scrabble::Scoring.must_respond_to :score
    end

    it "accounts for any capitalization" do
      Scrabble::Scoring.score("CAT").must_equal Scrabble::Scoring.score("cAt")
    end

    it "returns the correct score for the input" do
      Scrabble::Scoring.score("cat").must_equal 5
    end

    it "returns the correct score for 7-letter words" do
      Scrabble::Scoring.score("lizards").must_equal (17 + 50)
    end

    it "returns score of zero if input is an empty string" do
      Scrabble::Scoring.score("").must_equal 0
    end
  end

end
