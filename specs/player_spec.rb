require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/player'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe "Player" do

  before do
    @test_player = Scrabble::Player.new("Mira")
  end

  describe "#initialize" do
    it "will be an instance of player " do
      Scrabble::Player.new("Mira").must_be_instance_of Scrabble::Player
    end # It "will be an instance of player

    it "will despond to .name" do
      Scrabble::Player.new("Mira").must_respond_to :name
    end #it "will despond to .name" do

    it "will return the value of @name" do
      Scrabble::Player.new("Mira").name.must_equal "Mira"
    end #it "will return the value of @name" do

    #TODO: should we test if @name is a string?
  end # Describe "#initialize" do

  describe "#plays" do

    it "will return an array" do
      @test_player.plays.must_be_kind_of Array
    end #it "will return an array" do

    it "will return an array of strings" do
      @test_player.plays.each do |word|
        word.must_be_kind_of String
    end #.each

    end #it "will return an array of strings" do
  end #describe "#plays" do

  describe "#play" do

    it "will add the word to the @player_words array" do
      @test_player.play("hello")

      @test_player.player_words.length.must_equal 1
       array = @test_player.player_words
       array[0].must_equal "hello"
    end #it "will add the word to the @player_words array" do

    #TODO: test that it returns false when won? == true

    #TODO: test that it returns a score when won? == false 

  end #describe "#play" do




end # Describe
