require_relative 'spec_helper.rb'

describe "The Scoring class" do

  before do
    @scoring = Scrabble::Scoring.new
  end

  it "Scoring is a class of the Scrabble" do
    @scoring.must_be_instance_of Scrabble::Scoring
  end

  it "Scoring is a class" do
    @scoring.class.must_be_kind_of Class
  end
end

describe "The Score method" do

  it "Responds to the method score" do
    Scrabble::Scoring.must_respond_to :score
  end

  it "must return an integer" do
    Scrabble::Scoring.score("word").must_be_kind_of Integer
  end

  it "Must not take in an integer argument" do
    proc {Scrabble::Scoring.score(2)}.must_raise ArgumentError
  end

  it "Must return a score equal or greater than 0" do
    Scrabble::Scoring.score("word").must_be :>=,0
  end

  it "must return the correct score for an input" do
    Scrabble::Scoring.score("A").must_be :==,1
    Scrabble::Scoring.score("Z").must_be :==,10
    Scrabble::Scoring.score("AZ").must_be :==,11
    Scrabble::Scoring.score("K").must_be :==,5
  end

  it "must add 50 points if a 7-letter word is passed to the score method" do
    Scrabble::Scoring.score("AAAAAAA").must_be :==,57
  end

  it "Cannot accept a string longer than 7 characters - raises an error" do
    proc {Scrabble::Scoring.score("AAAAAAAA")}.must_raise ArgumentError
  end

  it "Can accept both upper and lowercase words" do
    Scrabble::Scoring.score("a").must_be :==,1
    Scrabble::Scoring.score("z").must_be :==,10
    Scrabble::Scoring.score("aZ").must_be :==,11
    Scrabble::Scoring.score("k").must_be :==,5
  end
end

describe "The highest_score_from method" do
  it "Responds to the highest score from method" do
    Scrabble::Scoring.must_respond_to :highest_score_from
  end
  it "should return the highest scoring word" do
    Scrabble::Scoring.highest_score_from(["AA","ZZ"]).must_equal "ZZ"
  end
end
