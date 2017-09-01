require_relative 'spec_helper'


describe "PlayerClass" do
  it "initiates an instance of player" do
    player = Scrabble::Player.new("jan")
    player.must_be_instance_of Scrabble::Player
  end

  it "can access the player's name" do
    player = Scrabble::Player.new("jan")
    player.name.must_equal "jan"
  end
end

describe "Plays" do
  it "returns an empty array if no words have been played" do
    play = Scrabble::Player.new("jan")
    play.plays.must_equal []
    play.plays.count.must_equal 0
    play.plays.must_be_instance_of Array
  end

  it "add word to plays array" do
    player = Scrabble::Player.new("Jan")
    player.play("fisher")
    player.plays.must_equal ["fisher"]
  end

  it "returns the score of the word played" do
    player = Scrabble::Player.new("Jan")
    player.play("cat").must_equal 5
    player.play("a").must_equal 1
  end

  it "returns false if player has already won" do
    player = Scrabble::Player.new("Jan")
    player.play("zzzzzzz")
    player.play("zzzz")
    player.play("a").must_equal false
  end
end

describe "total score method" do
  it "returns the sum of played words" do
    player = Scrabble::Player.new("Jan")
    player.play("cat")
    player.play("dog")
    player.play("a")
    player.total_score.must_equal 11
  end
  it "returns total score when only one word has been played" do
    player = Scrabble::Player.new("Jan")
    player.play("cat")
    player.total_score.must_equal 5
  end
  it "returns 0 if no words have been played" do
    player = Scrabble::Player.new("Jan")
    player.total_score.must_equal 0
  end
end
describe "highest word score method" do
  it "returns the highest score of a played word" do
    player = Scrabble::Player.new("Jan")
    player.play("cat")
    player.play("dog")
    player.play("zzz")
    player.highest_word_score.must_equal 30

    playertwo = Scrabble::Player.new("Jan")
    playertwo.play("cat")
    playertwo.play("a")
    playertwo.play("b")
    playertwo.highest_word_score.must_equal 5
  end

  it "returns the highest score even in case of a tie score" do
    player = Scrabble::Player.new("Jan")
    player.play("cat")
    player.play("dog")
    player.highest_word_score.must_equal 5
  end
end
  describe "highest scoring word method" do
    it "returns the highest scoring played word" do
      player = Scrabble::Player.new("Jan")
      player.play("cat")
      player.play("dog")
      player.play("zzz")
      player.highest_scoring_word.must_equal "zzz"
    end

    it "returns the word of shorter length if there is a tie" do
      player = Scrabble::Player.new("Jan")
      player.play("z")
      player.play("mpy")
      player.highest_scoring_word.must_equal "z"
    end

    it "returns the word of 7 letters if there is a tie in points" do
      player = Scrabble::Player.new("Jan")
      player.play("zzzz")
      player.play("zzzdddf")
      player.play("zzkkkk")
      player.highest_scoring_word.must_equal "zzzdddf"
    end

    it "returns the first played word if there is a tie in score and length" do
      player = Scrabble::Player.new("Jan")
      player.play("cat")
      player.play("dog")
      player.play("a")
      player.highest_scoring_word.must_equal "cat"
    end
  end

  describe "tiles method" do
    before do
      @player = Scrabble::Player.new("Jan")
    end

    it "returns an array of tiles" do
      @player.tiles.must_be_instance_of Array
    end

    it "fills tile array until reaches 7 letters" do
      tile_bag = Scrabble::TileBag.new
      @player.draw_tiles(tile_bag)
      @player.tiles.count.must_equal 7
      @player.play("cats")
      # @player.tiles.count.must_equal 3
      # @player.draw_tiles(tile_bag)
      # @player.tiles.count.must_equal 7
    end
  end
