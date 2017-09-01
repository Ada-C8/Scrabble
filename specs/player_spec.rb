require_relative 'spec_helper'

describe "Player" do

  before do
    @test_ob = Scrabble::Player.new("name")
    @test_tile_bag = Scrabble::Tilebag.new
  end


  describe "initialize method" do
    it "Is a Player object" do
      @test_ob.must_be_instance_of Scrabble::Player
    end

    it "Can be instantiated with one argument" do
      @test_ob.name.must_equal "name"
    end

    it "Has an instance variable @plays, which is an array" do
      @test_ob.plays.must_be_instance_of Array
    end

    it "Has an instrance variable @total_score, which is an Integer" do
      @test_ob.total_score.must_be_instance_of Integer
    end

    it "Has an instrance variable @total_score, that returns the current total score" do
      @test_ob.play("aa")
      @test_ob.total_score.must_equal 2
    end

  end#initialize

  describe "play method" do
    it "Can be called" do
      @test_ob.must_respond_to :play
    end

    it "Raises an ArgumentError if input is not a String" do
      proc { @test_ob.play(123)}.must_raise ArgumentError
    end

    it "Adds the word input to the @plays instance variable" do
      @test_ob.play("WORD")
      @test_ob.plays.must_equal ["WORD"]
    end

    it "Returns false if player has already won" do
      @test_ob.play("AZZZZZZ")
      @test_ob.play("word").must_equal false
    end

    it "returns score of word" do
    word = "A"
    @test_ob.draw_tiles(@test_tile_bag)
    @test_ob.play(word).must_equal 1
    end
  end#play method

describe "highest_scoring_word method" do
  it "Can be called" do
    @test_ob.must_respond_to :highest_scoring_word
  end

  it "Returns a string" do
    test_words = ["jazz", "as", "bad"]
    test_words.each do |word|
      @test_ob.play(word)
    end
    @test_ob.highest_scoring_word.must_be_instance_of String
  end

  it "Returns the highest scoring played word" do
    test_words = ["jazz", "as", "bad"]
    test_words.each do |word|
      @test_ob.play(word)
    end
    @test_ob.highest_scoring_word.must_equal "jazz"
  end

end

describe "highest_word_score method" do
  it "Can be called" do
    @test_ob.must_respond_to :highest_word_score
  end

  it "Returns a string" do
    test_words = ["jazz", "as", "bad"]
    test_words.each do |word|
      @test_ob.play(word)
    end
    @test_ob.highest_word_score.must_be_instance_of Integer
  end

  it "Returns the highest_word_score" do
    test_words = ["jazz", "as", "bad"]
    test_words.each do |word|
      @test_ob.play(word)
    end
    @test_ob.highest_word_score.must_equal 29
  end
end

describe "tiles method" do
  it "Can be called" do
    @test_ob.must_respond_to :tiles
  end

  it "Returns an array" do
    @test_ob.tiles.must_be_instance_of Array
  end

  it "Returns a collection of letters that the player can play, no more than 7" do
    @test_ob.tiles.length.must_be :<, 8
  end

end

describe "draw_tiles(tile_bag) method" do
  it "Can be called" do
    @test_ob.must_respond_to :draw_tiles
  end

  it "When called once, return an array of 7 elements" do
    @test_ob.draw_tiles(@test_tile_bag).length.must_equal 7
    @test_ob.tiles.length.must_equal 7
  end
end

end#Player
