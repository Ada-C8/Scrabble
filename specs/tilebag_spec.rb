require_relative './spec_helper'
require_relative '../lib/tilebag.rb'

describe "WAVE 3" do
  before do
    @tilebaggins = Scrabble::Tilebag.new
  end

    descirbe "Initialize" do

      it "tilebag can be initialized" do
        @tilebaggins.must_be_instance_of Scrabble::Tilebag
      end

      it "Can initialize drawtiles with num " do
        @tilebaggins.drawtiles(7)
        @tilebag.must_equal 7 
      end





    end


end
