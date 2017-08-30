require_relative "spec_helper"

describe "Scoring class" do
  describe "initialize" do
    it "Creates an instance" do
      Scrabble::Scoring.new.must_be_kind_of Scrabble::Scoring
    end
  end

  describe "Self.Score" do
    it "tests a letter returns a number" do
      Scrabble::Scoring.score("x").must_equal 8
      Scrabble::Scoring.score("aeioulnrst").must_equal 10
    end

    it "raises an argument when word is not a string" do
      not_a_string = 1234
      proc { Scrabble::Scoring.score(not_a_string)}.must_raise ArgumentError
    end

    it "raises an argument when string contains numbers" do
      string_with_numbers = "mne4pl"
      proc { Scrabble::Scoring.score(string_with_numbers)}.must_raise ArgumentError
    end

    it "raises an argument when string contains symbols" do
      string_with_symbol = "me%^&p"
      proc { Scrabble::Scoring.score(string_with_symbol)}.must_raise ArgumentError
    end

    it "seven-letter words return a 50 point bonus" do
      string_bonus = "abcdefg"
      Scrabble::Scoring.score(string_bonus).must_equal 66
    end

    it "doesn't return the 50 point bonus" do
      string_bonus = "abcdef"
      Scrabble::Scoring.score(string_bonus).wont_equal 64
    end
  end

  describe "Self.highest_score_from" do
    it "Gets the highest scoring word" do
      word_list = ['One', 'Two', 'Three']
      Scrabble::Scoring.highest_score_from(word_list).must_be_instance_of String
      Scrabble::Scoring.highest_score_from(word_list).must_equal "Three"
    end

    it "Checks for ties" do
      word_list = ['a', 'dg', 'aeio']
      Scrabble::Scoring.highest_score_from(word_list).must_equal "dg"
    end

    it "Returns the 7 letter word, if tie" do
      word_list = ["a", "aa", "aeio", "dg", "zzzzzj", "aeioulg"]
      Scrabble::Scoring.highest_score_from(word_list).must_equal "aeioulg"
    end
  end
end
