require_relative 'spec_helper'

describe 'TileBag' do

  before do
    @new_tile_bag = Scrabble::TileBag.new
  end
  describe "initialize" do

    it "must be instance of TileBag" do
      @new_tile_bag.must_be_instance_of Scrabble::TileBag
    end

##VERIFY WE WANT AN ARRAY (thinking an array of each possible tile which can be key values from our hash)
    it "must be a collection of tiles" do
      @new_tile_bag.must_be_kind_of Array
    end

    it "must contain the correct quantitiy of each letter" do
      #contains_eight_of_O_pattern = /(O){8}/
      o = 0
      d = 0
      w = 0
      @new_tile_bag.each do |element|
        element.eah do |key, value|
          if key == :O
          o += 1
          elsif key == :D
          d += 1
          elsif key == :W
          w += 1
          end
        end
      o.must_equal 8
      d.must_equal 4
      w.must_equal 2
      end
    end
  end

  describe "#draw_tiles" do

    it "must be a method of TileBag" do
      @new_tile_bag.must_respond_to :draw_tiles
    end
##UNFISHED TEST:
    it "must accept a number input" do
      assert_send([@new_tile_bag, :draw_tiles, 3])
    end

  end
end
