require 'minitest/autorun'
require_relative 'scoring'

describe "ScoringClass" do
  describe 'initiate scoring class' do
    it "creates an instance of scoring" do
      score = Scrabble::Scoring.new
      score.must_be_instance_of Scrabble::Scoring
    end
  describe "score method" do
    it 'returns total score for word' do
      score = Scrabble::Scoring.score("cats")
      score.must_equal 5
    end

  end

  end
end
