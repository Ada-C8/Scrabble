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

    it "Letter" do

    end
  end
end
