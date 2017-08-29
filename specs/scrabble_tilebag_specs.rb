require_relative 'spec_helper.rb'
require_relative '../lib/scrabble-player'
require_relative '../lib/scrabble-tilebag'

describe "Scrabble::TileBag" do
  before do
    @tiles = Scrabble::TileBag.new
  end
  it "can be initialized" do
    @tiles.must_be_instance_of Scrabble::TileBag
  end
  it "initializes proper amount of tiles" do
    @tiles.tiles.count.must_equal 26
  end
  it "initializes proper tile amounts" do
    @tiles.tiles["A"].must_equal 9
    @tiles.tiles["Z"].must_equal 1
  end
  it "responds to draw_tiles" do
    @tiles.must_respond_to :draw_tiles
  end
  it "returns a collection of tiles" do
    drawn_tiles = @tiles.draw_tiles(2)
    drawn_tiles.length.must_equal 2
    drawn_tiles.must_be_instance_of Array
  end
  it "removes tiles from tilebag after draw_tiles" do
    total_before = @tiles.tiles.inject(0){|sum, (k,v)| sum + v}
    drawn_tiles = @tiles.draw_tiles(7)
    total_after = @tiles.tiles.inject(0){|sum, (k,v)| sum + v}
    total_after.must_equal (total_before - 7)
  end
  it "tiles can't go negative" do
    14.times do
      @tiles.draw_tiles(7)
    end
    @tiles.tiles_remaining.must_equal 0
    @tiles.draw_tiles(1).must_equal []
  end
  it "tiles_remaining returns appropriate number" do
    @tiles.draw_tiles(10)
    @tiles.tiles_remaining.must_equal 88
  end
  it "titles_remaining will delete nothing if given zero" do
    @tiles.draw_tiles(0)
    @tiles.tiles_remaining.must_equal 98
  end


end
