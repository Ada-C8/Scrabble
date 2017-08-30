require_relative 'spec_helper'

describe "PlayerClass" do
  it "initiates an instance of player" do
  player = Scrabble::Player.new("jan")
  player.must_be_instance_of Scrabble::Player
  end

  it "can access the player's name" do
    player = Scrabble::Player.new("jan")
    player.name.must_equal "jan"
  end
end
describe "Plays" do
  it "returns the word that was played" do
    play = Scrabble::Player.new("jan")
    play.plays.must_equal []
  end

end
