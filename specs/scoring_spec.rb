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
  end

end #describe end
