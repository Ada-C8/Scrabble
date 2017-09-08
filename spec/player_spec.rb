require_relative '../lib/player'
require_relative 'spec_helper'

describe "class Player"  do
  before do
    @player = Scrabble::Player.new(name)
  end

  describe "instance of Player class" do
    it "creates an instance of Player" do
      @player.must_be_instance_of Scrabble::Player
    end

    it "returns the value of the instance variable" do
      @player.must_respond_to :name
    end
  end

  describe "tiles method" do
    it "returns empty array before player starts first game" do
      @player.tiles.must_be_empty true
    end
  end

    # it "must raise an error if tile length is greater than 7" do
    #   tile_bag = Scrabble::TileBag.new
    #
    #   @player.play("ttttttt")
    #   @player.draw_tiles(tile_bag)
    #   @player.tiles
    #   proc {Scrabble::Player.tiles}.must_raise ArgumentError
    # ends

  # describe "draw tiles" method do
  #   it "fills tiles array until it has 7 letters from the given tile bag" do
  #
  #   end
  # end

  describe "plays method" do
    it "returns an array of word played by the player" do
      # @player.play("cats")
      # @player.play("rats")
      @player.plays.must_be_kind_of Array
    end
  end

  describe "play method" do
    it "adds the word to the plays array" do
      @player.must_respond_to :play
    end

    it "returns false if player already won" do
      @player.won?.must_equal false
      @player.play("ZZZZZZZ")
      @player.won?.must_equal true
      @player.play("hi").must_be_nil true
    end
  end

  describe "total score" do
    it "returns the total score of played words" do
      @player.play("darts")
      @player.play("monkey")
      @player.play("food")
      @player.total_score.must_equal 29
    end

    it "returns zero if array is empty" do
      @player.play("")
      @player.total_score.must_equal 0
    end
  end

  describe "highest scoring word" do
    it "returns the word with the highest score" do
      @player.play("darts")
      @player.play("pizza")
      @player.play("food")
      @player.play("monkey")
      @player.highest_scoring_word.must_equal "pizza"
    end
  end

  describe "highest word score" do
    it "returns the highest scoring word score" do
      @player.play("darts")
      @player.play("pizza")
      @player.play("food")
      @player.play("monkey")
      @player.highest_word_score.must_equal 25
    end
  end

end #end of describe
