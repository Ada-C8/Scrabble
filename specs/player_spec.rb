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
  xdescribe "name instance variable" do
    it "Scrabble::Player responds to name" do
      @player1.must_respond_to :name
    end
    it "returns player's name" do
      @player1.name.must_equal "Sandy"
    end
  end
  xdescribe "plays method" do
    it "Scrabble::Player responds to Plays" do
      @player1.must_respond_to :plays
    end
    it "return an array" do
      @player1.plays.must_be_kind_of Array
    end
    it "returns an array of words" do
      @player1.plays.must_equal ["dog", "kitten", "panda"]
    end
  end
  xdescribe "Total score method" do
    it "Scrabble::Player responds to total_score" do
      @player1.must_respond_to :total_score
    end
    it "return an array" do
      @player1.total_score.must_be_kind_of Integer
    end
    it "returns the correct total score" do
      @player1.total_score.must_equal 23
    end
  end
  xdescribe "Play method" do
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
      @player1.draw_tiles(1)
      @bag_o_tiles.tiles_remaining.must_equal 97
    end
    it "Draw_tiles adds to tiles array instance variable" do
      @player1.draw_tiles(1)
      @player1.tiles.length.must_equal 1
    end
    it "draw_tiles will not add a tile to tiles array if it already has 7 tiles." do
      @player1.draw_tiles(7)
      @player1.tiles.length.must_equal 7
      @player1.draw_tiles(1)
      @player1.tiles.length.must_equal 7
    end
    # it "Edgecase draw_tiles(num)" do
    #   #edge case draw_tiles(num) so that it only accepts integers
    # end
  end
  xdescribe "highest scoring word" do
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
  xdescribe "Highest Word Score method" do
    it "Responds to highest_word_score" do
      @player1.must_respond_to :highest_word_score
    end
    it "should be an integer" do
      @player1.highest_word_score.must_be_kind_of Integer
    end
    it "return actual highest word score" do
      @player1.play("zzz")
      @player1.highest_word_score.must_equal 30
    end
  end

  xdescribe "legit_word?" do
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

# SET UP VARIABLES
# CALL THE METHOD BEING TESTED
# CHECK RESULT OF THAT METHOD
