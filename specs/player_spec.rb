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
      @test_player.play("hello")

      @test_player.player_words.length.must_equal 1
      array = @test_player.player_words
      array[0].must_equal "HELLO"
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

    it "if won is true, should return false" do
    #if we exclude words over seven letter we will have to change this
      @test_player.play("zzzzzzzzzz")
      @test_player.play("hello").must_equal false
    end

    it "if won is false, should return score as Integer" do
      @test_player.play("z")
      @test_player.play("hello").must_equal 8
      @test_player.play("hello").must_be_kind_of Integer
    end
    
  end #describe "#play(word)" do

  describe "won?" do
    #TODO: Q: do we need to test the won? private method since we test this functionaly already in the play(word) method tests?
    xit "should return true if @total_score > 100" do
      #This doesn't work because you can't call a private method
      # @test_player.play("zzzzzzzzzz")
      # @test_player.won?.must_equal true
    end # It

    xit "should return false if @total_score < 100" do
      #This doesn't work because you can't call a private method
      # @test_player.play("z")
      # @test_player.won?.must_equal false
    end # It

    #TODO: should we test that the play(word) method respond to the won? method? If so, how do we test if a method responds to a private method?
  end # Describe won?

  describe "#highest_scoring_word" do

    it "will return a string" do
      @test_player.play("hello")
      @test_player.highest_scoring_word.must_be_kind_of String
    end #it "will return a string" do

    it "will return the highest scoring word" do
      ["a", "aa", "aaa"].each do |string|
        @test_player.play(string)
      end
      @test_player.highest_scoring_word.must_equal "AAA"
    end #it "will return the highest scoring word" do

  end # describe "#highest_scoring_word" do

  describe "#highest_word_score" do

    it "should return an Integer" do
      ["hello", "jukebox"].each do |string|
        @test_player.play(string)
      end
      @test_player.highest_word_score.must_be_kind_of Integer
    end

    it "should return the actual score" do
      ["hello", "jukebox"].each do |string|
        @test_player.play(string)
      end
      @test_player.highest_word_score.must_equal 77
    end

  end # Describe

end # Describe
