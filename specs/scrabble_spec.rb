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
    it "should raise an error if the word includes an integer" do
      input = "one1"
      proc {Scrabble::Scoring.score(input)}.must_raise ArgumentError
    end
    it "should raise an error if the word is an empty string" do
      input = ""
      proc {Scrabble::Scoring.score(input)}.must_raise ArgumentError
    end
    it "should raise an error if the the word is numeric" do
      input = 45
      proc {Scrabble::Scoring.score(input)}.must_raise ArgumentError
    end
    it "should raise an error if the word contains special characters" do
      input1 = "hello!"
      proc {Scrabble::Scoring.score(input1)}.must_raise ArgumentError
      input2 = "what?"
      proc {Scrabble::Scoring.score(input2)}.must_raise ArgumentError
      input3 = "$three"
      proc {Scrabble::Scoring.score(input3)}.must_raise ArgumentError
    end

    it "Should return a score 57 for AAAAAAA" do
      input = "AAAAAAA"
      expected_output = 57
      output  = Scrabble::Scoring.score(input)
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

  describe "self.tie_breaker" do
    it "should pick 7 letter word as winner" do
      input = ["AAAAAAA", "BH", "CW"]
      expected_output = "AAAAAAA"
      output = Scrabble::Scoring.tie_breaker(input)
      output.must_equal expected_output
    end
    it "should pick first 7 letter word if multiple 7 letter words" do
      input = ["AAAAAAA", "EEEEEEE"]
      expected_output = "AAAAAAA"
      output = Scrabble::Scoring.tie_breaker(input)
      output.must_equal expected_output
    end
    it "should pick shortest word if there are no 7 letter words" do
      input = ["BB", "AAAAAA"]
      expected_output = "BB"
      output = Scrabble::Scoring.tie_breaker(input)
      output.must_equal expected_output
    end
    it "should pick first word given if they are same score and letter count" do
      input = ["AAA", "EEE"]
      expected_output = "AAA"
      output = Scrabble::Scoring.tie_breaker(input)
      output.must_equal expected_output
    end
  end # => end tie breaker
end # => end scoring
