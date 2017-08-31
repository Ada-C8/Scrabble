equire 'minitest/autorun'
require 'minitest/reporters'
require_relative '../lib/player'

describe "Player" do
  describe "#initialize" do
    it "is a kind of object" do
      my_class = Scrabble::Player.new(player1)
      my_class.must_be_kind_of Scrabble:: Player
    end
  end


  #play(word): Adds the input word to the plays Array
  # Returns false if player has already won
  # Returns the score of the word
  describe " self.play(word)" do
    it "should add the input word to the plays array" do
      plays = ["BUBBLE","BOAT"]
      my_class = Scrabble::Player.new(player1)
      my_class.play("SQUEEZE")
      my_class.plays.include?("SQUEEZE").must_equal true
    end
    it "should return false if player has already won" do
      # plays = ["BUBBLE","BOAT"]
      my_class = Scrabble::Player.new(player1)
      my_class.won?.must_equal false
    end

    it "should return the score of the word" do
      # plays = ["BUBBLE","BOAT"]
      my_class = Scrabble::Player.new(player1)
      my_class.play("SQUEEZE").must_equal 25
    end
  end
end

# def self.play(word)
#   if @plays.include? word
#     return false
#   else
#   @plays << word
#   return word.Scrabble::Score.score
# end
#
# def total_score
#   total = 0
#   @plays.each do |word|
#     total += word.Scrabble::Score.score
#   end
#   return total
# end


  # describe "Order Wave 1" do
  #   describe "#initialize" do
  #     it "Takes an ID and collection of products" do
  #       id = 1337
  #       order = Grocery::Order.new(id, {})
  #
  #       order.must_respond_to :id
  #       order.id.must_equal id
  #       order.id.must_be_kind_of Integer
  #
  #       order.must_respond_to :products
  #       order.products.length.must_equal 0
  #     end
  #   end
