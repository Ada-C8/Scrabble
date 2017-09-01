require_relative 'spec_helper.rb'

describe "Scrabble::Scoring" do
  describe "initialize Scoring class" do
    it "can initialize" do
      Scrabble::Scoring.new.must_be_instance_of Scrabble::Scoring
    end
  end
  describe "Scoring method" do
    it "can call score" do
      Scrabble::Scoring.must_respond_to :score
    end
    it "returns score correctly" do
      Scrabble::Scoring.score("Dog").must_equal 5
      Scrabble::Scoring.score("jazzily").must_equal (35+50)
      Scrabble::Scoring.score("").must_equal 0
    end

    describe "returns highest score correctly" do
      it "finds highest score word" do
        array = %w(do file tiger happily)
        Scrabble::Scoring.highest_score_from_array(array).must_equal "happily"
      end
      it "finds first index when words are same length same score" do
        array2 = %w(cat dog)
        Scrabble::Scoring.highest_score_from_array(array2).must_equal "cat"
      end
      it "finds word with smallest length when words are the same score" do
        array3 = %w(cat k)
        Scrabble::Scoring.highest_score_from_array(array3).must_equal "k"
      end
      it "finds word with length = 7 when words are same score" do
        array4 = %w(a i e qqqqqj aaaaaad)
        Scrabble::Scoring.highest_score_from_array(array4).must_equal "aaaaaad"
      end
      it "calls blank strings zero" do
        array4 = ['','','']
        Scrabble::Scoring.highest_score_from_array(array4).must_equal ''
      end
    end

  end

end
