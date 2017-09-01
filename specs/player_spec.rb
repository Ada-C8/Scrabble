require_relative 'spec_helper'

describe "Player Class" do
  describe "initializing new Player" do
    it "Should be instance of a new player" do
      input_name = "Marisa"
      output = Scrabble::Player.new(input_name)
      output.must_be_instance_of Scrabble::Player
    end

    it "Player should have name attribute" do
      input_name = "Guille"
      expected_output = "Guille"
      output_player = Scrabble::Player.new(input_name)

      output_player.must_respond_to :name
      output = output_player.name

      output.must_equal expected_output
    end

  end

  describe "Player.plays" do
    it "should respond to plays" do
      test_player = Scrabble::Player.new("Guille")
      test_player.must_respond_to :plays
    end
    it "should be an array" do
      test_player = Scrabble::Player.new("Marisa")
      output = test_player.plays
      output.must_be_instance_of Array
    end
    it "should not be empty after a play" do
      test_player = Scrabble::Player.new("Marisa")
      test_player.play("Flo")
      output = test_player.plays
      (output.empty?).must_equal false
    end

  end

  describe "Player.play(input_word)" do
    it "should respond to play" do
      test_player = Scrabble::Player.new("Guille")
      test_player.must_respond_to :play
    end
    it "should return false if player won" do
      test_player = Scrabble::Player.new("Guillermina")

      test_player.play("aaaaaaa")
      test_player.play("eeeeeee")
      output = test_player.play("dog")
      expected_output = false
      output.must_equal expected_output
    end
    it "should return score of word" do
      test_player = Scrabble::Player.new("Guille")
      output = test_player.play("aaa")
      expected_output = 3
      output.must_equal expected_output
    end
    it "should raise error if input is empty string" do
      input = ""
      test_player = Scrabble::Player.new("Guille")
      proc {test_player.play(input)}.must_raise ArgumentError
    end

    it "should raise error if numeric" do
      input = 50
      test_player = Scrabble::Player.new("Guille")
      proc {test_player.play(input)}.must_raise ArgumentError
    end
    it "should raise error if input contains numbers" do
      input = "friends4ever"
      test_player = Scrabble::Player.new("Guille")
      proc {test_player.play(input)}.must_raise ArgumentError
    end
  end

  describe "Player.total_score" do
    it "Should respond to total score" do
      test_player = Scrabble::Player.new("Guille")
      test_player.must_respond_to :total_score
    end

    it "Should return a score of 3 after player plays aaa" do
      test_player = Scrabble::Player.new("Guille")
      test_player.play("aaa")
      expected_output = 3
      output = test_player.total_score
      output.must_equal expected_output

    end

    it "Should return sum of scores of multiple played words" do
      test_player = Scrabble::Player.new("Guille")
      test_player.play("aaa")
      test_player.play("eee")
      expected_output = 6
      output = test_player.total_score
      output.must_equal expected_output
    end
  end


  describe "Player.highest_scoring_word" do
    it "should respond to highest_scoring_word" do
      test_player = Scrabble::Player.new("Guille")
      test_player.must_respond_to :highest_scoring_word
    end

    it "should read initialized scoring word" do
      test_player = Scrabble::Player.new("Guille")
      test_player.highest_scoring_word.must_equal "marisa"
    end

    it "should have aaa as highest_scoring_word after playing only aaa" do
      test_player = Scrabble::Player.new("Marisa")
      test_player.play("aaa")
      (test_player.highest_scoring_word).must_equal "aaa"
    end
    it "should return zzz as the highest_scoring_word" do
      test_player = Scrabble::Player.new("Marisa")
      test_player.play("aaa")
      test_player.play("zzz")
      (test_player.highest_scoring_word).must_equal "zzz"
    end

  end

  describe "Player.highest_word_score" do
    it "should respond to highest_scoring_word" do
      test_player = Scrabble::Player.new("Guille")
      test_player.must_respond_to :highest_scoring_word
    end
    it "should not be empty after a word is played" do
      test_player = Scrabble::Player.new("Guille")
      test_player.play("aaa")
      after_play = test_player.highest_word_score
      after_play.must_equal 3
    end
    it "should return 30 as highest score after playing zzz" do
      test_player = Scrabble::Player.new("Guille")
      test_player.play("aaa")
      test_player.play("eeee")
      test_player.play("zzz")
      (test_player.highest_word_score).must_equal 30
    end

  end

  describe "Tiles" do

    it "Should respond to tiles" do
      input = Scrabble::Player.new("Marisa")
      input.must_respond_to :tiles
    end

    # it "Every player should start with 7 tiles" do
    #   input = Scrabble::Player.new("Marisa")
    #   output = input.tiles
    #   output.length.must_equal 7
    # end

    # it "Every player should have no more than 7 tiles" do
    #
    # end

    it "Every tile must be a letter " do
      input = Scrabble::Player.new("Marisa")
      output = input.tiles
      output.each do |letter|
        letter.must_be_instance_of String
      end
    end

    # TODO add a test to check that tiles are letters only

    it "Player tile collection should be an array" do
      input = Scrabble::Player.new("Marisa")
      output = input.tiles
      output.must_be_instance_of Array
    end
  end

  describe "draw tiles(Tilebag)" do

    it "Should respond to draw tiles" do
      input = Scrabble::Player.new("Marisa")
      input.must_respond_to :draw_tiles
    end

    it "should take a tiebag as an argument" do
      input_bag = "Scrabble Bag"
      input_player = Scrabble::Player.new("Marisa")
      proc {input_player.draw_tiles(input_bag)}.must_raise ArgumentError
    end
    # TODO
    # it "If the bag is not an instance of tile_bag, raise an error " do
    #   input = Scrabble::Player.new("Marisa")
    #   proc {input.draw_tiles(0)}.must_raise ArgumentError
    # end

    it "If tiles collection is less than 7 draw_tiles should draw until 7" do
      input_bag = Scrabble::Tilebag.new
      new_player = Scrabble::Player.new("Marisa")
      new_player.draw_tiles(input_bag)
      new_player.tiles.length.must_equal 7

    end

    it "Return false if player tile collection is 7" do

    end
  end

  describe "optional 1" do

    it "raise error if player plays words with letters not in hand" do
      input_bag = Scrabble::Tilebag.new
      new_player = Scrabble::Player.new("Marisa")
      new_player.draw_tiles(input_bag)
      proc {new_player.play("zzzzz")}.must_raise ArgumentError
    end
    it "raise error if player plays word before drawing tiles" do
      new_player = Scrabble::Player.new("Marisa")
      proc {new_player.play("zzz")}.must_raise ArgumentError
    end
    it ""
  end
end
