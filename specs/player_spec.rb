require_relative './spec_helper'
require_relative '../lib/player'

describe "#Scrabble::Player" do
  before do
    @tilebaggins = Scrabble::Tilebag.new
    @carlisle = Scrabble::Player.new("Carlisle", @tilebaggins)
    @carlisle.play("schmuck")
    @carlisle.play("granny")
  end

  describe "initialize" do
    #1
    it "Can initialize with a name" do
      @carlisle.must_be_instance_of Scrabble::Player
    end
    #2
    it "Can show a player's #@name" do
      @carlisle.name.must_equal 'Carlisle'
    end
    #3
    it "Can accept guesses from input and store them" do
      @carlisle.plays.must_be_instance_of Array
      first_plays_length = @carlisle.plays.length
      @carlisle.play("A")
      second_plays_length = @carlisle.plays.length
      first_plays_length.must_equal second_plays_length-1
    end
    #4
    it "Can display a player's guessed words" do
      @carlisle.plays.must_equal ["schmuck", "granny"]
    end

  end

  describe "#total_score" do
    #5
    it "#total_score returns the summation of the elements in a word_scores" do
      @carlisle.word_scores.must_be_instance_of Array

      score_sum = Scrabble::Scoring.score("granny") + Scrabble::Scoring.score("schmuck")
      @carlisle.total_score.must_equal score_sum
    end
  end
  describe "#play" do
    #6
    it "If a player has not yet won, #play must return the score of the most recently played word" do
      @carlisle.play("cat").must_equal 5
    end
    #7
    it "Returns false if a player attempts to #play another word after scoring 100 points" do
      @tilebagginsjr = Scrabble::Tilebag.new
      @carlislejr = Scrabble::Player.new("Carlisle, Jr.", @tilebagginsjr)
      @carlislejr.play("QQQQQQQ")

      @carlislejr.play("hi").must_equal false
    end
  end
  describe "highest_scoring_word & highest_word_score returned" do
    #8
    it "returns string word (highest_scoring_word)"do
       @carlisle.highest_scoring_word.must_equal "schmuck"
    end
    #9
    it "returns score for highest scoring word" do
      @carlisle.highest_word_score.must_equal 70
    end
  end

  describe "#won" do
    #10
    it "has a private method, won." do
      check_won = Scrabble::Player.private_method_defined? :won?
      check_won.must_equal true
    end

    #11
    it "RESPOND TO" do
      @carlisle.must_respond_to :name
      @carlisle.must_respond_to :word_scores
      @carlisle.must_respond_to :play
    end
  end

  describe "check draw tiles method" do
    before do
    @tilebagginsIII = Scrabble::Tilebag.new
    @carlisleIII = Scrabble::Player.new("Carlisle, III", @tilebagginsIII)
    end


    it "draws number of tiles player requires" do
      @carlisle.draw_tiles
      @carlisle.hand.length.must_equal 7
      @carlisle.draw_tiles
      @carlisle.hand.length.must_equal 7
      @carlisle.tile_bag.num_tiles_remaining.must_equal 91
      @carlisle.play(@carlisle.hand[0..6])
      @carlisle.hand.length.must_equal 0
    end

    it "bag is low" do
      2.times do
        @carlisleIII.draw_tiles

        @carlisleIII.play(@carlisleIII.hand[0..4].join(""))
      end


      @carlisleIII.tile_bag.num_tiles_remaining.must_equal 85
    end

    it "bag is empty" do

    end

  end
end
