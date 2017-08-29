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
  end



#TODO 11 tests!



# TODO `#play(word)`: Adds the input word to the `plays` Array
    # TODO Returns `false` if player has already won
    # TODO Returns the score of the `word`

# TODO `#total_score`: Returns the sum of scores of played words

# TODO `#won?`: If the player has over 100 points, returns `true`, otherwise returns `false`
    # TODO  This should be a private method

# TODO  `#highest_scoring_word`: Returns the highest scoring played word

# TODO `#highest_word_score`: Returns the `highest_scoring_word` score

end
