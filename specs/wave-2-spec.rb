require_relative 'spec_helper'

describe "Player class " do
  before do
    @shaunna = Scrabble::Player.new("Shaunna")
  end

  it "Player is initialized with one argument." do
    @shaunna.must_be_instance_of Scrabble::Player
  end

  it "Can read name from instance." do
    @shaunna.name.must_equal "Shaunna"
  end

  it "plays returns an Array" do
    @shaunna.plays.must_be_kind_of Array
  end

  #####Ask how to make this fail####
  # it "plays returns Array of Strings" do
  #   @shaunna.plays.each do |word|
  #     word.must_be_kind_of String
  #   end
  # end
  ######How to check this array against words played in Scoring class

end

describe "method play(word)" do
  before do
    @tanja = Scrabble::Player.new("Tanja")
  end
  it "raises an ArguentError if input is not a String" do
    proc{@tanja.play(20)}.must_raise ArgumentError
  end
  it "adds the input word to the plays Array" do
    before = @tanja.plays.length
    @tanja.play("code")
    after = @tanja.plays.length

    after.must_equal (before + 1)

    @tanja.plays.pop.must_equal "code"
  end
  it "returns false if player has already won" do

  end
  it "returns the score of the word" do

  end

end
