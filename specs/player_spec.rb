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

######TODO: should we test if @name is a string?

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
######TODO: Use an Enumerable here
      @test_player.plays.each do |word|
        word.must_be_kind_of String
      end #.each
    end #it "will return an array of strings" do

  end #describe "#plays" do

  describe "#play(word)" do

    it "will add the word to the @player_words array" do
      @test_player.play("hello")

      @test_player.player_words.length.must_equal 1
      array = @test_player.player_words
      array[0].must_equal "hello"
    end #it "will add the word to the @player_words array" do

    it "should add word score to @total_score" do
      @test_player.play("hello")
      @test_player.total_score.must_equal 8
    end

    xit "should respond to won? private method" do

######TODO: Figure out how to test a private method won? after play(word) is ran
      @test_player.play("hello")
      expect(@test_player.send(:won?)).to eq(true)
    end

    xit "if won is true, should return false" do

    end

    xit "if won is false, should return score as Integer" do

    end

  end #describe "#play(word)" do

  xdescribe "won?" do

    xit "should return true if @total_score > 100" do
      # @total_score = 150
      # @test_player.won?.must_equal true
    end # It

    xit "should return false if @total_score < 100" do

    end # It

  end # Describe

end # Describe
