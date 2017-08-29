require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scrabble'

describe "Scoring" do
  # Placeholder maybe create test for module presence
  describe "Score Chart" do

    it "Letteer chart is a constant, empty hash" do
      Scrabble::Scoring::SCORE_CHART.must_be_instance_of Hash
    end

    it "verify value is assigned to respective array of letters" do
      #Test first key/value pair
      Scrabble::Scoring::SCORE_CHART[1].must_equal ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"]

      #Test last key/value pair
      Scrabble::Scoring::SCORE_CHART[10].must_equal ["Q", "Z"]
    end
    # think about he below test to see if it is necessary
    # it "Raise arguement error is key does not exist." do
    #   proc{Scrabble::Scoring::SCORE_CHART[11]}.must_raise ArgumentError
    # end
  end

  describe "initialize" do

    it "Instantiate Scoring class" do
      Scrabble::Scoring.new.must_be_instance_of Scrabble::Scoring
    end
  end

  describe "self.score method" do

    it "Can be called" do
      test_class = Scrabble::Scoring
      test_class.must_respond_to :score
    end

    it "Raises an ArgumentError if input is not a String" do
      proc { Scrabble::Scoring.score(123)}.must_raise ArgumentError
      # test_class = Scrabble::Scoring.score("word")
      # test_class.must_be_instance_of String
      # test_class.must_equal "WORD"
    end

    it "Returns the total score for the given word" do
      test_class = Scrabble::Scoring.score("word")
      test_score = 4 + 1 + 1 + 2
      test_class.must_equal test_score
    end

    it "Returns a 50 point bonus when input is 7 letters" do
      test_class = Scrabble::Scoring.score("worders")
      test_score = 4 + 1 + 1 + 2 + 1 + 1 + 1 + 50
      test_class.must_equal test_score
    end
  end

  describe "highest_score_from_array method" do

    it "Can be called" do
      test_class = Scrabble::Scoring
      test_class.must_respond_to :highest_score_from_array
    end

    it "Returns the word in the array with the highest score" do

    end

  end
end

# self.highest_score_from(array_of_words): returns the word in the array with the highest score. In the case of tie, use these tiebreaking rules:
# It’s better to use fewer tiles, in the case of a tie, prefer the word with the fewest letters.
# There is a bonus for words that are seven letters. If the top score is tied between multiple words and one used all seven letters, choose the one with seven letters over the one with fewer tiles.
# If the there are multiple words that are the same score and same length, pick the first one in the supplied list.
