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
        new_game.tiles.wont_be_nil
        new_game.tiles.must_be_kind_of Array
        new_game.remaining_tiles.wont_be_nil
        new_game.remaining_tiles.must_be_kind_of Array
      end
      # draw tiles and remaining tiles are instances of array
      #tiles cannot be less than 7



    end#end describe init

    describe "draw_tiles" do
      #will give an array of 7 tiles
      # remaining tiles must be 7 shorter than previously
      # must raise ArgumentError if there aren't enough tiles in the bag

    end# end describe draw tiles
end # end describe TileBag
