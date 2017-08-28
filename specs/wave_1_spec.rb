require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require 'minitest/pride'
require_relative '../lib/scrabble'

describe 'Scrabble' do
  describe 'Scoring' do

    it "Scoring.new is a new instance of the Scoring class" do
      game1 = Scrabble::Scoring.new
      game1.must_be_instance_of Scrabble::Scoring

    end
  end

end #describe scoring
