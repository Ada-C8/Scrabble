require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/player'

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
  end#initialize

  describe "play method" do
    it "Can be called" do
      test_ob = Scrabble::Player.new("name")
      test_ob.must_respond_to :play
    end
    # change this
    xit "Returns an array" do
      test_ob = Scrabble::Player.new("name")
      test_ob.play("word").must_be_instance_of Array
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
