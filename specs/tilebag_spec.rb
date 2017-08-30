require_relative 'spec_helper'

describe 'TileBag' do
  before do
    @test_bag = Scrabble::TileBag.new
    @tilebag = Scrabble::TileBag
  end

  describe 'TILES_COUNT' do
    it 'creates a Hash of total tiles' do
      @tilebag::TILES_COUNT.must_be_kind_of Hash
    end

    it 'counts total tiles of each letter in TILES_COUNT' do
      @tilebag::TILES_COUNT['A'].must_equal 9
    end
  end

  describe 'initialize' do
    it 'has instance variable @bag which is an array' do
      @test_bag.bag.must_be_kind_of Array
    end

    it 'generates @bag array with correct number of each tile' do
      @test_bag.bag.length.must_equal 98
      @test_bag.bag.must_include 'A'
      @test_bag.bag.must_include 'Z'
    end
  end

  describe 'draw_tiles' do
    it 'draws 7 tiles' do
      @test_bag.draw_tiles(7)
      @test_bag.bag.length.must_equal 91
    end

    it 'draws random tiles' do
      tiles_1 = @test_bag.draw_tiles(7)
      tiles_2 = @test_bag.draw_tiles(7)
      tiles_1.must_not_equal tiles_2
    end

    xit 'does not draw more tiles than exist' do
      @test_bag.draw_tiles(99)
    end
  end

  describe 'tiles_remaining' do
    it 'returns the number of tiles remaining in the bag' do
      @test_bag.tiles_remaining.must_equal 98
    end
  end
end
