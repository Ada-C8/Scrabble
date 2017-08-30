require_relative 'spec_helper'

Describe "Player Class" do

  Describe "initializing new Player" do
    it "Should be instance of a new player" do

      input_name = "Marisa"
      output = Scrabble::Player.new(input_name)
      output.must_be_instance_of Scrabble::Player

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

  Describe "Player.plays" do

  end

  Describe "Player.play(input_word)" do

  end

  Describe "Player.total_score" do

  end

  Describe "Player.won?" do

  end

  Describe "Player.highest_scoring_word" do

  end

  Describe "Player.highest_word_score" do

  end

end
