describe "class TileBag" do
  before do
   @tile_bag = Scrabble::TileBag.new
  end

  describe "initialize" do
    it "sets up the instance with a collection of all default tiles" do
      @tile_bag.must_be_instance_of Scrabble::TileBag
    end
  end

  describe "draw tiles" do
    it "returns nil if input is more than tilebag" do
      @tile_bag.draw_tiles(100).must_be_nil true
    end

    it "returns an array of tiles to user" do
      @tile_bag.draw_tiles(3).must_be_kind_of Array
    end

    it "returns an empty array of tiles to user" do
      @tile_bag.draw_tiles(0).must_be_empty Array
    end
  end

  describe "tiles_remaining" do
    it "subtracts from the values of letter quantity and returns remaining
    tiles" do
      @tile_bag.draw_tiles(5)
      @tile_bag.tiles_remaining.must_equal 93
    end
    it "returns the total letter quantity when no tile(s) is drawn" do
      @tile_bag.draw_tiles(0)
      @tile_bag.tiles_remaining.must_equal 98
    end
  end
end #end of describe block
