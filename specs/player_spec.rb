require_relative 'spec_helper'

describe 'Player' do
  before do
    @player = Scrabble::Player.new('Mimi')
  end

  describe 'initialize' do
    it 'assigns parameter to @name variable' do
      @player.name.must_equal 'Mimi'
    end

    it 'will convert everything passed as name into a String' do
      @player = Scrabble::Player.new(100)
      @player.name.must_be_kind_of String

      @player = Scrabble::Player.new(false)
      @player.name.must_be_kind_of String
    end

    it 'creates an empty array called @plays' do
      @player.plays.must_equal []
    end

    it 'creates an empty array called @tiles' do
      @player.tiles.must_equal []
    end
  end

  describe 'play(word)' do
    it 'adds the input word in the plays Array' do
      @player.play('jazzily')
      @player.plays.must_include 'jazzily'
    end

    it 'returns false if the player has already won' do
      @player.play('jazzily') # score => 85
      @player.play('jazzily') # score => 170

      @player.play('jazzily').must_equal false
    end

    it 'returns the score of the word' do
      @player.play('jazzily').must_equal 85
    end
  end

  describe 'total_score' do
    it 'returns the sum of scores of played words' do
      @player.play('jazzily')
      @player.play('ylizzaj')
      @player.total_score.must_equal 170
    end

    it 'returns 0 if there are no words yet' do
      @player.total_score.must_equal 0
    end
  end

  describe 'highest_scoring_word' do
    it 'returns the highest scoring played word' do
      @player.play('jazzily')
      @player.play('cup')

      @player.highest_scoring_word.must_equal 'jazzily'
    end

    it 'returns Exception if called before words are played' do
      proc { @player.highest_scoring_word }.must_raise ArgumentError
    end
  end

  describe 'highest_word_score' do
    it 'returns the numeric highest word score' do
      @player.play('jazzily')

      @player.highest_word_score.must_equal 85
    end

    it 'raises ArgumentError if called before words are played' do
      proc { @player.highest_word_score }.must_raise ArgumentError
    end
  end

  describe 'draw_tiles' do
    it 'draws tiles until player has 7' do
      bag = Scrabble::TileBag.new
      @player.draw_tiles(bag)
      @player.tiles.length.must_equal 7
    end

    it 'will not draw if the player already has 7 tiles' do
      bag = Scrabble::TileBag.new
      @player.draw_tiles(bag)
      @player.draw_tiles(bag)
      @player.tiles.length.must_equal 7
    end

    it 'removes tiles from tilebag' do
      bag = Scrabble::TileBag.new
      @player.draw_tiles(bag)
      @player.tiles.length.must_equal 7
      bag.tiles_remaining.must_equal 91
    end

    it 'raises ArgumentError if passed anything but TileBag object' do
      proc{ draw_tiles("hello") }.must_raise Exception
    end
  end

  describe 'won?' do
    it 'defaults to false' do
      @player.send(:won?).must_equal false
    end

    it "is false before player's points are over 100" do
      @player.play('jazzily')

      @player.send(:won?).must_equal false
    end

    it "becomes 'true' when player's points are over 100" do
      @player.play('jazzily')
      @player.play('ylizzaj')

      @player.send(:won?).must_equal true
    end
  end
end
