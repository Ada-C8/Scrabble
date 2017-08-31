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

    it "Creates a player with an array of tiles (init to empty)" do
      @anna.tiles.must_be_instance_of Array
      @anna.tiles.must_equal []
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

  xdescribe "won? (private) method" do
    xit "Is a private method" do
      # Breaks when this set of tests is run, b/c private. Can test if made public
    end

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

  describe "highest_word_score method" do
    it "Returns a string with the highest score in the played words array" do
      @bob = Scrabble::Player.new("Bob")
      @bob.play("cat")
      @bob.play("hat")
      @bob.play("fantastic")
      @bob.play("book")

      @bob.highest_word_score.must_equal 64
    end
  end

  describe "draw_tiles method" do
    before do
      @edie = Scrabble::Player.new("Edie")
      @tile_bag = Scrabble::TileBag.new
    end

    it "Draws 7 tiles if Edie has no tiles" do
      @edie.draw_tiles(@tile_bag)
      @edie.tiles.length.must_equal 7
    end

    it "Draws no tiles if Edie already has 7 tiles" do
      @edie.draw_tiles(@tile_bag)
      @edie.draw_tiles(@tile_bag)
      @edie.tiles.length.must_equal 7
    end

    it "Draws 4 tiles is Edie has 3 tiles" do #reqs attr_writer in tile_bag.rb
      @edie.tiles = ["A", "B", "D"]
      @edie.draw_tiles(@tile_bag)
      @edie.tiles.length.must_equal 7
    end

    it "Draws only the number of tiles remaining in bag" do
      # if there are no tiles, draw 0, check for end_game
      @tile_bag.draw_tiles(98)
      @edie.draw_tiles(@tile_bag)
      @edie.tiles.must_equal []
      # if there are fewer tiles than 7

    end
  end


end
