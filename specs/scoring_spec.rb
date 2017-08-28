require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scoring'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe "scoring" do

  before do
    @score = Scrabble::Scoring.new
  end

  describe "initialize" do
    it "must be able to initilize @score_chart as a hash" do
      @score.score_chart.must_be_kind_of Hash
    end #it "must be able to initilize @score_chart as a hash"

    it "@score_chart must include A-Z" do
      ("A".."Z").each do |letter|
        @score.score_chart.keys.must_include letter
      end #.each
    end #it "@score_chart must include ("A".."z")" do
  end #describe "initialize" do

  describe "self.score(word)" do
    it "must be a class method" do
      Scrabble::Scoring.must_respond_to :score
    end #it "must be a class method" do

    it "will return an integer score" do
      Scrabble::Scoring.score("hell0").must_be_kind_of Integer
    end #it "will return an integer score"

    it "will return the right score for a word" do

    end #it "will return the right score for a word" do


  end #describe "self.score(word)" do
end #describe "scoring" do
