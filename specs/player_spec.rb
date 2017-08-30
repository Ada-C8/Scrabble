require_relative './spec_helper'
require_relative '../lib/player'

describe "#Scrabble::Player" do
  before do
  @carlisle = Scrabble::Player.new("Carlisle")
  @carlisle.play("schmuck")
  @carlisle.play("granny")
  end

  it "Can initialize with a name" do
    @carlisle.must_be_instance_of Scrabble::Player
  end

  xit "Can show a player's #@name" do
    @carlisle.name.must_equal 'Carlisle'
  end

  xit "Can accept guesses from input and store them" do
    @carlisle.plays.must_be_instance_of Array
    @carlisle.plays.must_equal ["schmuck"]
  end

  xit "#total_score returns the summation of the elements in a scores_array" do
    @carlisle.scores_array.must_be_instance_of Array

    score_sum = score("granny") + score("schmuck")
    @carlisle.total_score.must_equal score_sum
  end

end
