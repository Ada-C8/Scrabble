require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scoring.rb'
require_relative 'spec_helper'
require 'pry'

describe "Scoring Class" do
  describe "initialize scoring class" do
    it "ScoringClass.new is an instance of scrabble module" do
      #arrange
      scoring = Scrabble::ScoringClass.new
      #act
      #assert
      scoring.must_be_instance_of Scrabble::ScoringClass
    end
  end
  describe "self.score method" do
    it "A single letter in the alphabet returns the correct score" do
      Scrabble::ScoringClass.score("a").must_equal 1
      Scrabble::ScoringClass.score("d").must_equal 2
      Scrabble::ScoringClass.score("b").must_equal 3
      Scrabble::ScoringClass.score("f").must_equal 4
      Scrabble::ScoringClass.score("k").must_equal 5
      Scrabble::ScoringClass.score("j").must_equal 8
      Scrabble::ScoringClass.score("q").must_equal 10
    end
    it "Returns the score for a word" do
      Scrabble::ScoringClass.score("tanish").must_equal 9
    end

    it "Returns the score for 7 letter word with bonus" do
      Scrabble::ScoringClass.score("agmvJqk").must_equal 83
    end
  end #end of self.score tests

  describe "self.highest_score_from_array(array_of_words)" do
    it "returns word with highest score" do
      #SET UP VARIABLES
      array_of_words = ["adb", "kay", "jig"]
      #CALL THE METHOD BEING TESTED
      winning_word = Scrabble::ScoringClass.highest_score_from_array(array_of_words)
      #CHECK RESULT OF THAT METHOD
      winning_word.must_equal "jig"
    end

    it "return winning word if there's a tie" do
       array_of_words =["dca", "gcn", "hii", "aaaag"]
       winning_word = Scrabble::ScoringClass.highest_score_from_array(array_of_words)
       winning_word.must_equal "dca"
    end
  end

  describe "tie" do
    it "returns word with fewest letters to break tie" do
      #SET UP VARIABLES
      words_and_scores = [["bbbxph", 24],["jjj", 24],["jig", 11]]
      #CALL THE METHOD BEING TESTED
      winning_word = Scrabble::ScoringClass.tie(words_and_scores)
      #CHECK RESULT OF THAT METHOD
      winning_word.must_equal "jjj"
    end
    it "returns 7 letter word to break tie" do
      #SET UP VARIABLES
      words_and_scores = [["7777777", 24],["ccc", 24],["jig", 11]]
      #CALL THE METHOD BEING TESTED
      winning_word = Scrabble::ScoringClass.tie(words_and_scores)
      #CHECK RESULT OF THAT METHOD
      winning_word.must_equal "7777777"
    end
    it "returns first word if same length and same word" do
      #SET UP VARIABLES
      words_and_scores = [["fffe", 13],["fffa", 13],["jig", 11]]
      #CALL THE METHOD BEING TESTED
      winning_word = Scrabble::ScoringClass.tie(words_and_scores)
      #CHECK RESULT OF THAT METHOD
      winning_word.must_equal "fffe"
    end
  end
end
