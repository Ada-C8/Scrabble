require_relative 'spec_helper.rb'

describe "Scoring class" do
  describe "self.score" do
    before do
      @score = Scrabble::Scoring.score("cat")
    end

    it "Returns an integer from a string input" do
      # cat is worth 5
      @score.must_equal 5
      @score.must_be_instance_of Integer

    end

    it "Adds a 50-point bonus if it's a seven-letter word (or longer)" do
      
    end
  end
end
