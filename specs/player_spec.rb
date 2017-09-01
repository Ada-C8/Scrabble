require_relative 'spec_helper'

describe "Player" do

  before do
    @test_player = Scrabble::Player.new("Mira")
  end

  describe "#initialize" do

    it "will be an instance of player " do
      @test_player.must_be_instance_of Scrabble::Player
    end # It "will be an instance of player

    it "will respond to .name" do
      @test_player.name.must_equal "Mira"
      @test_player.must_respond_to :name
    end #it "will despond to .name" do

    it "will respond to .player_words" do
      @test_player.player_words.must_equal []
      @test_player.must_respond_to :player_words
    end #it "will return the value of @name" do

    it "will respond to .total_score" do
      @test_player.total_score.must_be_kind_of Integer
      @test_player.total_score.must_equal 0
      # @test_player.total_score.must_respond_to :total_score
    end #it "will return the value of @name" do

  end # Describe "#initialize" do

  describe "#plays" do

    it "will return an array" do
      @test_player.plays.must_be_kind_of Array
    end #it "will return an array" do

    it "will return an array of strings" do
      @test_player.plays.all? { |x| x.must_be_kind_of String }
    end #it "will return an array of strings" do

  end #describe "#plays" do

  describe "#play(word)" do

    it "will add the word to the @player_words array" do
      test_word = @test_player.tiles_in_hand.join
      @test_player.play(test_word)

      @test_player.player_words.length.must_equal 1
      array = @test_player.player_words
      array[0].must_equal test_word
    end #it "will add the word to the @player_words array" do

    it "should add word score to @total_score" do
      test_tile_bag = Scrabble::Tilebag.new
      @test_player.draw_tiles(test_tile_bag)
      test_word = @test_player.tiles_in_hand.join
      score_is = Scrabble::Scoring.score(test_word)
      @test_player.play(test_word).must_equal score_is
      # @test_player.play("hello")
      # @test_player.total_score.must_equal 8
    end

    it "if won is true, should return false" do
      #TODO: we need to fix this to work with our ArgumentError checking!!!
      #if we exclude words over seven letter we will have to change this
      # total_score = 0
      # test_words = []
      #
      # until total_score = 93
      #   test_word = @test_player.tiles_in_hand.join
      #   total_score += Scrabble::Scoring.score(test_word)
      #   test_words << test_word
      # end
      #
      # test_words.each do |word|
      #   @test_player.play(word)
      # end
      #
      # next_test_word = @test_player.tiles_in_hand.join
      #
      # @test_player.play(word).must_equal false

      # @test_player.play("zzzzzzzzzz")
      # @test_player.play("hello").must_equal false
    end

    it "if won is false, should return score as Integer" do
      test_tile_bag = Scrabble::Tilebag.new
      @test_player.draw_tiles(test_tile_bag)
      test_word = @test_player.tiles_in_hand.join
      score_is = Scrabble::Scoring.score(test_word)
      score_is.must_be :<, 100
      @test_player.play(test_word).must_be_kind_of Integer
    end

    it "should remove tiles that were played from tiles in hand" do
      test_tile_bag = Scrabble::Tilebag.new
      @test_player.draw_tiles(test_tile_bag)
      @test_player.tiles_in_hand.length.must_equal 7
      @test_player.play(@test_player.tiles_in_hand[0])
      @test_player.tiles_in_hand.length.must_equal 6
    end

  end #describe "#play(word)" do

  describe "won?" do

    it "should return true if @total_score > 100" do

      test_tile_bag = Scrabble::Tilebag.new

      until @test_player.total_score > 100
        @test_player.draw_tiles(test_tile_bag)
        test_word = @test_player.tiles_in_hand.join
        @test_player.play(test_word)
      end

      @test_player.won?.must_equal true

      #This doesn't work because you can't call a private method
      # @test_player.play("zzzzzzzzzz")
      # @test_player.won?.must_equal true
    end # It

    it "should return false if @total_score < 100" do
      test_tile_bag = Scrabble::Tilebag.new
      @test_player.draw_tiles(test_tile_bag)
      test_word = @test_player.tiles_in_hand.join
      score_is = @test_player.play(test_word)

      score_is.must_be :<, 100
      @test_player.won?.must_equal false
    end # It  
  end # Describe won?

  describe "#highest_scoring_word" do

    it "will return a string" do
      test_tile_bag = Scrabble::Tilebag.new
      @test_player.draw_tiles(test_tile_bag)
      test_word = @test_player.tiles_in_hand.join
      @test_player.play(test_word)
      @test_player.highest_scoring_word.must_be_kind_of String
    end #it "will return a string" do

    it "will return the highest scoring word" do
      test_tile_bag = Scrabble::Tilebag.new
      @test_player.draw_tiles(test_tile_bag)
      test_word = @test_player.tiles_in_hand.join
      @test_player.play(test_word)
      test_word_2 = @test_player.tiles_in_hand.join
      @test_player.play(test_word_2)

      if Scrabble::Scoring.score(test_word) < Scrabble::Scoring.score(test_word_2)
        score_is = Scrabble::Scoring.score(test_word_2)
      else
        score_is = Scrabble::Scoring.score(test_word)
      end
      @test_player.highest_word_score.must_equal score_is

    end #it "will return the highest scoring word" do

  end # describe "#highest_scoring_word" do

  describe "#highest_word_score" do

    it "should return an Integer" do

      test_tile_bag = Scrabble::Tilebag.new
      @test_player.draw_tiles(test_tile_bag)
      test_word = @test_player.tiles_in_hand.join
      @test_player.play(test_word)
      test_word_2 = @test_player.tiles_in_hand.join
      @test_player.play(test_word_2)
      @test_player.highest_word_score.must_be_kind_of Integer

      #below is how we tested this in basic wave-3
      # ["hello", "jukebox"].each do |string|
      #   @test_player.play(string)
      # end
      # @test_player.highest_word_score.must_be_kind_of Integer
    end

    it "should return the actual score" do

      test_tile_bag = Scrabble::Tilebag.new
      @test_player.draw_tiles(test_tile_bag)
      test_word = @test_player.tiles_in_hand.join
      score_is = Scrabble::Scoring.score(test_word)
      @test_player.play(test_word)
      @test_player.highest_word_score.must_equal score_is
    end

  end # Describe

  describe "draw_tiles(tile_bag)" do
    #tiles a collection of letters that the player can play (max 7)
    #draw_tiles(tile_bag) fills tiles array until it has 7 letters from the given tile bag
    #It is not in the primary requirements to modify the existing #play(word) to use #tiles or check against the player's tiles
    it "should only draw tiles till player had seven tiles" do
      test_tile_bag = Scrabble::Tilebag.new
      @test_player.tiles_in_hand.length.must_equal 0
      @test_player.draw_tiles(test_tile_bag)
      @test_player.tiles_in_hand.length.must_equal 7
    end #it "should only draw tiles till player had seven tiles"
  end #describe "draw_tiles(tile_bag)" do

end # Describe
