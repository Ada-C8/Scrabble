require_relative 'spec_helper'

describe "PlayerClass" do
  it "initiates an instance of player" do
  player = Scrabble::Player.new("jan")
  player.must_be_instance_of Scrabble::Player
end
end
