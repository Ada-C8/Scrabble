require_relative 'spec_helper'

describe "Dictionary class"do
  describe "self.valid? method" do
    before do
      @real_words = ["real", "word", "examples"]
      @fake_words = ["zz", "tro", "duxz"]
    end

    it "always returns a Boolean" do
      @real_words.each do |word|
        Scrabble::Dictionary.valid?(word).must_be_instance_of TrueClass
      end
      @fake_words.each do |word|
        Scrabble::Dictionary.valid?(word).must_be_instance_of FalseClass
      end
    end

    it "returns false when the word does not exist" do
      @fake_words.each do |word|
        Scrabble::Dictionary.valid?(word).must_equal false
      end
    end

    it "returns true when the word does exist" do
      @real_words.each do |word|
        Scrabble::Dictionary.valid?(word).must_equal true
      end
    end
  end
end
