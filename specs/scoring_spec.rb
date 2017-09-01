require_relative 'spec_helper'

describe "Scoring" do

  before do
    @test_ob = Scrabble::Scoring.new
    @test_class_method = Scrabble::Scoring
  end

  describe "Score Chart" do

    it "Letter chart is a constant, empty hash" do
      Scrabble::Scoring::SCORE_CHART.must_be_instance_of Hash
    end

    it "verify value is assigned to respective array of letters" do
      #Test first key/value pair
      Scrabble::Scoring::SCORE_CHART[1].must_equal ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"]

      #Test last key/value pair
      Scrabble::Scoring::SCORE_CHART[10].must_equal ["Q", "Z"]
    end
  end

  describe "initialize" do

    it "Instantiate Scoring class" do
      @test_ob.must_be_instance_of Scrabble::Scoring
    end
  end

  describe "self.score method" do

    it "Can be called" do
      @test_class_method.must_respond_to :score
    end

    it "Raises an ArgumentError if input is not a String" do
      proc { @test_class_method.score(123) }.must_raise ArgumentError

      proc { @test_class_method.score([]) }.must_raise ArgumentError

      proc { @test_class_method.score(0) }.must_raise ArgumentError
    end

    it "Returns the total score for the given word" do
      test_word = "WORD"
      test_score = 4 + 1 + 1 + 2
      @test_class_method.score(test_word).must_equal test_score
    end

    it "Returns a 50 point bonus when input is 7 letters" do
      test_word = "WORDERS"
      test_score = 4 + 1 + 1 + 2 + 1 + 1 + 1 + 50
      @test_class_method.score(test_word).must_equal test_score
    end
  end

  describe "highest_score_from method" do

    it "Can be called" do
      @test_class_method.must_respond_to :highest_score_from
    end

    it "Raises an error if parameter is not an Array" do
      proc { @test_class_method.highest_score_from(123) }.must_raise ArgumentError

      proc { @test_class_method.highest_score_from({}) }.must_raise ArgumentError

      proc { @test_class_method.highest_score_from(0) }.must_raise ArgumentError
    end

    it "Returns a String" do
      test_arr = ["A", "THE", "ZZZ"]
      @test_class_method.highest_score_from(test_arr).must_be_instance_of String
    end

    it "Returns the word in the array with the highest score" do
      test_arr = ["A", "THE", "ZZZ"]
      @test_class_method.highest_score_from(test_arr).must_equal "ZZZ"
    end

  end

  describe "self.tie method" do

    it "Can be called" do
      @test_class_method.must_respond_to :tie
    end

    it "Returns a String" do
      test_word = "ARE" #score = 3
      test_word_2 = "DO" #score = 3
      @test_class_method.tie(test_word, test_word_2).must_be_instance_of String
    end

    it "Returns the word with the fewest letters in the case of a tie" do
      test_word = "ARE" #score = 3
      test_word_2 = "DO" #score = 3
      @test_class_method.tie(test_word, test_word_2).must_equal "DO"
    end

    it "Returns the first word supplied, in the case of a tie with words of the same length and same score" do
      test_word = "GO" #score = 3
      test_word_2 = "DO" #score = 3
      @test_class_method.tie(test_word, test_word_2).must_equal "GO"
    end

    it "Returns the seven letter word, in the case of a tie" do
      test_word = "AEIOULN" #score = 7
      test_word_2 = "KD" #score = 7
      @test_class_method.tie(test_word, test_word_2).must_equal "AEIOULN"
    end

  end
end
