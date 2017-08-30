require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'
require_relative '../lib/scoring'

describe "Scoring" do
   before do
    @game = Scoring.new
  end

  describe "initialize" do
    it "should create a new instance of Scrabble" do
     @game.must_be_instance_of Scoring
    end
  end

  describe "scoring" do
    it "should check the value of 1 tile" do
     Scoring.score("A").must_equal 1
    end

    it "should check the value of 2 tiles" do
     Scoring.score("WE").must_equal 5
    end

    it "should add 50 bonus points to 7 letter word" do
     Scoring.score("quizzed").must_equal 85
    end
  end

  describe "highest_score_from(array_of_words)" do
    it "should return word with highest score" do
      Scoring.highest_score_from(["cat", "eggs", "bread", "oats"]).must_equal "bread"
    end
    it "should return the word fewer tiles and high score" do
      Scoring.highest_score_from(["cat", "eggs", "bread", "rank"]).must_equal "rank"
    end
    it "should return the 7 letter word as the highest score" do
      Scoring.highest_score_from(["cat", "slanders", "bread", "rank"]).must_equal "slanders"
    end
    it "should return the first word in the array if the score and length are the same" do
      Scoring.highest_score_from(["sank", "cat", "eggs", "tank", "rank"]).must_equal "sank"
    end
    it "should return the first word in the array if the score and length are the same" do
      Scoring.highest_score_from(["cat", "eggs", "tank", "rank"]).must_equal "tank"
    end
  end
end #end of scoring describe
