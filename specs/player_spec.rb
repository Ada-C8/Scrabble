require 'minitest/autorun'
require 'minitest/reporters'
# require 'minitest/skipra_dsl'
require_relative '../lib/scoring.rb'
require_relative '../lib/player.rb'

describe "Class player" do
  describe "Initialize" do
    it "Return to name" do
      Scrabble::Player.must_respond_to :name
    end
  end#describe initialize
end #describe class player
