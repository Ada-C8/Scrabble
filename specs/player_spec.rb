require_relative 'spec_helper.rb'

describe "Player class" do
  describe "initialize" do

    before do
      @anna = Scrabble::Player.new("Anna")
    end

    it "Creates a player with the given name" do
        @anna.must_be_instance_of Scrabble::Player

        @anna.name.must_equal "Anna"
    end

    it "Creates a player with an array of played words" do
      @anna.plays.must_be_instance_of Array
      @anna.plays.must_equal []
    end

    it "Creates a player with a total score initialized to 0" do
      @anna.total_score.must_equal 0
    end
  end

  describe "play(word) method" do
    before do
      @anna = Scrabble::Player.new("Anna")
      @annas_score = @anna.play("cat")
    end

    it "Adds input word to player's plays array" do
      @anna.plays.must_include "CAT"
      @anna.play("hat")
      @anna.play("book")

      @anna.plays.length.must_equal 3
      @anna.plays.must_include ("BOOK" && "HAT")
    end

    it "Returns the score of the played word" do
      @annas_score.must_equal 5
    end

    it "Adds the score to player's total_score" do
      @anna.total_score.must_equal 5

      @anna.play("pie")
      @anna.total_score.must_equal 10
    end

    it "Returns false if a player's already won" do
      @anna.play("fantastic")
      @anna.play("scrabble")

      @anna.play("dog").must_equal false
    end
  end

  describe "won? private method" do
    before do
      @bob = Scrabble::Player.new("Bob")
      ["shoe","tie","hat","cravat","proxy"].each do |word|
        @bob.play(word)
      end
    end

    it "Returns false is a player has 100 points or less" do
      @bob.won?.must_equal false
    end

    it "Returns true if a player has more than 100 points" do
      @bob.play("fantastic")
      @bob.won?.must_equal true

      @bob.total_score.must_be :>, 100
    end

    it "Is a private method" do
      skip
    end
  end

  describe "highest_scoring_word method" do
    it "Returns a string with the highest score in the played words array" do
      @bob = Scrabble::Player.new("Bob")
      @bob.play("cat")
      @bob.play("hat")
      @bob.play("fantastic")
      @bob.play("book")

      @bob.highest_scoring_word.must_equal "FANTASTIC"


    end
  end


# TODO `#won?`: If the player has over 100 points, returns `true`, otherwise returns `false`
    # TODO  This should be a private method

# TODO  `#highest_scoring_word`: Returns the highest scoring played word

# TODO `#highest_word_score`: Returns the `highest_scoring_word` score

end
