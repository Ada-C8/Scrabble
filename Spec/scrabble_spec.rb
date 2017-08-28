require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'


require_relative '../Lib/scrabble.rb'


describe "Scrabble" do

  describe "Scoring class" do

    it "Can be created" do
      instance = Scrabble::Scoring.new
      instance.must_be_kind_of Scrabble::Scoring
    end
  end

  describe "instance of score" do

    it "has value for all letters" do
      ("A".."Z").each do |letter|
        instance = Scrabble::Scoring.new(letter)
        instance.score.wont_equal 0
      end
    end

    it "Can add the letters from a word" do
      word = "apples"
      instance = Scrabble::Scoring.new(word)
      instance.score.must_equal 10
    end

    it "adds 50 to any word with 7 letters" do
      word = "bananas"
      instance = Scrabble::Scoring.new(word)
      instance.score.must_equal 59
    end

    describe "self.highest_score_from(array_of_words)" do
      #returns word with highest score
      it "returns word with highest score" do
        array = ["wizard", "dog", "xray", "artery"]
        (Scrabble::Scoring.highest_score_from(array)).must_equal "wizard"
      end

      #it can break ties
      it "breaks ties when the word has the same score" do
        array = ["blacks", "zip"]
        (Scrabble::Scoring.highest_score_from(array)).must_equal "zip"
      end

    end
  end
  # it "Contains 26 key/value pairs" do
  #   instance = Scrabble::Scoring.new
  #   instance.point_per_letter.length.must_equal 26
  # end

end #end module
