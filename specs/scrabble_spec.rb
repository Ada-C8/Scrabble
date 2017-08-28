require_relative 'spec_helper'

describe 'Scoring' do
  describe 'initialize' do
    it "has a Constant variable that is a Hash" do
      Scrabble::Scoring::POINTS.must_be_kind_of Hash
    end

    it "can retrieve point value from POINTS hash" do
      Scrabble::Scoring::POINTS["A"].must_equal 1
      Scrabble::Scoring::POINTS["B"].must_equal 3
      Scrabble::Scoring::POINTS["Z"].must_equal 10
      Scrabble::Scoring::POINTS["K"].must_equal 5
    end

  end # 'initialize'

  describe 'self.score' do

    it "takes a word as an argument" do
      Scrabble::Scoring.must_respond_to :score
    end

    xit "returns the Array of word" do
      Scrabble::Scoring.score("cat").must_equal ["C", "A", "T"]
    end

    it "calculates the score of the word passed in" do
      Scrabble::Scoring.score("bird").must_equal 7
    end

    it "adds 50 points for a 7-letter word" do
      Scrabble::Scoring.score("jazzily").must_equal 85
    end

  end # 'self.score'

  describe 'self.highest_score_from' do

    it "returns a word from the given array" do
      words = ["cat","bird","jazzily"]
      Scrabble::Scoring.highest_score_from(words).must_be_kind_of String
    end

    it "finds highest score of these word" do
      words = ["cat","bird","jazzily"]
      Scrabble::Scoring.highest_score_from(words).must_equal "jazzily"
    end

    it "returns shortest word in case of a tie" do
      words = ["jar","XD"]
      Scrabble::Scoring.highest_score_from(words).must_equal "XD"
    end

    it "it returns 7-letter word rather than short word" do
      words = ["aeadaea","zzzzzj"]
      Scrabble::Scoring.highest_score_from(words).must_equal "aeadaea"
    end

    it "returns first word in event of an absolute tie" do
      words = ["jazzily","ylizzaj"]
      Scrabble::Scoring.highest_score_from(words).must_equal "jazzily"            
    end

  end # 'self.highest_score_from'

end # end of Scoring
