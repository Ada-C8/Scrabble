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

    #WRite tests to handle inappropriate input (and the code)
  end

  describe "self.highest_score_from(array_of_words)" do

    it "Scoring responds to self.highest_score_from" do
      Scrabble::Scoring.must_respond_to :highest_score_from
    end

    it "returns correct highest score word from array of 2 words" do

    end

    it "returns correct highest score word from array of 5 words" do

    end

    it "in case of a tie where words are same length, returns 1st word entry" do
      
    end

    it "returns smallest word in case of a tie (where words are under 7 letters)" do

    end

    it "returns 7 letter word in case of tie involving a 7 letter word" do

    end

  end

end
