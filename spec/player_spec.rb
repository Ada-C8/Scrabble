require_relative 'spec_helper'


describe "Player" do
  describe "#initialize" do
    it "Takes a name" do
      name = 'John'
      player = Scrabble::Player.new(name)

      player.must_respond_to :name
      player.name.must_equal name
      player.name.must_be_kind_of String

      player.must_respond_to :plays
      player.plays.must_equal []
      player.plays.must_be_kind_of Array
    end

    it " should give you an empty array" do
        player = Scrabble::Player.new(name)
        player.must_respond_to :tiles
        player.tiles.must_equal []
        player.tiles.must_be_kind_of Array

    end
  end

  describe "total_score" do
    it "Sums one word" do
      name = 'John'
      player = Scrabble::Player.new(name)
      player.play('hello')

      total = player.total_score
      total.must_equal 8
      player.plays.length.must_equal 1
    end

    it "Sums multiple words" do
      name = 'John'
      player = Scrabble::Player.new(name)
      player.play('hello')
      player.play('bubbles')
      player.play('wave')
      total = player.total_score
      total.must_equal 81
    end

    it "sums when no words have been played"  do
      name = 'John'
      player = Scrabble::Player.new(name)
      count = player.total_score
      count.must_equal 0
    end
  end

  describe "play" do
    it "plays word" do
      name = 'John'
      player = Scrabble::Player.new(name)
      value = player.play('hello')

      player.plays.length.must_equal 1
      value.must_equal 8
    end

    it "plays after a player has won" do
      name = 'John'
      player = Scrabble::Player.new(name)
      player.play('bubbles')
      player.play('bubbles')
      value = player.play('bubbles')
      value.must_equal false
    end

    it "play with blank string" do
      name = 'John'
      player = Scrabble::Player.new(name)
      player.play('')
      player.plays.length.must_equal 1
    end
  end

  describe "highest_scoring_word" do
    it "highest scoring word with only 1 word" do
      name = 'John'
      player = Scrabble::Player.new(name)
      player.play('hello')
      word = player.highest_scoring_word
      word.must_equal 'hello'
    end

    it "highest scoring word with multiple words" do
      name = 'John'
      player = Scrabble::Player.new(name)
      player.play('hello')
      player.play('bubbles')
      player.play('wave')
      word = player.highest_scoring_word
      word.must_equal 'bubbles'
    end
  end

  describe "highest word score" do
    it "highest word score with 1 word" do
      name = 'John'
      player = Scrabble::Player.new(name)
      player.play('hello')

      count = player.highest_word_score
      count.must_equal 8
    end

    it "highest word score with multiple words" do
      name = 'John'
      player = Scrabble::Player.new(name)
      player.play('hello')
      player.play('bubbles')
      player.play('wave')

      count = player.highest_word_score
      count.must_equal 63
    end
  end
  describe "draw_tiles(tile_bag)" do
    it "Checking tiles array after adding new tile to it with this method " do
      player = Scrabble::Player.new(name)
      tile_bag = Scrabble::TileBag.new
      player.draw_tiles(tile_bag)
      player.tiles.length.must_equal 7
      player.tiles.pop(2)
      player.tiles.length.must_equal 5
      player.draw_tiles(tile_bag)
      player.tiles.length.must_equal 7

    end
  end
end
