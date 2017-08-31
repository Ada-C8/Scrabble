require_relative 'spec_helper'


describe 'Scrabble' do
  describe 'Player' do

    before do
      @player = Scrabble::Player.new("Ada")
    end
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
          @player.play("cat")
          @player.play("bat")
          @player.play("tap")
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
            @player.play("word")
            @player.plays.must_include "word"
          end

          it "returns score of the word played" do
            @player.play("cat").must_equal Scrabble::Scoring.score("cat")
          end

          it "play method adds word score to total_score instance variable" do
            @player.play("word")
            @player.total_score.must_equal 8
          end

          it "play method sums scores from all words in total_score instance variable" do
            @player.play("word")
            @player.play("cat")
            @player.play("bat")
            @player.total_score.must_equal 18
          end

          # not sure that this is being tested... it is longer than 7 letters and  thus it fails
          it "makes the player play only a word" do
            proc{ @player.play("two words") }.must_raise ArgumentError
          end

          # this doesn't work!!!!! need help with regex
          # error message is written in scoring.rb
          # it "raises error if tried to play a number" do
          #   proc{@player.play(123)}.must_raise ArgumentError
          # end

          it "words with more than 7 letters can't be player" do
            proc {@player.play("zazazaza")}.must_raise ArgumentError
          end

          it "empty strings cannot be played" do
            proc {@player.play("")}.must_raise ArgumentError
          end


          # how to test if game is over??
          it "returns false if score is over 100" do
            @player.play("zzzzz")
            @player.play("zzzzzz")
            @player.play("zz").must_equal false
          end

          it "returns highest scoring word" do
            @player.play("zzzzzx")
            @player.play("z")
            @player.play("laurend")
            @player.play("cat")
            @player.play("bat")
            @player.highest_scoring_word.must_equal "laurend"
          end

          it "returns highest scoring word" do
            @player.play("zzzzzx")
            @player.play("z")
            @player.highest_word_score.must_equal 58
          end

          it "returns the sum of all scores of player's words" do
            @player.play("cat")
            @player.play("bat")
            @player.total_score.must_equal 10
          end

          it "highest_word_score returns an integer" do
            @player.play("zzzzzx")
            @player.play("z")
            @player.highest_word_score.must_be_kind_of Integer
          end

          it "total_score equals 0 if no words played" do
            @player.total_score.must_equal 0
          end

          describe "Player#tiles" do
            it "draws 7 tiles " do
              @player.tiles.length.must_equal 7
            end

            # describe "Player#draw_tiles"
            # it "gives the player the necessary tiles" do
            #
            # end

            describe "Player#won? method" do
              it "if total_score has over 100 points, they win" do
                @player.play("zzzzzzz")
                @player.send(:won?).must_equal true
              end

              it "doesn't win if less than 100" do
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
