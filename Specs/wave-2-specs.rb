require_relative '../lib/Player'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require 'pry'

describe 'Player' do

  describe "initialize" do
    @new_player = Scrabble::Player.new("Ada")
    it "must_be_instance_of Player" do
      new_player = Scrabble::Player.new("Ada")
      new_player.must_be_instance_of Scrabble::Player
    end

    it "must respond to method name" do
      @new_player.name.must_equal "Ada"
    end
  end

    describe "plays" dog
      it "must return an Array" do
        @new_player.plays.must_be_kind_of Array
      end
###ADD MORE TESTS?
    end

    describe "plays(word)" do

      it "adds input to plays array" do
        @newplayer
      end

    end

end
