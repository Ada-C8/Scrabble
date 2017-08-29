require_relative 'spec_helper.rb'
require_relative '../lib/scrabble-player'

describe "Scrabble:Player" do
  before do
    @averi = Scrabble::Player.new("Averi")
  end
  it "Player can initialize" do
    Scrabble::Player.new("Averi").must_be_instance_of Scrabble::Player
  end

  it "Can respond to name" do
  @averi.must_respond_to :name
  @averi.name.must_equal "Averi"
  end

  it "plays is an array" do
    @averi.plays.must_be_instance_of Array
end

  it "plays word adds a word to plays" do
    first_length = @averi.plays.length
    @averi.play("dog")
    @averi.plays.length.must_be :>, first_length
    @averi.plays.length.must_equal 1
  end

  it "plays word returns correct score" do
    @averi.play("dog").must_equal 5
  end

  it "plays returns false if have already won" do
    @averi.play("qqqqq")
    @averi.play("zzzzzz")
    @averi.play("dog").must_equal false
  end

  it "responds to won? : returns false under 100" do
    @averi.must_respond_to :won?
    @averi.won?.must_equal false
  end
  it "responds to won? : returns true over 100 points" do
    @averi.play("qqqqq")
    @averi.play("zzzzzz")
    @averi.won?.must_equal true
  end
  it "responds to won? : returns false for 99 points" do
    @averi.play("qqqqq")
    @averi.play("zzzz")
    @averi.play("xa")
    # puts @averi.total_score
    @averi.won?.must_equal false
  end
  it "responds to total_score" do

  end


end
