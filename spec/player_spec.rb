require_relative '../lib/player'
require_relative 'spec_helper'

describe "class Player"  do

  before do
    @player = Player.new
  end

  describe "instance of Player class" do
    it "creates an instance of Player" do
      @player.must_be_instance_of Player
    end

    # it "returns the value of the instance variable" do
    #   player_1 = Player.

    # end
  end



  
end #end of describe