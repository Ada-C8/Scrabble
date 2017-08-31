require_relative 'spec_helper'

describe "Tilebag" do

  describe "initialize method" do

    it "Can be initialized" do
      test_ob = Scrabble::Tilebag.new
      test_ob.must_be_instance_of Scrabble::Tilebag
    end

    it "Should initialize as an array of default tiles" do
      test_ob = Scrabble::Tilebag.new
      test_ob.default_tiles.must_be_instance_of Array
    end



  end#initialize

  describe "draw_tiles(num) method" do

    it "Can be called" do
      test_ob = Scrabble::Tilebag.new
      test_ob.must_respond_to :draw_tiles
    end

    it "Returns a collection of random tiles" do
      test_ob = Scrabble::Tilebag.new
      test_ob.draw_tiles(3).length.must_equal 3
    end

    it "Removes tiles from @default_tiles" do
      default_tiles = {
        A: 9,
        B: 2,
        C: 2,
        D: 4,
        E: 12,
        F: 2,
        G: 3,
        H: 2,
        I: 9,
        J: 1,
        K: 1,
        L: 4,
        M: 2,
        N: 6,
        O: 8,
        P: 2,
        Q: 1,
        R: 6,
        S: 4,
        T: 6,
        U: 4,
        V: 2,
        W: 1,
        X: 1,
        Y: 2,
        Z: 1
      }

      total_num_tiles = 0

      default_tiles.each_value do |value|
        total_num_tiles += value
      end

      test_ob = Scrabble::Tilebag.new
      test_ob.draw_tiles(10)
      test_ob.tiles_remaining.must_equal (total_num_tiles - 10)
    end

  end
end

# Create a `Scrabble::TileBag` class with a __minimum of 5 specs__. It should have the following class or instance methods:
#
# - `#initialize` Should set up the instance with a collection of all default tiles
# - `#draw_tiles(num)` returns a collection of random tiles, removes the tiles from the default set
# - `#tiles_remaining` returns the number of tiles remaining in the bag
#
# ##### Initial Distribution of Letters
# | Letter : Qty. | Letter : Qty. |
# |:------:|:-----:|
# | A : 9  | N : 6 |
# | B : 2  | O : 8 |
# | C : 2  | P : 2 |
# | D : 4  | Q : 1 |
# | E : 12 | R : 6 |
# | F : 2  | S : 4 |
# | G : 3  | T : 6 |
# | H : 2  | U : 4 |
# | I : 9  | V : 2 |
# | J : 1  | W : 2 |
# | K : 1  | X : 1 |
# | L : 4  | Y : 2 |
# | M : 2  | Z : 1 |
#
# #### Modifications to `Player`
# Create specs for (__minimum 2__) and add to the `Player` class the following instance methods:
#
# - `#tiles` a collection of letters that the player can play (max 7)
# - `#draw_tiles(tile_bag)` fills tiles array until it has 7 letters from the given tile bag
#     - It is not in the primary requirements to modify the existing `#play(word)` to use `#tiles` or check against the player's tiles
