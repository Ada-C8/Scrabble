require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'
require_relative '../lib/scoring'

describe "Scoring" do
 before do
  @game = Scoring.new
end
describe "initialize" do
  it "should create a new instance of Scrabble" do
   @game.must_be_instance_of Scoring
 end
end
describe "scoring" do
  it "should check the value of 1 tile" do
   Scoring.score("A").must_equal 1
 end
 it "should check the value of 2 tiles" do
   Scoring.score("WE").must_equal 5
 end
 it "should add 50 bonus points to 7 letter word" do
  Scoring.score("quizzed").must_equal 85
end

end
end #end of scoring describe

