require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scoring'

describe "#Scrabble.score" do
  it "can be initialized" do
    score1 = Scrabble::Scoring.new
    score1.must_be_instance_of Scrabble::Scoring
  end

  it "Scrabble::Scoring can respond to self.score" do
    Scrabble::Scoring.must_respond_to :score

  end



  
end
