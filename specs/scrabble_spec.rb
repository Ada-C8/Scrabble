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

  end # 'self.score'

end # end of Scoring
