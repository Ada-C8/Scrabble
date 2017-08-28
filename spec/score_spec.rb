
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/score'


describe "Score" do
  describe "#initialize" do
    it " should give you an empty array" do
      my_class = Scrabble::Score.new
      my_class.wont_be_empty
    end
  end
end
