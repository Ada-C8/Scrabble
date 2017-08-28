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
    end

    

  end

end
