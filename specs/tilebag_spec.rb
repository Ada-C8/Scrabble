require_relative 'spec_helper.rb'

require_relative '../lib/tilebag'

describe "TileBag class" do

  describe "Initialize" do

    it "Can be initialized" do
      Scrabble::TileBag.new.must_be_instance_of Scrabble::TileBag
    end

    it "Will have a total of 98 tiles" do
      Scrabble::TileBag.new.tile_array.length.must_equal 98
    end

    it "Allows access to tile array (attr reader)" do
      Scrabble::TileBag.new.must_respond_to :tile_array
    end
  end

  describe "draw_tiles" do
    before do
      @new_test = Scrabble::TileBag.new
    end
    it "Returns an array " do
      @new_test.draw_tiles(3).must_be_instance_of Array
    end
    it "Returns num tiles from tiles bag" do
      @new_test.draw_tiles(3).length.must_equal 3
    end

    it "Delete num tiles from tiles bag" do
      @new_test.draw_tiles(5)
      @new_test.tile_array.length.must_equal 93
    end
  end

  describe "tiles remaining method" do
    before do
      @new_test = Scrabble::TileBag.new
    end

    it "must return number" do
      @new_test.tiles_remaining.must_be_instance_of Fixnum
    end

    it "must return the new value after drawing tiles" do
      @new_test.draw_tiles(3)
      @new_test.tiles_remaining.must_equal 95
    end

  end

end
