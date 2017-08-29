require_relative 'spec_helper'

describe "Player" do
  before do
    @player = Scrabble::Player.new("Mimi")
  end

  describe 'initialize' do
    it "assigns parameter to @name variable" do
      @player.name.must_equal "Mimi"
    end

    it "creates an empty array called @plays" do
      @player.plays.must_equal []
    end
  end

end
