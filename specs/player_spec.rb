require_relative 'spec_helper'

describe "PlayerClass" do
  describe "name instance variable" do
    it "Scrabble::Player responds to name" do
      # SET UP VARIABLES
      player1 = Scrabble::PlayerClass.new("Sandy")
      # CALL THE METHOD BEING TESTED
      player1.must_respond_to :name
      # CHECK RESULT OF THAT METHOD
    end
    it "returns player's name" do
      # SET UP VARIABLES
      player1 = Scrabble::PlayerClass.new("Sandy")
      # CALL THE METHOD BEING TESTED

      # CHECK RESULT OF THAT METHOD
      player1.name.must_equal "Sandy"
    end
  end
  describe "plays method" do
    it "Scrabble::Player responds to Plays" do
      # SET UP VARIABLES
      player1 = Scrabble::PlayerClass.new("Sandy")
      # CALL THE METHOD BEING TESTED

      # CHECK RESULT OF THAT METHOD
      player1.must_respond_to :plays
    end
    it "return an array" do
      player1 = Scrabble::PlayerClass.new("Sandy")
      player1.plays.must_be_kind_of Array
    end

    it "returns an array of words" do
      player1 = Scrabble::PlayerClass.new("Sandy")
      player1.plays.must_equal ["dog", "kitten", "panda"]
    end
  end
end

# SET UP VARIABLES
# CALL THE METHOD BEING TESTED
# CHECK RESULT OF THAT METHOD
