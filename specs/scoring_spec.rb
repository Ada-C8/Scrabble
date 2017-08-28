require 'minitest/autorun'
require 'minitest/reporters'
# require 'minitest/skipra_dsl'
require_relative '../lib/scoring.rb'


describe "Scrabble::Scoring class" do

  describe "Initialize" do
    it "Can be intialized" do
      #arrange
      Scrabble::Scoring.new.must_be_instance_of Scrabble::Scoring
      #act

      #assert

    end
  end#describe initialize

  describe "Score class method" do
    it "Retunrs 0 for an empty string" do
      Scrabble::Scoring.score("").must_equal 0
    end

    it "Returns the score for a word" do
      Scrabble::Scoring.score("CASA").must_equal 6
    end

    it "Returns the score even when lowercase word" do
      Scrabble::Scoring.score('casa').must_equal 6
    end

    it "Returns score plus 50 for a 7 letter word" do
      Scrabble::Scoring.score("LAPTOPS").must_equal 61
    end

  end#Describe Score class methos

end #describe first end
