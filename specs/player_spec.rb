require_relative 'spec_helper'

describe "Player" do

  describe "initialize method" do
    it "Is a Player object" do
      test_ob = Scrabble::Player.new("name")
      test_ob.must_be_instance_of Scrabble::Player
    end

    it "Can be instantiated with one argument" do
      test_ob = Scrabble::Player.new("name")
      test_ob.name.must_equal "name"
    end

    it "Has an instance variable @plays, which is an array" do
      test_ob = Scrabble::Player.new("name")
      test_ob.plays.must_be_instance_of Array
    end

    it "Has an instrance variable @total_score, which is an Integer" do
      test_ob = Scrabble::Player.new("name")
      test_ob.total_score.must_be_instance_of Integer
    end

    it "Has an instrance variable @total_score, that returns the current total score" do
      test_ob = Scrabble::Player.new("name")
      test_ob.play("aa")
      test_ob.total_score.must_equal 2
    end

  end#initialize

  describe "play method" do
    it "Can be called" do
      test_ob = Scrabble::Player.new("name")
      test_ob.must_respond_to :play
    end

    it "Raises an ArgumentError if input is not a String" do
        test_ob = Scrabble::Player.new("name")
        proc { test_ob.play(123)}.must_raise ArgumentError
    end

    it "Adds the word input to the @plays instance variable" do
      test_ob = Scrabble::Player.new("name")
      test_ob.play("word")
      test_ob.plays.must_equal ["word"]
    end

    it "Returns false if player has already won" do
      test_ob = Scrabble::Player.new("name")
      test_ob.play("zzzzzzz")
      test_ob.play("word").must_equal false
    end

    it "returns score of word" do
      word = "A"
      player_instance = Scrabble::Player.new("name")
      player_instance.play(word).must_equal 1
    end
  end#play method

describe "highest_scoring_word method" do
  it "Can be called" do
    test_ob = Scrabble::Player.new("name")
    test_ob.must_respond_to :highest_scoring_word
  end

  it "Returns the highest scoring played word" do
    test_ob = Scrabble::Player.new("name")
    test_words = ["jazz", "as", "bad"]
    test_words.each do |word|
      test_ob.play(word)
    end
    test_ob.highest_scoring_word.must_equal "jazz"
  end

end

describe "highest_word_score method" do
  it "Can be called" do
    test_ob = Scrabble::Player.new("name")
      test_ob.must_respond_to :highest_word_score
  end

  it "Returns the highest_scoring_word score" do
    test_ob = Scrabble::Player.new("name")
    test_words = ["jazz", "as", "bad"]
    test_words.each do |word|
      test_ob.play(word)
    end
    test_ob.highest_word_score.must_equal 29
  end
end

end#Player


# - `#name`: returns the value of the `@name` instance variable
# - `#plays`: returns an Array of the words played by the player
# - `#play(word)`: Adds the input word to the `plays` Array
#     - Returns `false` if player has already won
#     - Returns the score of the `word`
# - `#total_score`: Returns the sum of scores of played words
# - `#won?`: If the player has over 100 points, returns `true`, otherwise returns `false`
#     - This should be a private method
# - `#highest_scoring_word`: Returns the highest scoring played word
# - `#highest_word_score`: Returns the `highest_scoring_word` score
#
# For example,
# ```ruby
# player = Scrabble::Player.new("Ada")
# player.name #=> "Ada"
# ```
