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

    it "returns highest score correctly" do
      array = %w(do file tiger happily)
      Scrabble::Scoring.highest_score_from(array).must_equal "happily"

      array2 = %w(cat dog)
      Scrabble::Scoring.highest_score_from(array2).must_equal "cat"

      array3 = %w(cat k)
      Scrabble::Scoring.highest_score_from(array3).must_equal "k"

      array4 = %w(aaaaaaa aak)
      Scrabble::Scoring.highest_score_from(array4).must_equal "aaaaaaa"
    end

  end

end
