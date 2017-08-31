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

  describe "Checks highest_word_score method" do
    it "returns the highest score from an array" do
      patty = Scrabble::Player.new("Patty")
      patty.play("tomato")
      patty.play("mayonnaise")
      patty.play("pickles")
      patty.highest_word_score.must_equal 65
    end
  end

  describe "Checks highest_scoring_word method" do
    it "checks the highest scoring word from an array" do
      patty = Scrabble::Player.new("Patty")
      patty.play("tomato")
      patty.play("mayonnaise")
      patty.play("pickzzz")
      patty.highest_scoring_word.must_equal "pickzzz"
    end
  end

  describe "won? method" do
    it "doesn't add to the score if total score is more than 99" do
      patty = Scrabble::Player.new("Patty")
      patty.play("tomato")
      patty.play("mayonnaise")
      patty.play("pickzzz")
      patty.play("bread")
      patty.plays.length.must_equal 3
    end
    it "returns the total score" do
      patty = Scrabble::Player.new("Patty")
      patty.play("tomato")
      patty.play("mayonnaise")
      patty.play("pickzzz") #this reaches 115
      patty.play("bread") #this score isn't added
      patty.total_score.must_equal 115
    end
  end

  describe "Checks won? method" do
    it "Exists" do
      # can't test private method since you can't access it
    end
  end
end
