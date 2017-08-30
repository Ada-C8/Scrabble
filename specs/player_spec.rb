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
  it "returns an empty array if no words have been played" do
    play = Scrabble::Player.new("jan")
    play.plays.must_equal []
    play.plays.count.must_equal 0
    play.plays.must_be_instance_of Array
  end

  it "add word to plays array" do
    player = Scrabble::Player.new("Jan")
    player.play("sensitive")
    player.plays.must_equal ["sensitive"]
  end

  it "returns the score of the word played" do
    player = Scrabble::Player.new("Jan")
    player.play("cat").must_equal 5
  end


end
