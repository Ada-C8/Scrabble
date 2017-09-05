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
      @anna_tilebag = Scrabble::TileBag.new(['C', 'A', 'T'])
      @anna.draw_tiles(@anna_tilebag)
      @annas_score = @anna.play("cat")
    end

    it "Adds input word to player's plays array" do
      @anna.plays.must_include "CAT"

      hat_tiles = Scrabble::TileBag.new("HAT".split(""))
      @anna.draw_tiles(hat_tiles)
      @anna.play("hat")

      book_tiles = Scrabble::TileBag.new("BOOK".split(""))
      @anna.draw_tiles(book_tiles)
      @anna.play("book")

      @anna.plays.length.must_equal 3
      @anna.plays.must_include ("BOOK" && "HAT")
    end

    it "Returns the score of the played word" do
      @annas_score.must_equal 5
    end

    it "Adds the score to player's total_score" do
      @anna.total_score.must_equal 5

      pie_tiles = Scrabble::TileBag.new("PIE".split(""))
      @anna.draw_tiles(pie_tiles)
      @anna.play("pie")
      @anna.total_score.must_equal 10
    end

    it "Returns false if a player's already won" do
      2.times do
        test_tiles = Scrabble::TileBag.new("QUIZZES".split(""))
        @anna.draw_tiles(test_tiles)
        @anna.play("quizzes")
      end

      @anna.play("dog").must_equal false
    end

    describe "Checks if word can be played from player's tiles" do
      before do
        more_tiles = Scrabble::TileBag.new("TWO".split(""))
        @anna.draw_tiles(more_tiles)
      end

      it "Returns nil if word can't be played" do # TODO change nil to another return val for game play??
        @anna.play("THE").must_be_nil

      end

      it "Doesn't add word to player's plays array" do
        @anna.play("the")

        @anna.plays.must_include "CAT"
      end

      it "Leaves tiles in player's hand" do
        @anna.play("THE")

        @anna.tiles.sort!.must_equal ['W', 'O', 'T'].sort!
      end
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
      bob = Scrabble::Player.new("Bob")
      tiles1 = Scrabble::TileBag.new("CATBOOK".split(""))
      tiles2 = Scrabble::TileBag.new("QUIZZES".split(""))

      bob.draw_tiles(tiles1)
      bob.play("cat")
      bob.play("book")

      bob.draw_tiles(tiles2)
      bob.play("quizzes")

      bob.highest_scoring_word.must_equal "QUIZZES"
    end
  end

  describe "highest_word_score method" do
    it "Returns a string with the highest score in the played words array" do
      bob = Scrabble::Player.new("Bob")
      tiles1 = Scrabble::TileBag.new("CATBOOK".split(""))
      tiles2 = Scrabble::TileBag.new("QUIZZES".split(""))

      bob.draw_tiles(tiles1)
      bob.play("cat")
      bob.play("book")

      bob.draw_tiles(tiles2)
      bob.play("quizzes")

      bob.highest_word_score.must_equal 84
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

    it "Draws 4 tiles if Edie has 3 tiles" do #
      new_tiles = Scrabble::TileBag.new(["A", "B", "D"])
      @edie.draw_tiles(new_tiles)
      @edie.draw_tiles(@tile_bag)
      @edie.tiles.length.must_equal 7
    end

    it "Draws only tiles remaining if less than 7" do
      @tile_bag.draw_tiles(94)
      @edie.draw_tiles(@tile_bag)
      @edie.tiles.length.must_equal 4
    end

    it "Draws no tiles if tile bag is empty" do
      # if there are no tiles, draw 0, check for end_game
      @tile_bag.draw_tiles(98)
      @edie.draw_tiles(@tile_bag)
      @edie.tiles.must_equal []
      # if there are fewer tiles than 7

    end
  end


end
