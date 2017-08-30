require_relative './spec_helper'
require_relative '../lib/player'

describe "#Scrabble::Player" do
  before do
    @carlisle = Scrabble::Player.new("Carlisle")
    @carlisle.play("schmuck")
    @carlisle.play("granny")
  end

  describe "initialize" do
    it "Can initialize with a name" do
      @carlisle.must_be_instance_of Scrabble::Player
    end

    it "Can show a player's #@name" do
      @carlisle.name.must_equal 'Carlisle'
    end

    it "Can accept guesses from input and store them" do
      @carlisle.plays.must_be_instance_of Array
      @carlisle.plays.must_equal ["schmuck", "granny"]
    end
  end

  describe "#total_score" do
    it "#total_score returns the summation of the elements in a word_score" do
      @carlisle.word_score.must_be_instance_of Array

      score_sum = Scrabble::Scoring.score("granny") + Scrabble::Scoring.score("schmuck")
      @carlisle.total_score.must_equal score_sum
    end
  end
  describe "#play" do

    it "If a player has not yet won, #play must return the score of the most recently played word" do
      @carlisle.play("cat").must_equal 5
    end

    it "Returns false if a player attempts to #play another word after scoring 100 points" do
      @carlislejr = Scrabble::Player.new("Carlisle, Jr.")
      @carlislejr.play("QQQQQQQ")

      @carlislejr.play("hi").must_equal false
    end
  end
end
