require_relative 'spec_helper'

describe 'Scrabble' do
  describe 'Player' do

    before do
      @player = Scrabble::Player.new("Ada")
    end
    #mocking @tilebag to simulate test because we need to know exactly what is in the tile bag!
    class TestTileBag
      def initialize
        @default_tiles = {
          'z' => 10
        }
      end

      def draw_tiles(num)
        @default_tiles.delete_if {|k, v| v == 0}
        tiles_drawn = @default_tiles.keys.sample(num)
        tiles_drawn.each do |drawn_tile|
          @default_tiles[drawn_tile] -= 1
        end
        return tiles_drawn[0]
      end
    end
    ########## testing begins #########
    describe "initialize" do
      it "raises error if given integer for name" do
        proc {Scrabble::Player.new(1)}.must_raise ArgumentError
      end

      it "holds a name" do
        @player.name.must_equal "Ada"
      end

      it "Takes a name" do
        @player.must_respond_to :name
      end

      it "raises error if given integer for name" do
        proc { Scrabble::Player.new(1)}.must_raise ArgumentError
      end

      it "raises error if given an empty string for name" do
        proc { Scrabble::Player.new("")}.must_raise ArgumentError
      end

      describe "Player#play" do
        it "contains an array of words plays " do
          @player.draw_tiles(TestTileBag.new)
          @player.play("zz")
          @player.play("zzz")
          @player.play("z")
          @player.plays.must_be_kind_of Array
        end

        it "raises error if given an empty string for name" do
          proc {Scrabble::Player.new("")}.must_raise ArgumentError
        end

        it "plays method returns an empty Array of the words played by the player" do
          @player.must_respond_to :plays
          @player.plays.must_be_instance_of Array
          @player.plays.length.must_equal 0
        end

        describe "Player#play" do
          it "play method shovels words into plays array" do
            @player.draw_tiles(TestTileBag.new)
            @player.play("zz")
            @player.plays.must_include "zz"
          end

          it "play method adds word score to total_score instance variable" do
            @player.draw_tiles(TestTileBag.new)
            @player.play("zz")
            @player.total_score.must_equal 20
          end

          it "play method sums scores from all words in total_score instance variable" do
            @player.draw_tiles(TestTileBag.new)
            @player.play("z")
            @player.play("zz")
            @player.play("zzz")
            @player.total_score.must_equal 60
          end

          it "makes the player play only a word" do
            proc{ @player.play("two words") }.must_raise ArgumentError
          end

          it "words with more than 7 letters can't be player" do
            proc {@player.play("zazazaza")}.must_raise ArgumentError
          end

          it "empty strings cannot be played" do
            proc {@player.play("")}.must_raise ArgumentError
          end

          it "returns false if score is over 100" do
            @player.draw_tiles(TestTileBag.new)

            @player.play("zzzzzzz")
            @player.play("z")
            @player.play("zz").must_equal false
          end

          it "returns highest scoring word" do
            @player.draw_tiles(TestTileBag.new)
            @player.play("zzzzz")
            @player.play("zz")
            # @player.play("z")
            # @player.play("laurend")
            # @player.play("cat")
            # @player.play("bat")
            @player.highest_scoring_word.must_equal "zzzzz"
          end

          it "returns highest scoring word" do
            @player.draw_tiles(TestTileBag.new)
            @player.play("zzzzz")
            @player.play("z")
            @player.highest_word_score.must_equal 50
          end

          it "returns the sum of all scores of player's words" do
            @player.draw_tiles(TestTileBag.new)
            @player.play("zz")
            @player.play("z")
            @player.total_score.must_equal 30
          end

          it "highest_word_score returns an integer" do
            @player.draw_tiles(TestTileBag.new)
            @player.play("zzzzz")
            @player.play("z")
            @player.highest_word_score.must_be_kind_of Integer
          end

          it "total_score equals 0 if no words played" do
            @player.total_score.must_equal 0
          end

          describe "Player#tiles" do
            it "draws 7 tiles " do
              @player.draw_tiles(Scrabble::TileBag.new)
              @player.tiles.length.must_equal 7
            end

            describe "Player#draw_tiles" do
              it "gives the player the necessary tiles" do
                @player.draw_tiles(Scrabble::TileBag.new)
                @player.tiles.length.must_equal 7
              end


              describe "Player#won? method" do
                it "if total_score has over 100 points, they win" do
                  @player.draw_tiles(TestTileBag.new)
                  @player.play("zzzzzzz")
                  @player.send(:won?).must_equal true
                end

                it "doesn't win if less than 100" do
                  @player.draw_tiles(TestTileBag.new)
                  @player.play("zzzz")
                  @player.send(:won?).must_equal false
                end
              end
            end
          end
        end
      end
    end
  end
end
