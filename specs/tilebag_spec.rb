require_relative 'spec_helper'

describe 'TileBag' do
  before do
    @tilebag = Scrabble::TileBag
  end
  describe 'initialize' do
    it 'initializes with a hash of all default tiles' do
      @tilebag::TILES.must_be_kind_of Hash
    end
  end

  describe 'draw_tiles' do
    it 'draws 7 tiles' do

    end

    it 'draws random tiles' do

    end

    it 'does not draw more tiles than exist' do

    end
  end

  describe 'tiles_remaining' do
    it 'returns the number of tiles remaining in the bag' do

    end
  end
end
