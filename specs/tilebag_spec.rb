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



      it "Can initialize drawtiles with num " do
        @tilebaggins.draw_tiles(7)
        @num_tiles_remaining.must_equal 100
      end





    end


end
