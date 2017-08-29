require_relative 'spec_helper'

describe 'Scoring' do
  before do
    @scrabble = Scrabble::Scoring
  end

  describe 'initialize' do
    it "has a Constant variable that is a Hash" do
      @scrabble::POINTS.must_be_kind_of Hash
    end

    it "can retrieve point value from POINTS hash" do
      @scrabble::POINTS["A"].must_equal 1
      @scrabble::POINTS["B"].must_equal 3
      @scrabble::POINTS["Z"].must_equal 10
      @scrabble::POINTS["K"].must_equal 5
    end

  end # 'initialize'

  describe 'self.score' do

    it "takes a word as an argument" do
      @scrabble.must_respond_to :score
    end

    it "calculates the score of the word passed in" do
      @scrabble.score("bird").must_equal 7
    end

    it "adds 50 points for a 7-letter word" do
      @scrabble.score("jazzily").must_equal 85
    end

    it "raise ArgumentError if passed anything but a string" do
      proc{@scrabble.score(nil)}.must_raise ArgumentError
      proc{@scrabble.score(true)}.must_raise ArgumentError
      proc{@scrabble.score(4.0)}.must_raise ArgumentError
    end

  end # 'self.score'

  describe 'self.highest_score_from' do

    it "returns a word from the given array" do
      words = ["cat","bird","jazzily"]
      @scrabble.highest_score_from(words).must_be_kind_of String
    end

    it "finds highest score of these word" do
      words = ["cat","bird","jazzily"]
      @scrabble.highest_score_from(words).must_equal "jazzily"
    end

    it "returns shortest word in case of a tie" do
      words = ["jar","XD"]
      @scrabble.highest_score_from(words).must_equal "XD"
    end

    it "it returns 7-letter word rather than short word" do
      words = ["aeadaea","zzzzzj"]
      @scrabble.highest_score_from(words).must_equal "aeadaea"
    end

    it "returns first word in event of an absolute tie" do
      words = ["jazzily","ylizzaj"]
      @scrabble.highest_score_from(words).must_equal "jazzily"
    end


  end # 'self.highest_score_from'

end # end of Scoring
