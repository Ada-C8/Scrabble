require_relative 'spec_helper'

describe "Scoring Class" do
  before do
    @scoring_test = Scrabble::ScoringClass.new
    @tiles_test_arr = [["a",1],["d",2],["b",3],["f",4],["k",5],["j",8],["q",10]]
  end
  describe "initialize scoring class" do
    it "ScoringClass.new is an instance of scrabble module" do
      @scoring_test.must_be_instance_of Scrabble::ScoringClass
    end
  end
  describe "self.score method" do
    it "A single letter in the alphabet returns the correct score" do
      @tiles_test_arr.each do |element|
        Scrabble::ScoringClass.score(element[0]).must_equal element[1]
      end
    end
    it "Returns the score for a word" do
      Scrabble::ScoringClass.score("tanish").must_equal 9
    end
    it "Returns the score for 7 letter word with bonus" do
      Scrabble::ScoringClass.score("agmvJqk").must_equal 83
    end
  end #end of self.score tests

  describe "self.highest_score_from(array_of_words)" do
    it "returns word with highest score" do
      array_of_words = ["adb", "kay", "jig"]
      winning_word = Scrabble::ScoringClass.highest_score_from(array_of_words)
      winning_word.must_equal "jig"
    end
    it "return winning word if there's a tie" do
       array_of_words =["dca", "gcn", "hii", "aaaag"]
       winning_word = Scrabble::ScoringClass.highest_score_from(array_of_words)
       winning_word.must_equal "dca"
    end
  end

  describe "tie" do
    it "returns word with fewest letters to break tie" do
      words_and_scores = [["bbbxph", 24],["jjj", 24],["jig", 11]]
      winning_word = Scrabble::ScoringClass.tie(words_and_scores)
      winning_word.must_equal "jjj"
    end
    it "returns 7 letter word to break tie" do
      words_and_scores = [["7777777", 24],["ccc", 24],["jig", 11]]
      winning_word = Scrabble::ScoringClass.tie(words_and_scores)
      winning_word.must_equal "7777777"
    end
    it "returns first word if same length and same word" do
      words_and_scores = [["fffe", 13],["fffa", 13],["jig", 11]]
      winning_word = Scrabble::ScoringClass.tie(words_and_scores)
      winning_word.must_equal "fffe"
    end
  end
end
