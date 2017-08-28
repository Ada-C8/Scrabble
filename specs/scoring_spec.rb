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

  it "can recognize a letter's value and add it to the score" do
    Scrabble::Scoring.score("A").must_equal 1
    Scrabble::Scoring.score("t").must_equal 1
    Scrabble::Scoring.score("Q").must_equal 10
    Scrabble::Scoring.score("z").must_equal 10

  end
 it "can handle multiple letters" do
   Scrabble::Scoring.score("ogmfkj").must_equal 23
 end
 it "can add 50 point bonus to seven letter word" do
   Scrabble::Scoring.score("ogmfkjz").must_equal 83
 end
describe "Testing highest_score_from" do
  it "returns an array of scores" do
    Scrabble::Scoring.highest_score_from(["cat", "doge"]).must_be_instance_of Array

  end
end


end
