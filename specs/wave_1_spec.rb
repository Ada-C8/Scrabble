require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require 'minitest/pride'
require_relative '../lib/scrabble'

describe 'Scrabble' do
  describe 'Scoring' do

    before do
      @game1 = Scrabble::Scoring.new
    end

    it "Scoring.new is a new instance of the Scoring class" do
      @game1.must_be_instance_of Scrabble::Scoring

    end # new instance of scoring

    describe "self.score " do
      it "CAT returns 5" do
        Scrabble::Scoring.score("cAt").must_equal 5
      end # CAT logic

      it "7 letter words receive 50 point bonus" do # probably a more interesting way to test this... score + 50
        Scrabble::Scoring.score("laurenl").must_equal 57
      end #50 point bonus

    end # self.score

  end #describe scoring
end # describe scrabble
