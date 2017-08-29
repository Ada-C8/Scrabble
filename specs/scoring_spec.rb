require 'minitest/autorun'
require 'minitest/reporters'
# require 'minitest/skipra_dsl'
require_relative '../lib/scoring.rb'


describe "Scrabble::Scoring class" do

  describe "Initialize" do
    it "Can be intialized" do
      #arrange
      Scrabble::Scoring.new.must_be_instance_of Scrabble::Scoring
      #act

      #assert

    end
  end#describe initialize

  describe "Score class method" do
    it "Retunrs 0 for an empty string" do
      Scrabble::Scoring.score("").must_equal 0
    end

    it "Returns the score for a word" do
      Scrabble::Scoring.score("CASA").must_equal 6
    end

    it "Returns the score even when lowercase word" do
      Scrabble::Scoring.score('casa').must_equal 6
    end

    it "Returns score plus 50 for a 7 letter word" do
      Scrabble::Scoring.score("LAPTOPS").must_equal 61
    end
  end#Describe Score class methos

  describe "High Score method" do
    # it "Returns array an array for array of words that is not empty " do
    #   array_words = ["house", "mama", "florida", "flan", "dulce"]
    #   Scrabble::Scoring.highscore_from(array_words).must_be_instance_of Array
    #   Scrabble::Scoring.highscore_from(array_words).wont_be_empty
    # end

    it "Score return the correct score for each word in the array" do
      # array_words = ["house", "mama", "florida", "flan", "dulce"]
      # try_scores = []
      # array_words.each do |word|
      #   puts "This is the score #{score = Scrabble::Scoring.score(word)}"
      #   puts "For this word: #{word}"
      # end
      # Scrabble::Scoring.highscore_from(array_words).must_equal 61
    end

    it "Returns the word with the max score, when is just one winner" do
      array_words = ["house", "mama", "florida", "flan", "dulce"]

      Scrabble::Scoring.highscore_from(array_words).must_equal "florida"
    end

    it "Return the word with 7 letters in case a tie" do
      array_words = ["BADAAAA", "QQQQQQ", "PLANES"]
      Scrabble::Scoring.highscore_from(array_words).must_equal "BADAAAA"
    end

  end #describe high score method

end #describe first end
