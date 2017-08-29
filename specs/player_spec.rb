require_relative 'spec_helper'

describe "Player" do
  before do
    @player = Scrabble::Player.new("Mimi")
  end

  describe 'initialize' do
    it "assigns parameter to @name variable" do
      @player.name.must_equal "Mimi"
    end

    it "will convert everything passed as name into a String" do
      @player = Scrabble::Player.new(100)
      @player.name.must_be_kind_of String

      @player = Scrabble::Player.new(false)
      @player.name.must_be_kind_of String
    end

    it "creates an empty array called @plays" do
      @player.plays.must_equal []
    end
  end

  describe 'play(word)' do
    it "adds the input word in the plays Array" do
      @player.play("jazzily")
      @player.plays.must_include "jazzily"
    end

    xit "returns false if the player has already won" do
      @player.play("jazzily") # score => 85
      @player.play("jazzily") # score => 170

      @player.play("jazzily").must_equal false
    end

    it "returns the score of the word" do
      @player.play("jazzily").must_equal 85
    end

  end

  describe 'total_score' do
    
  end

end
