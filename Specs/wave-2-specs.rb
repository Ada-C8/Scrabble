require_relative '../lib/Player'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require 'pry'

describe 'Player' do

  before do
    @new_player = Scrabble::Player.new("Ada")
  end

  describe "initialize" do
    it "must_be_instance_of Player" do
      new_player = Scrabble::Player.new("Ada")
      new_player.must_be_instance_of Scrabble::Player
    end

    it "must respond to method name" do
      @new_player.name.must_equal "Ada"
    end
  end

    describe "plays" do
      it "must return an Array" do
        @new_player.plays.must_be_kind_of Array
      end

      it "array must be an array of words played by that player" do
        @new_player.play("APPLE")
        @new_player.play("FRUIT")
        @new_player.plays.must_equal ["APPLE", "FRUIT"]
      end
#
# ###ADD MORE TESTS?
    end

    describe "plays(word)" do

      it "adds input to plays array" do
        @new_player.play("APPLE")
        @new_player.play("FRUIT")
        @new_player.plays.must_include "FRUIT"
      end

      it "returns false if player has already won" do
        @new_player.play("APPLE")
        @new_player.play("FRUIT")
        @new_player.play("DANCERS")
        @new_player.play("QUIZZES")
        @new_player.play("word").must_equal false
      end

      it "does not add new word to word array if player has already won" do
        @new_player.play("APPLE")
        @new_player.play("FRUIT")
        @new_player.play("DANCERS")
        @new_player.play("QUIZZES")
        @new_player.play("WORD")
        @new_player.plays.wont_include "WORD"
      end

      it "does not add new word score to score if player had already won" do
        @new_player.play("APPLE")
        @new_player.play("FRUIT")
        @new_player.play("DANCERS")
        @new_player.play("QUIZZES")
        @new_player.play("WORD")
        @new_player.total_score.must_equal 161
      end

    end

## These do not work. Not sure you can test directly on private methods
    # describe "won?" do
    #   it "must return true if score is over 100" do
    #     @new_player.play("APPLE")
    #     @new_player.play("FRUIT")
    #     @new_player.play("DANCERS")
    #     @new_player.play("QUIZZES")
    #     @new_player.won?.must_equal true
    #   end
    #
    #   it "must return false if score is under 100" do
    #     @new_player.play("APPLE")
    #     @new_player.play("FRUIT")
    #     @new_player.play("DANCERS")
    #     @new_player.won?.must_equal false
    #   end
    # end

    describe "total_score" do

      it "should give a correct total score of all player's plays" do
      @new_player.play("APPLE")
      @new_player.play("FRUIT")
      @new_player.play("DANCERS")
      @new_player.total_score.must_equal 77
      end

      it "should give a total score of zero if now words have been played" do
        @new_player.total_score.must_equal 0
      end
    end

    describe "highest_scoring_word" do
      it "ouputs the highest scoring word" do
## ADD TEST HERE ##
      end
    end
end
