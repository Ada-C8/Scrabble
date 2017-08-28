require_relative 'spec_helper'

describe "score class " do
  # TODO: is this an instance???
  # it "new score is an instance of a score" do
  #   input = Scrabble::Scoring.new(
  #   input.must_be_instance_of Scrabble::Scoring
  # end
  describe "self.score" do
    it "should respond to score" do
      # input = Scrabble::Scoring.new
      (Scrabble::Scoring).must_respond_to :score
    end
    it "should return a total score for the word" do
      output = Scrabble::Scoring.score("dog")
      expected_output = 5
      output.must_equal expected_output
    end

  end
  #
  # xdescribe "self.highest_score_from" do
  #   it "Should respond to highest_score_from" do
  #     (Scrable::Scoring).must_respond_to :highest_score_from
  #   end
  #
  #   it "Should select highest_score_from Array" do
  #     #Arrage
  #     words = ["dog", "cat", "technical"]
  #     expected_output = "technical"
  #     # Action
  #     output = Scrabble::Scoring(words)
  #     # Assert
  #     output.must_equal expected_output
  #   end
  # end
  #
  # xdescribe "self.tie breaking rules" do
  #   #Arrage
  #   # Action
  #   # Assert
  # end
end
