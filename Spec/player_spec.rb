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
    it "calculates the number of plays" do
      roy = Scrabble::Player.new("Roy")
      roy.plays.must_equal []
      roy.draw_tiles(Scrabble::TileBag.new)
      roy.play(roy.tiles[0] + roy.tiles[1]+ roy.tiles[2])
      roy.plays.length.must_equal 1
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

    # describe "Remove used tiles"
    # #it "takes outs used tiles" from @tiles
    # #it doesn't take out tiles that were not used
    # #if given nothing it takes out nothing
    # #if given too many tiles it raises an error? returns []?
    # #end


  end

  describe "remove_tiles" do
    it "should return a different tile array than the original with the correct number of elements" do
      larry = Scrabble::Player.new("Larry")
      larry.draw_tiles(Scrabble::TileBag.new)

      before_remove = larry.tiles.dup
      larry.remove_tiles(larry.tiles[0]+larry.tiles[1])
      after_remove = larry.tiles

      after_remove.wont_equal before_remove
      after_remove.length.must_equal 5
      (before_remove.length - after_remove.length).must_equal 2
      after_remove.must_equal before_remove[2..6]
    end
    it "should remove only one of duplicate letters" do
      test = 0
      while test == 0

        larry = Scrabble::Player.new("Larry")
        larry.draw_tiles(Scrabble::TileBag.new)
        drawn_tiles = larry.tiles

        repeated_tiles = drawn_tiles.detect{ |e| drawn_tiles.count(e) > 1 }
        if repeated_tiles != nil

          before_remove = larry.tiles.dup
          larry.remove_tiles(repeated_tiles[0])
          after_remove = larry.tiles
          after_remove.length.must_equal 6
          test += 1
        end
      end
    end

    describe "word_uses_tiles" do

      it "takes in a string as an argument" do
        mary = Scrabble::Player.new("Mary")
        mary.draw_tiles(Scrabble::TileBag.new)
        word = 3
        proc{mary.word_uses_tiles?(word)}.must_raise NoMethodError
        word = "elephantitis"
        mary.word_uses_tiles?(word).must_equal false
        mary.word_uses_tiles?(mary.tiles[0]+mary.tiles[1]+mary.tiles[2]).must_equal true
      end
    end

  end #remove_tiles

  describe "word_uses_tiles" do


  end
end # end player

# describe "can get highest scoring word" do
#   words = ["looking", "pizza", "macaroni", "leech", "sniff"]
#   roy = Scrabble::Player.new("Roy")
#   words.each do |word|
#     roy.play(word)
#   end
#   roy.highest_score_from.must_equal "looking"
# end
