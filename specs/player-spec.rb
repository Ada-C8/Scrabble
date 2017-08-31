require_relative "spec_helper"

describe "Player class" do
  describe "initialize" do
    it "Creates an instance" do
      Scrabble::Player.new("name").must_be_kind_of Scrabble::Player
      test = Scrabble::Player.new("name")
      test.plays.must_be_instance_of Array
    end
    it "defaults @won to false" do
      nancy = Scrabble::Player.new("Nancy")
      nancy.won.must_equal false
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
    it "determines the highest scoring word from an array" do
      patty = Scrabble::Player.new("Patty")
      patty.play("tomato")
      patty.play("mayonnaise")
      patty.highest_scoring_word.must_equal "mayonnaise"
    end
    it "chooses 7-letter word if there is a tie for highest scoring word" do
      patty = Scrabble::Player.new("Patty")
      patty.play("tomato")
      patty.play("zzzzzj")
      patty.play("aeioulg")
      patty.highest_scoring_word.must_equal "aeioulg"
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
      patty.total_score.must_equal 115
      patty.play("bread") #this score isn't added
      patty.total_score.must_equal 115
    end
    it "is false if score is 99" do
      spongebob = Scrabble::Player.new("spongebob")
      spongebob.play("qqqqqqqqqja")
      spongebob.total_score.must_equal 99
      spongebob.won.must_equal false
    end
    it "is true if score is 100" do
      spongebob = Scrabble::Player.new("spongebob")
      spongebob.play("qqqqqqqqqja")
      spongebob.play("a") #adds one more point
      spongebob.total_score.must_equal 100
      spongebob.won.must_equal true
    end

  end

end
