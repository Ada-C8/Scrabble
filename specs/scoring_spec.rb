require 'simplecov'
SimpleCov.start
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

  it "Throws an argument error when given invalid output" do
    proc {Scrabble::Scoring.score("1")}.must_raise ArgumentError

    proc {Scrabble::Scoring.score(1)}.must_raise ArgumentError

    proc {Scrabble::Scoring.score("")}.must_raise ArgumentError

    proc {Scrabble::Scoring.score()}.must_raise ArgumentError

  end

 it "can handle multiple letters" do
   Scrabble::Scoring.score("ogmfkj").must_equal 23
 end

 it "can add 50 point bonus to seven letter word" do
   Scrabble::Scoring.score("ogmfkjz").must_equal 83
 end
describe "Testing highest_score_from" do
  it "returns an array of scores" do
    Scrabble::Scoring.highest_score_from_array(["cat", "doge"]).must_be_instance_of String

    Scrabble::Scoring.highest_score_from_array(["cat", "doge"]).must_equal 'doge'
  end

   it "prioritizes word with seven letters as winner" do
     Scrabble::Scoring.highest_score_from_array(["qqqzzx", "aeiouad"]).must_equal 'aeiouad'
     Scrabble::Scoring.highest_score_from_array(["cat", "doge", "qqqzzx", "aeiouad", "qkz", "kin"]).must_equal 'aeiouad'
   end

   it "breaks ties between long and short words with same value" do
     Scrabble::Scoring.highest_score_from_array(["qaz", "zokk"]).must_equal 'qaz'
     Scrabble::Scoring.highest_score_from_array(["kin", "qaz", "zokk", "cat", "doge"]).must_equal 'qaz'
   end



end


end
