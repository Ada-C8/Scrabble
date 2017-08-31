require_relative 'spec_helper'

describe "PlayerClass" do
  before do
    # SET UP VARIABLES
  @player1 = Scrabble::PlayerClass.new("Sandy")
  end
  describe "name instance variable" do
    it "Scrabble::Player responds to name" do
      @player1.must_respond_to :name
    end
    it "returns player's name" do
      @player1.name.must_equal "Sandy"
    end
  end
  describe "plays method" do
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
  describe "Total score method" do
    it "Scrabble::Player responds to total_score" do
      @player1.must_respond_to :total_score
    end
    it "return an array" do
      # plays = ["dog", "kitten", "panda"]
      @player1.total_score.must_be_kind_of Integer
    end
    it "returns the correct total score" do
      # hard code @plays = ["dog", "kitten", "panda"] score = 23
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
end

# SET UP VARIABLES
# CALL THE METHOD BEING TESTED
# CHECK RESULT OF THAT METHOD
