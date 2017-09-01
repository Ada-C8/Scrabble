require 'pry'
require_relative 'spec_helper'

describe "Game class" do
  describe "initialize method" do
    it "can be instantiated" do
      game = Scrabble::Game.new
      game.must_be_kind_of Scrabble::Game
    end

    it "can create a tilebag" do

    end
  end
end
