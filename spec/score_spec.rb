require_relative 'spec_helper'
describe "Score" do
  describe "#initialize" do
    it " should give you an empty array" do
      my_class = Scrabble::Score.new
      my_class.words.must_be_empty
    end
  end

#self.score method
  describe " self.score method" do
    it " Check for the short word where the letter doesn't repeat" do
      my_class = Scrabble::Score
      my_class.score("CAT").must_equal 5
    end

    it " Check for the word where the letter repeats" do
      my_class = Scrabble::Score
      my_class.score("CATAN").must_equal 7
    end

    it " Check for the 7 letter word " do
      my_class = Scrabble::Score
      my_class.score("BUBBLES").must_equal 63
    end

	it " Check for case sensitivity " do
      my_class = Scrabble::Score
      my_class.score("bubbles").must_equal 63
    end
  end

# self.highest_score_from_array method
  describe " self.highest_score_from_array method" do
    it " Check for the longest word without a tie" do
      my_class = Scrabble::Score
      my_class.highest_score_from_array(["CAT", "CATAN", "BUBBLES"]).must_equal "BUBBLES"
    end

    it " if tie, should return the word with fewer letters" do
      my_class = Scrabble::Score
      my_class.highest_score_from_array(["DOLLAR", "HALL"]).must_equal "HALL"
    end

    it " if tie, 7 letter word should be returned" do
      my_class = Scrabble::Score
      my_class.highest_score_from_array(["DOLLAR", "HALL","LETTERS"]).must_equal "LETTERS"
    end

    it " If 2 words with 7 letters in tie, first word should be returned" do
      my_class = Scrabble::Score
      my_class.highest_score_from_array(["QUICKLY", "SQUEEZE","LETTERS"]).must_equal "QUICKLY"
    end
  end
end
