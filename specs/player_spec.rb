require 'pry'
require_relative 'spec_helper'

describe "Player class" do
  before do
    @bennett = Scrabble::Player.new("Amy")
  end
  describe "initialize" do
    before do
      @amy = Scrabble::Player.new("Amy")
    end
    it "can instantiate a Player class" do
      Scrabble::Player.new("Bob").must_be_kind_of Scrabble::Player
    end
    it "Player can assign and access #name" do
      @amy.name.must_equal "Amy"
    end

    it "Can call an empty array on a new player" do
      @amy.plays.must_be_kind_of Array
      @amy.plays.must_be_empty
    end
  end

  describe "play method" do
    it "adds word to plays array" do
      @bennett.play("swift")
      @bennett.plays.must_equal ["SWIFT"]
    end

    it "returns the score of the entered word" do
      @bennett.play("swift").must_equal 11
    end

    it "returns false if already won" do
      @bennett.play("zzzzzzzzzz")
      @bennett.play("a")
      @bennett.play("blah").must_equal false
    end
  end

  describe "total_score method" do
    it "returns sum of all played words" do
      @bennett.play("swift")
      @bennett.play("aaa")
      @bennett.play("qz")

      @bennett.total_score.must_equal 34
    end
  end

  describe "won?" do
    it "Player doesn't win (less than or equal to 100 points) returns false" do
      @bennett.play("aaa")
      # @bennett.won?.must_equal false
      @bennett.send(:won?).must_equal false

    end
    it "Player wins (more than 100 points) returns true" do
      @bennett.play("zzzzzzzzzz")
      @bennett.play("a")
      # @bennett.won?.must_equal true
      @bennett.send(:won?).must_equal true
    end
    it "won? is a private method" do
      @bennett.wont_respond_to :won?
    end
  end

end
