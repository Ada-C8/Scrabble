require_relative './spec_helper'
require_relative '../lib/tilebag.rb'

describe "WAVE 3" do
  before do
    @tilebaggins = Scrabble::Tilebag.new
  end

    describe "Initialize" do

      it "tilebag can be initialized" do
        @tilebaggins.must_be_instance_of Scrabble::Tilebag
      end

      it "can initialize with instances of tilebag and num_tiles_remaining" do
        @tilebaggins.tilebag.must_be_instance_of Hash
        @tilebaggins.must_respond_to :num_tiles_remaining
      end

    end

    describe "#draw_tiles" do
      it "Can #draw_tiles with a specified number " do
        @tilebaggins.draw_tiles(7)
        @tilebaggins.num_tiles_remaining.must_equal 91
      end

      it "Raises an ArgumentError if the number of tiles drawn is not an integer less than 8." do
        proc {@tilebaggins.draw_tiles(8)}.must_raise ArgumentError
        proc {@tilebaggins.draw_tiles("A")}.must_raise ArgumentError
        proc {@tilebaggins.draw_tiles(0)}.must_raise ArgumentError
      end

      it "drawn_tiles array has correct number of tiles" do
        @tilebaggins.draw_tiles(7).length.must_equal 7
        @tilebaggins.draw_tiles(7).must_be_instance_of Array
      end


    end
end
