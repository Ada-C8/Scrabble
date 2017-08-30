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

    describe "total_score" do
      before do
        @jugador = Scrabble::Player.new("Morsa")
        @jugador.play("Pereza")
        @jugador.play("Food")
      end
      it "returns an integer" do
        @jugador.total_score.must_be_instance_of Fixnum
      end

      it "returns the total score" do
        @jugador.total_score.must_equal 25
      end
    end #descrieb total_score

    describe "Won? method" do
      before do
        @jugador = Scrabble::Player.new("Morsa")
        @jugador.play("Pereza")
        @jugador.play("Food")
      end

      it "Returns false or true" do
        @jugador.won?.must_equal false 
      end

      it "Returns true if over 100" do
        @jugador.play("zorro")
        @jugador.play("zzzzzzz")
        @jugador.won?.must_equal true
      end

    end #describe


  end#describe initialize
end #describe class player
