require_relative "spec_helper"

describe "Player class" do
  describe "initialize" do
    it "Creates an instance" do
      Scrabble::Player.new("name").must_be_kind_of Scrabble::Player
      test = Scrabble::Player.new("name")
      test.plays.must_be_instance_of Array
    end
  end

  describe "Checks play method" do
    it "Returns the score number" do
      todd = Scrabble::Player.new("Todd")
      todd.play("banana").must_equal 8
    end
  end

  describe "Checks total_score method" do
    it "Returns the total score" do
      todd = Scrabble::Player.new("Todd")
      todd.play("banana")
      todd.play("cupcake")
      todd.total_score.must_equal 75
    end
  end

  xdescribe "Checks highest_word_score method" do
    it "Exists" do
      test = Scrabble::Player.new("name")
      test.highest_word_score.must_equal true
    end
  end

  xdescribe "Checks highest_scoring_word method" do
    it "Exists" do
      test = Scrabble::Player.new("name")
      test.highest_scoring_word.must_equal true
    end
  end

  describe "Checks won? method" do
    it "Exists" do
      # can't test private method since you can't access it
    end
  end
end
