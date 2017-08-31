require_relative '../lib/player'
require_relative 'spec_helper'

describe "class Player"  do

  before do
    @player = Player.new(name)
  end

  describe "instance of Player class" do
    it "creates an instance of Player" do
      @player.must_be_instance_of Player
    end

    it "returns the value of the instance variable" do

      @player.must_respond_to :name
    end
  end

  describe "plays method" do
    it "returns an array of word played by the player" do
      @player.plays.must_be_kind_of Array
    end
  end

  describe "play method" do
    it "adds the word to the plays array" do
      @player.must_respond_to :play
    end
    it "returns false if player already won" do
      @player.play("ZZZZZZZ")
      @player.play("hi").must_equal false
    end
    it "returns the total score of played words" do
      @player.play("darts")
      @player.play("monkey")
      @player.play("food").must_equal 29
    end
  end

end #end of describe

