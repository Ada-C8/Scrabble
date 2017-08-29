require_relative 'spec_helper'

describe "Scoring class " do
  describe "values for letters" do
  it "the values should be stored as a hash" do
    output = Scrabble::Scoring::VALUES
    output.must_be_instance_of Hash
  end
  it "Q and Z should have value of 10" do
    output = Scrabble::Scoring::VALUES
    # expected_value = 10
    # values.each do |key,letters|
    #   key.keys.include?(10)

    result = output[10].include? "Q"
    result_z = output[10].include? "Z"

    result.must_equal true
    result_z.must_equal true
  end
  it "should not have the letter P associated with 10 points" do
    output = Scrabble::Scoring::VALUES
    result_p = output[10].include? "P"
    result_p.must_equal false
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

  describe "self.highest_score_from" do
    it "Should respond to highest_score_from" do
      (Scrabble::Scoring).must_respond_to :highest_score_from
    end

    it "Should select highest_score_from Array" do
      #Arrage
      words = ["dog", "cat", "technical"]
      expected_output = "technical"
      # Action
      output = Scrabble::Scoring.highest_score_from(words)
      # Assert
      output.must_equal expected_output
    end

    it "Should pick word with less letters if tied between two words" do
      # TODO
      #Arrage
      words = ["draank", "zoo"]
      expected_output = "zoo"
      # Action
      output = Scrabble::Scoring.highest_score_from(words)
      # Assert
      output.must_equal expected_output
    end

    it "When multiple words are tied, pick word with 7 letters" do
      # TODO
      #Arrage
      words = ["drinkin", "dddddd","bbbb"]
      expected_output = "drinkin"
      # Action
      output = Scrabble::Scoring.highest_score_from(words)
      # Assert
      output.must_equal expected_output
    end

    it "When tied between words with same length and score, choose first word from list" do
      # TODO
    end
  end
  #
  # xdescribe "self.tie breaking rules" do
  #   #Arrage
  #   # Action
  #   # Assert
  # end
end
