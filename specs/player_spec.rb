require_relative 'spec_helper'

describe "PlayerClass" do
  before do
    # SET UP VARIABLES
    @player1 = Scrabble::PlayerClass.new("Sandy")
    @player1.play("dog")
    @player1.play("kitten")
    @player1.play("panda")
    @bag_o_tiles = Scrabble::Tilebag.new
  end
  describe "name instance variable" do
    it "Scrabble::Player responds to name and return the name of player instance" do
      @player1.must_respond_to :name
      @player1.name.must_equal "Sandy"
    end
  end
  describe "plays method" do
    it "Scrabble::Player responds to Plays" do
      @player1.must_respond_to :plays
    end
    it "returns an array of words" do
      @player1.plays.must_equal ["dog", "kitten", "panda"]
      @player1.plays.must_be_kind_of Array
    end
  end
  describe "Total score method" do
    it "Scrabble::Player responds to total_score" do
      @player1.must_respond_to :total_score
    end
    it "returns and integer that is the correct total score" do
      @player1.total_score.must_be_kind_of Integer
      @player1.total_score.must_equal 23
    end
  end
  describe "Play method" do
    word = "otter"
    it "Scrabble::Player responds to play method" do
      @player1.must_respond_to :play
    end
    it "adds an input word to plays array" do
      @player1.play(word)
      @player1.plays.must_include "otter"
    end
    it "returns false if the player has won" do
      @player1.play("jxqzbvx").must_equal false
    end
    it "plays array should increase by 1" do
      @player1.play(word)
      played = @player1.plays.length
      played.must_equal 4
    end
    it "returns the score of the word" do
      @player1.play(word).must_equal 5
    end
  end
  describe "Draw tiles method" do
    it "Tiles is an array" do
    @player1.tiles.must_be_kind_of Array
    end
    it "Draw_tiles takes tiles from tile bag" do
      @player1.draw_tiles(@bag_o_tiles)
      @bag_o_tiles.tiles_remaining.must_equal 91
    end
    it "Draw_tiles adds to tiles array instance variable" do
      @player1.draw_tiles(@bag_o_tiles)
      @player1.tiles.length.must_equal 7
    end
    it "draw_tiles will not add a tile to tiles array if it already has 7 tiles." do
      @player1.draw_tiles(@bag_o_tiles)
      @player1.tiles.length.must_equal 7
      @player1.draw_tiles(@bag_o_tiles)
      @player1.tiles.length.must_equal 7
    end
  end
  describe "highest_scoring_word method" do
    it "Player 1 must respond to highest scoring word" do
      @player1.must_respond_to :highest_scoring_word
    end
    it "highest scoring word must return object of type string " do
      @player1.highest_scoring_word.must_be_kind_of String
    end
    it "highest_scoring_word must return the actual highest scoring word" do
      @player1.play("zzz")
      @player1.highest_scoring_word.must_equal "zzz"
    end
  end
  describe "highest_word_score method" do
    it "Responds to highest_word_score" do
      @player1.must_respond_to :highest_word_score
    end
    it "return actual highest word score as an integer" do
      @player1.play("zzz")
      @player1.highest_word_score.must_equal 30
      @player1.highest_word_score.must_be_kind_of Integer
    end
  end

  describe "legit_word?" do
    it "will raise argument error for invalid entry in the string AKA - numbers, special characters, empty string" do
      proc{@player1.legit_word?("1")}.must_raise ArgumentError
      proc{@player1.legit_word?("")}.must_raise ArgumentError
      proc{@player1.legit_word?("!")}.must_raise ArgumentError
      proc{@player1.legit_word?("legitword")}.must_be_silent
    end
    it "will raise arguement error if anything but a string in entered" do
      proc{@player1.legit_word?([0])}.must_raise ArgumentError
      proc{@player1.legit_word?(0)}.must_raise ArgumentError
      proc{@player1.legit_word?(false)}.must_raise ArgumentError
    end
  end
end
