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

    describe "self.highest_score_from(array_of_words)" do

      it "read array and return highest word count" do
        array_of_words = ["Rebecca", "Lauren", "cat"]
        Scrabble::Scoring.highest_score_from(array_of_words).must_equal "rebecca"
      end # rebecca wins

      it "tie will make shorter word win" do
        array_of_words = ["be", "it", "cat", "date", "sit"]
        Scrabble::Scoring.highest_score_from(array_of_words).must_equal "cat"
      end #short word tie win

      # it "tie 7 letter word win" do
      # end # 7 letter tie
    end # self.highest_score_from


  end #describe scoring
end # describe scrabble
