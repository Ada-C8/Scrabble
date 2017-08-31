require_relative 'spec_helper'

describe "tilebag" do
  describe "intialize" do
    it "should be an instance of tilebag" do
      input = Scrabble::Tilebag.new
      input.must_be_instance_of Scrabble::Tilebag
    end
    it "should have 98 tiles" do
      input = Scrabble::Tilebag.new
      input.tiles_remaining.must_equal 98
    end
    # it "should have the correct amount of each letter" do
    #   input = Scrabble::Tilebag.new
    #   bag = input.bag
    #
    #   Scrabble::Tilebag.TILES.each do |key,value|
    #      value.times do
    #       bag.include? key ? (finder << true) : (finder << false)
    #     end
    #   end
    #
    # end
  end

    describe "draw_tiles" do
      it "should respond to draw_tiles" do
        input = Scrabble::Tilebag.new
        input.must_respond_to :draw_tiles
      end

    end
    describe "tiles_remaining" do
      it "should respond to tiles_remaining" do
        input = Scrabble::Tilebag.new
        input.must_respond_to :tiles_remaining
      end
      it "should give 98 tiles before draws" do
        input = Scrabble::Tilebag.new
        input.tiles_remaining.must_equal 98
      end
      it "should give 91 tiles after first draw" do
        input = Scrabble::Tilebag.new
        input.draw_tiles(7)
        input.tiles_remaining.must_equal 91
      end
    end
  end
