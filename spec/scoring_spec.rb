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
    it "should check the value of 1-6 tiles" do
     Scrabble::Scoring.score("A").must_equal 1
     Scrabble::Scoring.score("ME").must_equal 4
     Scrabble::Scoring.score("COT").must_equal 5
     Scrabble::Scoring.score("BING").must_equal 7
     Scrabble::Scoring.score("hurry").must_equal 11
     Scrabble::Scoring.score("zinger").must_equal 16
    end

    it "should accept lower and upper case tiles" do
    Scrabble::Scoring.score("CAT").must_equal 5
    Scrabble::Scoring.score("cat").must_equal 5
    Scrabble::Scoring.score("CaT").must_equal 5
    end

   it "should add 50 bonus points to 7 letter word" do
     Scrabble::Scoring.score("quizzed").must_equal 85
   end

   it "should return score of 0 if invalid tiles are found in the word" do
     Scrabble::Scoring.score("A**").must_equal 0
     Scrabble::Scoring.score("A123").must_equal 0
     Scrabble::Scoring.score("123").must_equal 0
     Scrabble::Scoring.score("#%%#").must_equal 0
   end

   it "should not allow spaces in between tiles in the word" do
     Scrabble::Scoring.score("c a t").must_equal 0
   end

   it "should return zero if empty string is passed" do
     Scrabble::Scoring.score("").must_equal 0
     Scrabble::Scoring.score(" ").must_equal 0
   end

   it "should return zero if nil is passed in" do
     Scrabble::Scoring.score(nil).must_equal 0
   end

   it "should return zero if more than 7 letters are passed in" do
     Scrabble::Scoring.score("leathery").must_equal 0
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
     Scrabble::Scoring.highest_score_from(["cat", "sliders", "bread", "rank"]).must_equal "sliders"

      Scrabble::Scoring.highest_score_from(["cat", "fiddlers", "bread", "sliders", "rank"]).must_equal "sliders"
   end

   it "should return the first word in the array if the score and length are the same" do
     Scrabble::Scoring.highest_score_from(["sank", "cat", "eggs", "tank", "rank"]).must_equal "sank"
   end

   it "should return the first word in the array if the score and length are the same" do
     Scrabble::Scoring.highest_score_from(["cat", "eggs", "tank", "rank"]).must_equal "tank"
   end

   it "should not return the 8 letter word as the highest score" do
     Scrabble::Scoring.highest_score_from(["cat", "fiddlers", "bread", "rank"]).must_equal "rank"
   end
 end

end #end of scoring describe
