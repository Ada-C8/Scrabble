require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'


require_relative '../Lib/player.rb'



#Wave 2 specs

describe "Scrabble::Player" do

  describe "can instantiate variables" do
    it "returns a value for Scrabble::Player.name" do
      roy = Scrabble::Player.new("Roy")
      roy.name.wont_be_nil
      roy.plays.wont_be_nil
      roy.total_score.wont_be_nil
    end
  end

  describe "can play a word" do
    it "pushes the word into @plays" do
      word = "looking"
      roy = Scrabble::Player.new("Roy")
      roy.play(word)
      roy.plays(word)

    end
  end
end
