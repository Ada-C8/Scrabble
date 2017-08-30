require_relative 'spec_helper'

describe 'TileBag' do
  before do
    @tilebag = Scrabble::TileBag
  end

  describe 'initialize' do
    it 'creates a Hash of toal tiles' do
      @tilebag::TILES_COUNT.must_be_kind_of Hash
    end

    it 'counts total tiles of each letter in TILES_COUNT' do
      @tilebag::TILES_COUNT['A'].must_equal 9
    end
  end

  xdescribe 'draw_tiles' do
    it 'draws 7 tiles' do
      @tilebag.draw_tiles(7)
    end

    it 'draws random tiles' do
      @tilebag.draw_tiles(7)
      @tilebag.must_equal rand(TILES)
    end

    it 'does not draw more tiles than exist' do
      @tilebag.draw_tiles(num)
      num.must_not_be_greater_than 7
    end
  end

  describe 'tiles_remaining' do
    it 'returns the number of tiles remaining in the bag' do

    end
  end
end
