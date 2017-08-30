require_relative 'spec_helper'

describe "Player" do
  before do
    @player = Scrabble::Player.new("Bob")
  end
  describe "Initialize" do
    it "responds to name reader method" do
      @player.must_respond_to :name
    end

    it "has an instance variable plays that returns an array" do
      @player.must_respond_to :plays
      @player.plays.must_be_instance_of Array
    end
  end

  describe "play(word)" do
    # play(word): Adds the input word to the plays Array
    # Returns false if player has already won
    # Returns the score of the word
    it "has a play method that takes in a word and adds it to array" do
      word = "hello"
      @player.play(word)
      @player.plays.include?(word).must_equal true
    end

    it "returns the score of the word" do
      @player.play("hello").must_equal 8
    end

    it "returns false if the player has already won" do
      @player.play("quest")
      @player.play("favored")
      @player.play("pizzaz")
      @player.play("hello").must_equal false
    end
  end

end
