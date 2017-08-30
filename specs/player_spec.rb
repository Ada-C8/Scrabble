require_relative 'spec_helper'

describe "Player Class" do
  describe "initializing new Player" do
    it "Should be instance of a new player" do
      input_name = "Marisa"
      output = Scrabble::Player.new(input_name)
      output.must_be_instance_of Scrabble::Player
      # Scrabble::Player.new("Marisa").must_be_instance_of Scrabble::Player
    end

    it "Player should have name attribute" do
      input_name = "Guille"
      expected_output = "Guille"
      output_player = Scrabble::Player.new(input_name)

      output_player.must_respond_to :name
      output = output_player.name

      output.must_equal expected_output
    end

  end

  describe "Player.plays" do
    it "should respond to plays" do
      test_player = Scrabble::Player.new("Guille")
      test_player.must_respond_to :plays
    end
    it "should be an array" do
      test_player = Scrabble::Player.new("Marisa")
      output = test_player.plays
      output.must_be_instance_of Array
    end
    it "should not be empty after a play" do
      test_player = Scrabble::Player.new("Marisa")
      test_player.play("Flo")
      output = test_player.plays
      (output.empty?).must_equal false
    end

  end

  describe "Player.play(input_word)" do
    it "should respond to play" do
      test_player = Scrabble::Player.new("Guille")
      test_player.must_respond_to :play
    end
    it "should return false if player won" do
      test_player = Scrabble::Player.new("Guillermina")
      # TODO: make player get 100points
      test_player.won? = true
      output = test_player.play("dog")
      expected_output = false
      output.must_equal expected_output
    end
    it "should return score of word" do
      test_player = Scrabble::Player.new("Guille")
      output = test_player.play("aaa")
      expected_output = 3
      output.must_equal expected_output
    end
  end
  #
  # Describe "Player.total_score" do
  #
  # end
  #
  # Describe "Player.won?" do
  #
  # end
  #
  # Describe "Player.highest_scoring_word" do
  #
  # end
  #
  # Describe "Player.highest_word_score" do
  #
  # end

end
