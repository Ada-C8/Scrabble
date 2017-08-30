require_relative 'spec_helper'


#Wave 2 specs

describe "Scrabble::Player" do

  describe "can instantiate variables" do
    it "returns a value for Scrabble::Player.name" do
      roy = Scrabble::Player.new("Roy")
      roy.name.wont_be_nil
      roy.plays.wont_be_nil
      roy.total_score.wont_be_nil
    end
  end

  describe "can play a word" do
    it "pushes the word into @plays" do

      roy = Scrabble::Player.new("Roy")
      word = "looking"
      roy.play(word)
      roy.play(word)
      roy.plays.must_be_kind_of Array
      roy.plays.must_equal ["looking", "looking"]
    end

    it "calculates the score of the played word" do
      larry = Scrabble::Player.new("Larry")
      word = "looking"
      larry.play(word)
      larry.total_score.must_equal 62
    end
    #
    # describe "can take user input word" do
    #   before do
    #
  end

  describe "can decide if won" do
    it "can find total winning score" do
      array = [ "apple", "banana", "tangelo", "grape", "xylophone"]
      larry = Scrabble::Player.new("Larry")
      array.each do |word|
        larry.play(word)
      end
      larry.total_score.must_equal 157
    end
    it "raises an argument error for calling won? on a class" do
      michelle = Scrabble::Player.new("Michelle")
      proc{michelle.won?}.must_raise NoMethodError
    end
  end

  describe "can find highest_scoring_word" do

    it "returns a string" do

      array = [ "apple", "banana", "tangelo", "grape", "xylophone"]
      larry = Scrabble::Player.new("Larry")
      array.each do |word|
        larry.play(word)
      end

      larry.highest_scoring_word.must_be_kind_of String
      larry.highest_scoring_word.must_equal "xylophone"
    end

    it "returns nil for no plays" do
      michelle = Scrabble::Player.new("Michelle")
      proc{michelle.highest_scoring_word}.must_raise ArgumentError
    end

  end

  describe "can get value of highest word score" do

    it "gives an integer of the correct value" do
      array = [ "apple", "banana", "tangelo", "grape", "xylophone"]
      larry = Scrabble::Player.new("Larry")
      array.each do |word|
        larry.play(word)
      end
      larry.highest_word_score.must_be_kind_of Integer
      larry.highest_word_score.must_equal 74
    end

  end #end player
end

# describe "can get highest scoring word" do
#   words = ["looking", "pizza", "macaroni", "leech", "sniff"]
#   roy = Scrabble::Player.new("Roy")
#   words.each do |word|
#     roy.play(word)
#   end
#   roy.highest_score_from.must_equal "looking"
# end
