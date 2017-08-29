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
  end

end
