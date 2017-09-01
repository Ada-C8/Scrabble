require 'pry'
require_relative 'spec_helper'

describe "Game class" do
  describe "initialize method" do
    before do
      @new_game = Scrabble::Game.new
    end
    it "can be instantiated" do
      @new_game.must_be_kind_of Scrabble::Game
    end

    it "can create a tilebag" do
      @new_game.tilebag.must_be_kind_of Scrabble::TileBag
    end
  end
end
