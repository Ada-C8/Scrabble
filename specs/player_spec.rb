require_relative 'spec_helper'

describe "Player class " do
  before do
    @shaunna = Scrabble::Player.new("Shaunna")
  end

  it "Player is initialized with one argument." do
    @shaunna.must_be_instance_of Scrabble::Player
  end

  it "Can read name from instance." do
    @shaunna.name.must_equal "Shaunna"
  end

  it "plays returns an Array" do
    @shaunna.plays.must_be_kind_of Array
  end

  #####Ask how to make this fail####
  # it "plays returns Array of Strings" do
  #   @shaunna.plays.each do |word|
  #     word.must_be_kind_of String
  #   end
  # end
  ######How to check this array against words played in Scoring class

end
#edge cases for correct input are in the scoring spec file in form of /^[A-Z]$/
describe "method play(word)" do
  before do
    @tanja = Scrabble::Player.new("Tanja")
  end

  it "raises an ArguentError if input is not a String" do
    proc{@tanja.play(20)}.must_raise ArgumentError
  end

  it 'raises an ArgumentError if a word has more than seven chars or less than 0' do
    proc{@tanja.play("supercalifrag")}.must_raise ArgumentError
    proc{@tanja.play("")}.must_raise ArgumentError
  end

  it 'raises an Argument Error if input word is not composed of valid letters' do
    proc{@tanja.play(15)}.must_raise ArgumentError
  end

  it "adds the input word to the plays Array" do
    before = @tanja.plays.length
    @tanja.play("code")
    after = @tanja.plays.length

    after.must_equal (before + 1)

    @tanja.plays.pop.must_equal "code"
  end
  it "returns false if player has already won" do
    @tanja.play("ZZZZZZZ")

    @tanja.play("winner").must_equal false
  end
  it "returns the score of the word" do
    @tanja.play("code").must_equal 7
  end
end


describe "total_score"do
  before do
    @chris = Scrabble::Player.new("CheezItMan")
  end
  it "returns the score of zero if the Array is empty" do
    @chris.total_score.must_equal 0
  end

  it "returns the sum when 2 words are played" do
    @chris.play("hello")
    @chris.play("goodbye")


    @chris.total_score.must_equal 72
  end
end

describe "method won?" do
  before do
    @dee = Scrabble::Player.new("Tildee")
  end
  it "returns true if score is over 100" do
    @dee.play("Waluigi")
    @dee.play("Letzzgo")
    @dee.won?.must_equal true
  end

  it "returns false for scores =< 100." do
    @dee.play("Waluigi")
    @dee.play("Letsgo")
    @dee.won?.must_equal false
  end
end

describe "method highest_scoring_word" do
  before do
    @ada = Scrabble::Player.new("Countess Lovelace")
  end

  it "returns a message if no words were played" do
    @ada.highest_scoring_word.must_equal "none, because #{@ada.name} did not play any words"
  end

  it "returns the highest scoring played word" do
    ["I", "love", "coding"].each do |word|
      @ada.play(word)
    end
    @ada.highest_scoring_word.must_equal "coding"
  end
end

describe "highest_word_score" do
  before do
    @ada = Scrabble::Player.new("Countess Lovelace")
  end

  it "returns the score of the highest scoring word"do
    ["I", "love", "coding"].each do |word|
      @ada.play(word)
    end
    @ada.highest_word_score.must_equal 10
  end
end

describe "tiles" do
  before do
    @ada = Scrabble::Player.new("Countess Lovelace")
  end

  it "tiles must be an array" do
    @ada.tiles.must_be_kind_of Array
  end
end

describe "draw_tiles(tile_bag)" do
  it "fills the tiles array to seven letters" do
    @ada = Scrabble::Player.new("Countess Lovelace")
    @ada.draw_tiles(Scrabble::TileBag.new)
    @ada.tiles.length.must_equal 7
  end

end

describe "method compare_to_tiles" do
  it "returns true if player has the necessary tiles" do
    @ada = Scrabble::Player.new("Countess Lovelace")
    @ada.draw_tiles(Scrabble::TileBag.new)
    tiles = @ada.tiles.join
    @ada.compare_to_tiles(tiles).must_equal true
  end

  it "returns false if player doesn't have necessary tiles" do
    @ada = Scrabble::Player.new("Countess Lovelace")
    @ada.draw_tiles(Scrabble::TileBag.new)
    @ada.compare_to_tiles("QQK").must_equal false
  end
end
