require_relative 'spec_helper.rb'
require_relative '../lib/scrabble-player'

describe "Scrabble:Player" do

  it "Player can initialize" do
    Scrabble::Player.new("Averi").must_be_instance_of Scrabble::Player
  end

  it "Can respond to name" do
  averi = Scrabble::Player.new("Averi")
  averi.must_respond_to :name
  averi.name.must_equal "Averi"
  end

  it "plays is an array" do
    averi = Scrabble::Player.new("Averi")
    averi.plays.must_be_instance_of Array
end

  it "plays word adds a word to plays" do
    averi = Scrabble::Player.new("Averi")
    first_length = averi.plays.length
    averi.play("dog")
    averi.plays.length.must_be :>, first_length
    averi.plays.length.must_equal 1
  end

  it "plays word returns correct score" do
    averi = Scrabble::Player.new("Averi")
    averi.play("dog").must_equal 5
  end

  it "plays returns false if have already won" do
    averi = Scrabble::Player.new("Averi")
    averi.play("qqqqq")
    averi.play("zzzzzz")
    averi.play("dog").must_equal false
  end

end
