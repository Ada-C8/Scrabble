require_relative 'spec_helper'

describe "Dictionary" do
 before do
   @dict = Scrabble::Dictionary.new
 end

  it "Can create a Dictionary hash with first letter as key and values as arrays of words beginning with key" do
    @dict.must_be_instance_of Scrabble::Dictionary
    @dict.dictionary.must_be_kind_of Hash

  end

  it "Creates a hash with 26 keys" do
    @dict.dictionary.length.must_equal 26
  end

  it "Finds the word 'azotic'" do
    @dict.is_word?("azotic").must_equal true
  end

  it "Doesn't find the word 'qqrjk'" do
    @dict.is_word?("qqrjk").must_equal false
  end

  it "Doesn't find an empty string" do
    @dict.is_word?("").must_equal false
  end

  it "Doesn't find a string with no letters (all whitespace)" do
    @dict.is_word?("  ").must_equal false
  end

end
