require_relative 'spec_helper'

describe "Scoring class " do
  describe "values for letters" do
  it "should respond to :values" do
    (Scrabble::Scoring).must_respond_to :values
  end
  it "the values should be stored as a hash" do
    output = Scrabble::Scoring.values
    output.must_be_instance_of Hash
  end
  it "Q and Z should have value of 10" do
    output = Scrabble::Scoring.values
    expected_value = 10
    actual_q_value = output["Q"]
    actual_z_value = output["Z"]
    actual_q_value.must_equal expected_value
    actual_z_value.must_equal expected_value
  end
end
#   it "all letters should be key for corresponding value" do
#     # TODO some kind of loop
#
#     0.upto(@letter_array.length-1) {|index|
#       if (@letter_array[index] == guess)
#       @finished_guess[index] == guess
#     end}
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

  xdescribe "self.highest_score_from" do
    it "Should respond to highest_score_from" do
      (Scrable::Scoring).must_respond_to :highest_score_from
    end

    it "Should select highest_score_from Array" do
      #Arrage
      words = ["dog", "cat", "technical"]
      expected_output = "technical"
      # Action
      output = Scrabble::Scoring(words)
      # Assert
      output.must_equal expected_output
    end
  end

  xdescribe "self.tie breaking rules" do
    #Arrage
    # Action
    # Assert
  end
end
