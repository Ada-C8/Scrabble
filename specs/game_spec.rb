require_relative 'spec_helper'

describe "Game" do
  describe "initialize" do
    it "Has a board, tile bag, dictionary and empty array of players" do
      test_game = Scrabble::Game.new
      test_game.board.must_be_instance_of Scrabble::Board
      test_game.tile_bag.must_be_instance_of Scrabble::TileBag
      test_game.dictionary.must_be_instance_of Scrabble::Dictionary
      test_game.players.must_be_kind_of Array
    end
  end

  describe "Start" do
    xit "Gets number of players and returns an array of Players with names" do
      test_game = Scrabble::Game.new
      test_game.start
    end
  end

end
