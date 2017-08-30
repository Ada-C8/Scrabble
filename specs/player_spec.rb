require_relative 'spec_helper'


describe 'Scrabble' do
  describe 'Player' do
    before do
      @player = Scrabble::Player.new("Ada")
    end
    # describe "initialize" do
    it "requires a name" do
      @player.name.must_equal "Ada"

    end
    # end

    it "play method shovels words into plays array" do
      @player.play("word").must_include "word"
    end

    it "if total_score has over 100 points, they win" do
      @player.play("zzzzzzz")
      @player.won?.must_equal true
    end

    it "doesn't win if less than 100" do
      @player.play("zzzz")
      @player.won?.must_equal false
    end

    it "returns highest scoring word" do
      # @player.play("zzzzzx")
      @player.play("z")
      @player.play("laurend")
      @player.play("cat")
      @player.play("bat")
      @player.highest_scoring_word.must_equal "laurend"

    end
  end
end
