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
      @tile_bag.draw_tiles(100).must_equal nil
    end

    it "returns an array of tiles to user" do
      @tile_bag.draw_tiles(3).must_be_kind_of Array
    end

    # it "return an empty array of tiles to user" do
    #   @tile_bag.draw_tile
    # end

  end

  describe "tiles_remaining" do
    it "subtracts from the values of letter quantity and returns remaining tiles" do
      @tile_bag.draw_tiles(5)
      @tile_bag.tiles_remaining.must_equal 93
    end
  end

    # it "removes the tiles from the default set" do
    #
    # end

end #end of describe block


# returns a collection of random tiles, removes the tiles from the default set


#
