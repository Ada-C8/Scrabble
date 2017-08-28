require_relative 'spec_helper'

describe "score class " do
  # TODO: is this an instance???
  # it "new score is an instance of a score" do
  #   input = Scrabble::Score.new(
  #   input.must_be_instance_of Scrabble::Score
  # end
describe "self.score" do
  it "should respond to score" do
    # input = Scrabble::Score.new
    (Scrabble::Score).must_respond_to :score
  end
  it "should return a total score for the word" do
    output = Scrabble::Score("dog")
    expected_output = 5
    output.must_equal expected_output
  end

end

describe "self.highest_score_from" do

end

describe "self.tie breaking rules" do

end
end
