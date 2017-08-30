require 'pry'
require_relative 'spec_helper'

describe 'TileBag class' do
  before do
    @tilebag = Scrabble::TileBag.new
  end
  describe 'Initialize method' do
    it 'can be instantiated' do
      @tilebag.must_be_kind_of Scrabble::TileBag
    end

    it "tilebag responds to all_tiles" do
      @tilebag.must_respond_to :all_tiles
    end

    it "tilebag has the right number of letters" do
      tilebag1 = Scrabble::TileBag.new
      tilebag1.all_tiles[:B].must_equal 2
      tilebag1.all_tiles[:E].must_equal 12
      tilebag1.all_tiles[:Z].must_equal 1
    end

    describe 'draw_tiles method' do
      it 'tilebag responds to draw_tiles' do
        @tilebag.must_respond_to :draw_tiles
      end

      it "returns one random tile in and array" do
        @tilebag.draw_tiles(1).must_be_kind_of Array
        @tilebag.draw_tiles(1).length.must_equal 1
      end

      it "each letter returned is a string" do
        @tilebag.draw_tiles(1)[0].must_be_kind_of String
      end

    end
  end
end
