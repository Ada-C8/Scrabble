require_relative 'spec_helper'

describe "Dictionary" do
  it "Must return true for valid word" do
    Scrabble::Dictionary.look_up("ACADEMY").must_equal true
  end

   it "Must return false for invalid word" do
     Scrabble::Dictionary.look_up("GRRBAGE").must_equal false
   end

   it "raises an Argument error if input word is not a String" do
     proc{Scrabble::Dictionary.look_up(123)}.must_raise ArgumentError
   end

   it "raises an ArgumentError if the input String doesn't contain only letters" do
     proc{Scrabble::Dictionary.look_up("1re3")}.must_raise ArgumentError
   end

   it "raises an ArgumentError if the String is empty" do
     proc{Scrabble::Dictionary.look_up("")}.must_raise ArgumentError
   end

   it "will return true for the first word listed in the dictionary" do
     lines = IO.readlines('./support/words.txt')
     word = lines.first
     Scrabble::Dictionary.look_up(word).must_equal true
   end

   it "will return true for the last word listed in the dictionary" do
     lines = IO.readlines('./support/words.txt')
     word = lines.last
     Scrabble::Dictionary.look_up(word).must_equal true
   end

   it "accepts lowercase input" do
       Scrabble::Dictionary.look_up("academy").must_equal true
   end
end
