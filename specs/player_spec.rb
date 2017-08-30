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

    end
    it "return an array" do

    end
  end
end

# SET UP VARIABLES
# CALL THE METHOD BEING TESTED
# CHECK RESULT OF THAT METHOD
