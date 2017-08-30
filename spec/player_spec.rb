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

  describe "play method" do
    it "returns an array of word played by the player" do


    end
  end

end #end of describe
