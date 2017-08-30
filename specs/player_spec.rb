require_relative 'spec_helper'

describe 'Scrabble' do
  describe 'Player' do
    it "requires a name" do
      player = Scrabble::Player.new("Ada")
      player.name.must_equal "Ada"
    end
  end
end
