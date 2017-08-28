require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require 'lib/scoring.rb'
# require_relative '../lib/restaurant_bill'

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
