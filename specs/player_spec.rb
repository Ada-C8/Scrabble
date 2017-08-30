require 'minitest/autorun'
require 'minitest/reporters'
# require 'minitest/skipra_dsl'
require_relative '../lib/scoring.rb'
require_relative '../lib/player.rb'

describe "Class player" do
  describe "Initialize" do
    it "Return to name" do
      Scrabble::Player.must_respond_to :name
    end

    it "Rspond to new person name" do
      bianca = Scrabble::Player.new("Bianca")
      bianca.name.must_equal "Bianca"
    end

    it "Player instance variable is empty upon initialization" do
      Scrabble::Player.new("Mariana").plays.must_equal []
    end

    describe "play method" do

      it "returns score of word while won is false" do
        Scrabble::Player.new("Ecuador").play("mama").must_equal 8
      end
    end


  end#describe initialize
end #describe class player
