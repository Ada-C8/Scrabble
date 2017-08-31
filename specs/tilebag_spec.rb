require_relative 'spec_helper'

describe "Scrabble" do

  describe "TileBag" do

    describe "intiialize" do
      it "initializes tilebag as an instance of TileBag class" do
        Scrabble::TileBag.new.must_be_instance_of Scrabble::TileBag
      end

      it "initializes tilebag instance with default tiles" do
        Scrabble::TileBag.new.default_tiles.must_include 'a'
        Scrabble::TileBag.new.default_tiles.must_include 'o'
        Scrabble::TileBag.new.default_tiles.keys.must_include 'u'
      end
    end

    describe "draw_tiles" do
      it "returns num random tiles" do
        Scrabble::TileBag.new.draw_tiles(7).length.must_equal 7
      end
    end

    describe "tiles_remaining" do
      it "returns the number of remaining tiles" do
        game = Scrabble::TileBag.new
        game.draw_tiles(7)
        game.tiles_remaining.must_equal 91

      end
    end

  end





end
