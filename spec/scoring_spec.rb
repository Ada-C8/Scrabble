require_relative 'spec_helper'

describe "Scoring" do
   before do
    @game = Scrabble::Scoring.new
  end

  describe "initialize" do
    it "should create a new instance of Scrabble" do
     @game.must_be_instance_of Scrabble::Scoring
    end
  end

  describe "scoring" do
    it "should check the value of 1 tile" do
     Scrabble::Scoring.score("A").must_equal 1
    end

    it "should check the value of 2 tiles" do
     Scrabble::Scoring.score("WE").must_equal 5
    end

    it "should add 50 bonus points to 7 letter word" do
     Scrabble::Scoring.score("quizzed").must_equal 85
    end
  end

  describe "highest_score_from(array_of_words)" do
    it "should return word with highest score" do
      Scrabble::Scoring.highest_score_from(["cat", "eggs", "bread", "oats"]).must_equal "bread"
    end
    it "should return the word fewer tiles and high score" do
      Scrabble::Scoring.highest_score_from(["cat", "eggs", "bread", "rank"]).must_equal "rank"
    end
    it "should return the 7 letter word as the highest score" do
      Scrabble::Scoring.highest_score_from(["cat", "slanders", "bread", "rank"]).must_equal "slanders"
    end
    it "should return the first word in the array if the score and length are the same" do
      Scrabble::Scoring.highest_score_from(["sank", "cat", "eggs", "tank", "rank"]).must_equal "sank"
    end
    it "should return the first word in the array if the score and length are the same" do
      Scrabble::Scoring.highest_score_from(["cat", "eggs", "tank", "rank"]).must_equal "tank"
    end
  end
end #end of scoring describe
