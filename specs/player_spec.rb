require_relative 'spec_helper'


describe 'Scrabble' do
  describe 'Player' do

    before do
      @player = Scrabble::Player.new("Ada")
    end

    it "requires a name" do
      @player.name.must_equal "Ada"

    end

    # it "raises error if given integer for name" do
    #   proc { Scrabble::Player.new(1)}.must_raise ArgumentError
    # end
    #
    # it "raises error if given an empty string for name" do
    #   proc { Scrabble::Player.new("")}.must_raise ArgumentError
    # end

    it "play method shovels words into plays array" do
      @player.play("word").must_include "word"
    end

    ### TODO: uncomment below and comment out private to test

    # it "if total_score has over 100 points, they win" do
    #
    #   @player.play("zzzzzzz")
    #   @player.public_send.won?.must_equal true
    # end
    #
    # it "doesn't win if less than 100" do
    #
    #   @player.play("zzzz")
    #   @player.won?.public_send.must_equal false
    # end

    it "returns highest scoring word" do
      @player.play("zzzzzx")
      @player.play("z")
      @player.play("laurend")
      @player.play("cat")
      @player.play("bat")
      @player.highest_scoring_word.must_equal "laurend"
    end

    it "returns highest scoring word" do
      @player.play("zzzzzx")
      @player.play("z")
      @player.highest_word_score.must_equal 58
    end

  end
end
