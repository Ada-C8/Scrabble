require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'


require_relative '../Lib/scrabble.rb'


describe "Scrabble" do
  describe "Scoring class" do
    it "Can be created"
    instance = Scrabble::Score.new
    instance.must_be_a_kind_of Scrabble::Score
  end

  it "the .point_per_letter can be called" do
    instance = Scrabble::Score.new
    instance.must_be_a_kind_of Hash
  end

  it "Contains 27 key/value pairs" do
    instance = Scrabble::Score.new
    instance.point_per_letter.length.must_equal 27
  end



end
