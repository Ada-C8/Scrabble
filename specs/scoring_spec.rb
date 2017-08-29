require_relative 'spec_helper.rb'

describe "Scoring class" do
  describe "self.score" do
    before do
      @score = Scrabble::Scoring.score("cat")
    end

    it "Returns an integer from a string input" do
      # cat is worth 5
      @score.must_equal 5
      @score.must_be_instance_of Integer

    end

    it "Adds a 50-point bonus if it's a seven-letter word (or longer)" do
      score = Scrabble::Scoring.score("scrabble")

      score.must_equal 64
    end
  end

  describe "highest_score_from_array" do
    it "Returns the highest score from an array of words" do
      words = ["fantastically", "cat", "scrabble", "peanuts", "spy"]

      Scrabble::Scoring.highest_score_from_array(words).must_equal "FANTASTICALLY"
    end

    # xit "Breaks tie by choosing shorter word" do
    #   words = ["fantastic", "cat", "scrabble", "peanuts", "spy"]
    #
    #   Scrabble::Scoring.highest_score_from_array(words).must_equal "SCRABBLE"
    # end

    # it "Breaks tie by choosing shorter word unless one of the words is 7 chars long" do
    #   words = ["aaaaaad", "qqqqqj"]
    #
    #   Scrabble::Scoring.highest_score_from_array(words).must_equal "AAAAAAD"
    #
    # end

    it "Breaks tie by choosing shorter word unless 7-letters long; picks first 7-letter word" do
      words = ["iiiiiid", "aaaaaad", "qqqqqj"]

      Scrabble::Scoring.highest_score_from_array(words).must_equal "IIIIIID"

      words[0] = "aaaaaad"
      words[1] = "iiiiiid"
      Scrabble::Scoring.highest_score_from_array(words).wont_equal "IIIIIID"


    end
  end
end
