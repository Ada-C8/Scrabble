require_relative 'spec_helper'


describe "TileBag" do


  describe "initialize" do
    it "Tilebag is an instance of Tilebag" do
      new_game = Scrabble::TileBag.new
      new_game.must_be_kind_of Scrabble::TileBag
    end

    # can instatiate tiles and remaining tiles
    it "TileBag can instantiate tiles" do
      new_game = Scrabble::TileBag.new
      new_game.remaining_tiles.wont_be_nil
      new_game.remaining_tiles.must_be_kind_of Array
    end
    # draw tiles and remaining tiles are instances of array
    #tiles cannot be less than 7
  end#end describe init

  describe "draw_tiles" do
    it "will give an array of 7 tiles" do
      new_game = Scrabble::TileBag.new
      tile_hand = new_game.draw_tiles(7)
      tile_hand.must_be_kind_of Array
      tile_hand.length.must_equal 7
      tile_hand.each do |tile|
        tile.must_be_kind_of String
      end
    end

    it "remove_tiles from remaining_tiles" do
      new_game = Scrabble::TileBag.new
      new_game.draw_tiles(7)
      new_game.remaining_tiles.length.must_equal 91
      new_game.draw_tiles(7)
      new_game.remaining_tiles.length.must_equal 84
      # new_game.draw_tiles(100)
      # new_game.remaining_tiles.length.must_equal 0
      # remaining tiles must be 7 shorter than previously
    end
  end# end describe draw tiles
  describe "remaining_tiles" do
    it "shuffles uniquely" do
      tile_comparison_array = []
      10000.times do |thing|
        new_scrabble = Scrabble::TileBag.new
        tile_comparison_array << new_scrabble.remaining_tiles
      end
      tile_comparison_array.uniq.length.must_equal 10000
    end
    it "gives the correct number of remaining tiles" do
      new_game = Scrabble::TileBag.new
      new_game.draw_tiles(7)
      new_game.tiles_remaining.must_equal 91
      new_game.draw_tiles(7)
      new_game.tiles_remaining.must_equal 84
    end
  end #end remaining_tiles
end # end describe TileBag
