require_relative 'spec_helper.rb'

describe "The Player class" do

  before do
    @player = Scrabble::Player.new('Peter')
    @tilebag = Scrabble::TileBag.new
    @player.draw_tiles(@tilebag)
    @tiles = @player.tiles
    ap @tiles
  end

  describe "Initialising Player" do

    it "Player is a class of the Scrabble" do
      @player.must_be_instance_of Scrabble::Player
    end

    it "Player is a class" do
      @player.class.must_be_kind_of Class
    end

    it "hsa a readable name variable" do
      @player.name.must_equal "Peter"
    end
  end

  describe "the play method" do

    it "Responds to the play method" do
      @player.must_respond_to :play
    end

    it "stores the words that you input in the play method inside @plays" do
      word = @tiles[0] + @tiles[1] + @tiles[2]
      @player.play(word)
      @player.plays.must_equal [word.upcase]
    end

    it "increases the total_score as you add new words" do
      word = @tiles[0] + @tiles[1] + @tiles[2]
      score1 = @player.play(word)
      @player.draw_tiles(@tilebag)
      word2 = @tiles[3] + @tiles[4] + @tiles[5]
      score2 = @player.play(word2)
      ourscore = score1 + score2
      @player.total_score.must_equal ourscore
    end

    it "Returns false if the player has already won" do
      @player.draw_tiles(@tilebag)
      word = @tiles[0] + @tiles[1] + @tiles[2] + @tiles[3] + @tiles[4] + @tiles[5] + @tiles[6]
      ap "Our test word1: #{word}"
      @player.play(word)
      @player.draw_tiles(@tilebag)
      word2 = @tiles[0] + @tiles[1] + @tiles[2] + @tiles[3] + @tiles[4] + @tiles[5] + @tiles[6]
      @player.play(word2).must_equal false
    end
  end

  describe "Class attributes" do
    it "@plays is an array" do
      @player.draw_tiles(@tilebag)
      word = @tiles[0] + @tiles[1] + @tiles[2] + @tiles[3]
      @player.play(word)
      @player.draw_tiles(@tilebag)
      word2 = @tiles[0] + @tiles[1] + @tiles[2]
      @player.play(word2)
      @player.plays.must_be_kind_of Array
    end
    it "@plays must contains all of a player words" do
      @player.draw_tiles(@tilebag)
      word = @tiles[0] + @tiles[1] + @tiles[2] + @tiles[3]
      @player.play(word)
      @player.draw_tiles(@tilebag)
      word2 = @tiles[0] + @tiles[1] + @tiles[2]
      @player.play(word2)
      @player.plays.must_include word
      @player.plays.must_include word2
    end
  end

  describe "The highest_scoring_word method" do

    it "Returns the highest scoring word for the player" do
      @player.draw_tiles(@tilebag)
      word = @tiles[0] + @tiles[1] + @tiles[2] + @tiles[3] + @tiles[4] + @tiles[5] + @tiles[6]
      @player.play(word)
      @player.draw_tiles(@tilebag)
      word2 = @tiles[0] + @tiles[1] + @tiles[2]
      @player.play(word2)
      @player.highest_scoring_word.must_equal word
    end

    it "Returns  a string" do
      @player.draw_tiles(@tilebag)
      word = @tiles[0] + @tiles[1] + @tiles[2] + @tiles[3] + @tiles[4] + @tiles[5] + @tiles[6]
      @player.play(word)
      @player.highest_scoring_word.class.must_equal String
    end
  end

  describe "The highest_word_score method" do

    it "Returns the highest scoring word score" do
      @player.draw_tiles(@tilebag)
      word = @tiles[0] + @tiles[1] + @tiles[2] + @tiles[3] + @tiles[4] + @tiles[5] + @tiles[6]
      @player.play(word)
      @player.highest_word_score.must_equal Scrabble::Scoring.score(word)
    end
  end

  describe "The tile method" do
    it "Tile should be an array" do
      @player.draw_tiles(Scrabble::TileBag.new)
      @player.tiles.must_be_kind_of Array
    end
    it "Tile should be an array of letters" do
      @player.draw_tiles(Scrabble::TileBag.new)
      @player.tiles[0].must_be_kind_of String
    end
  end
end
