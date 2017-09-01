require_relative 'spec_helper'

module Scrabble
  class Player
    attr_writer :tiles, :tilebag
  end
  class TileBag
    attr_writer :available_tiles
  end
end

describe "Scrabble::Player class " do
  before do

  end
  describe "initialize" do
    it "requires one argument, name" do
      proc {Scrabble::Player.new}.must_raise ArgumentError
    end

    it "sets the name equal to the argument passed to it " do
      input = "Ada"
      player = Scrabble::Player.new(input)
      player.name.must_equal input
    end
  end

  describe "plays" do
    it "returns an array" do
      Scrabble::Player.new("Ada").plays.must_be_instance_of Array
      Scrabble::Player.new("Ada").plays.must_equal []
    end
  end

  describe "play(word)" do
    before do
      @player = Scrabble::Player.new("Ada")
    end

    it "adds the input word to the plays array" do
      word = "hello"
      @player.tiles = word.split("")
      @player.play(word)
      @player.plays.must_include word
    end

    it "returns false if the game won? = true" do
      words = ["quickly", "zippers"]
      words.each_with_index do |word, index|
        @player.tiles = word.split("")
        @player.play(word)
      end

      @player.tiles = "hello".split("")
      @player.play("hello").must_equal false
    end

    it "returns the score of the word if won? = false" do
      @player.tiles = "quiz".split("")
      @player.play("quiz").must_equal 22
    end

    it "removes played tiles from @tiles" do
      tilebag = Scrabble::TileBag.new
      @player.draw_tiles(tilebag)
      letter = @player.tiles.sample
      before = @player.tiles.count(letter)
      @player.play(letter)
      @player.tiles.length.must_equal 6
      after = @player.tiles.count(letter)
      before.must_equal (after + 1)
    end

    it "only allows player to play with tiles they have" do
      tilebag = Scrabble::TileBag.new
      @player.draw_tiles(tilebag)
      letter = ""
      until letter != ""
        sample = ("a".."z").to_a.sample
        letter = sample if @player.tiles.include?(sample) == false
      end
      proc{@player.play(letter)}.must_raise Exception
    end

    it "doesn't accept words with more letters than the max number of tiles" do
      @player.tiles = "trombone".split("")
      proc{@player.play("trombone")}.must_raise ArgumentError
    end

    it "doesn't accept empty strings as words" do
      proc{@player.play("")}.must_raise ArgumentError
    end


  end
  #TODO: create dynamic testing for letters in the players @tiles array
  describe "total_score" do
    before do
      @player = Scrabble::Player.new("Ada")
      @words = ["apple", "hello", "zoo", "ufo"]
    end

    it "returns the sum of all played words" do
      @words.each do |word|
        @player.tiles = word.split("")
        @player.play(word)
      end
      @player.total_score.must_be_instance_of Integer
      @player.total_score.must_equal 35
    end

    it "initializes with value of 0" do
      @player.total_score.must_equal 0
    end

    it "updates after every valid play" do
      @words.each do |word|
        x = @player.total_score
        @player.tiles = word.split("")
        @player.play(word)
        @player.total_score.must_be :>, x
      end
    end

    it "does not update after the game has been won " do
      words = ["quickly", "zippers"]
      words.each do |word|
        @player.tiles = word.split("")
        @player.play(word)
      end
      x = @player.total_score
      @player.play("another")
      x.must_equal @player.total_score
    end
  end

  describe "high score variables" do
    before do
      @player = Scrabble::Player.new("Ada")
      @words = ["quickly", "zippers"]
      @words.each do |word|
        @player.tiles = word.split("")
        @player.play(word)
      end
    end

    describe "highest_scoring_word" do
      it "returns the word with the highest score" do
        @player.highest_scoring_word.must_be_instance_of String
        @player.highest_scoring_word.must_equal "quickly"
      end
    end

    describe "highest_word_score" do
      it "it is a number" do
        @player.highest_word_score.must_be_instance_of Integer
      end

      it "is the highest score of any word the player has played" do
        @player.highest_word_score.must_equal 75
      end
    end
  end

  describe "tiles" do
    it "returns an array of letters" do
      player = Scrabble::Player.new("Ada")

      player.tiles.must_be_instance_of Array
      player.tiles.all? {|letter| /^[a-z]$/.match?(letter) }
    end

    it "must have seven or less letters" do
      player = Scrabble::Player.new("Ada")
      tilebag = Scrabble::TileBag.new
      player.tiles.length.must_be :<, 8
      player.draw_tiles(tilebag)
      player.tiles.length.must_equal 7

    end

  end

  describe "player instance method of draw_tiles(tilebag)" do
    before do
      @player = Scrabble::Player.new("Ada")
      @tilebag = Scrabble::TileBag.new
    end
    it "draws the appropriate number of tiles" do
      @player.tiles.length.must_equal 0
      @player.draw_tiles(@tilebag)
      @player.tiles.length.must_equal 7

      # test after reducing # of tiles in tilebag to less than number to draw
      @tilebag.available_tiles = { "h" => 1 }
      @player.tiles = "helloh".split("")
      @player.play("hello")
      @player.tiles.length.must_equal 1
      @player.draw_tiles(@tilebag)
      @player.tiles.length.must_equal 2
      @tilebag.available_tiles.values.sum.must_equal 0
    end

    it "impacts tiles remaining of TileBag" do

      @tilebag.tiles_remaining.must_equal 98

      @player.draw_tiles(@tilebag)

      @tilebag.tiles_remaining.must_equal 91

    end

    it "fills the player's tiles array with letters " do
      @player.draw_tiles(@tilebag)
      @player.tiles.all? {|letter| /^[a-z]$/.match?(letter) }
    end
  end








end
