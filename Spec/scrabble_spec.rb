require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'


require_relative '../Lib/scrabble.rb'


describe "Scrabble" do

  describe "Scoring class" do
    describe "initialize" do
      it "Can be created" do
        instance = Scrabble::Scoring.new
        instance.must_be_kind_of Scrabble::Scoring
      end
    end
  end

  describe "Scored method" do
    it "has value for all letters" do
      ("A".."Z").each do |letter|
        instance = Scrabble::Scoring.new(letter)
        instance.score.wont_equal 0
      end
    end

    it "Can add the letters from a word" do
      word = "apples"
      Scrabble::Scoring.scored(word).must_equal 10
      #instance.score.must_equal 10
    end

    it "adds 50 to any word with 7 letters" do
      word = "bananas"
      Scrabble::Scoring.scored(word).must_equal 59
    end
    #
  end

  #
  describe "self.highest_score_from(array_of_words)" do
    #returns word with highest score
    # instance = Scrabble::Scoring.new
    it "returns word with highest score if there are no ties" do
      array = ["wizard", "dog", "xray", "artery"]
      (Scrabble::Scoring.highest_score_from(array)).must_equal "wizard"
      (Scrabble::Scoring.highest_score_from(array.reverse)).must_equal "wizard"
    end

    #it can break ties
    it " If there is a tie and the tied words are the same length, pick the first one in the supplied list." do
      array = ["zap", "zip"]
      (Scrabble::Scoring.highest_score_from(array)).must_equal "zap"
      (Scrabble::Scoring.highest_score_from(array.reverse)).must_equal "zip"
    end

    it "If there is a tie and the words are different lengths (but not 7 letters), it returns the shortest word" do
      array = ["barn", "cat", "zags", "zip"]
      (Scrabble::Scoring.highest_score_from(array)).must_equal "zip"
      (Scrabble::Scoring.highest_score_from(array.reverse)).must_equal "zip"
    end
  end

  it "If there is a tie and the words are different lengths, and at least one word is is  7 letters long, it returns first 7 letter word" do
    array = ["jqqqqq", "aeiouag"]
    (Scrabble::Scoring.highest_score_from(array)).must_equal "aeiouag"
    (Scrabble::Scoring.highest_score_from(array.reverse)).must_equal "aeiouag"
  end

  it "If there is a tie and both the words are 7 letters long it returns first 7 letter word" do
    array = ["aeiouag", "aeiouga"]
    (Scrabble::Scoring.highest_score_from(array)).must_equal "aeiouag"
    (Scrabble::Scoring.highest_score_from(array.reverse)).must_equal "aeiouga"
  end

# end
end #end module
