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
  end

end
