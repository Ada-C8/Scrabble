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

    it "has value for all letters" do
      ("A".."Z").each do |letter|
        instance = Scrabble::Scoring.new(letter)
        instance.score.wont_equal 0
      end
    end

    # it "Contains 26 key/value pairs" do
    #   instance = Scrabble::Scoring.new
    #   instance.point_per_letter.length.must_equal 27
    # end

  end

end
