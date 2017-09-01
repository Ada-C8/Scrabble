require_relative 'spec_helper'

describe "dictionary" do
  before do
    @dictionary = Scrabble::Dictionary.new
  end

  describe "initialize" do
    it "must be instance of Dictionary class" do
      @dictionary.must_be_instance_of Scrabble::Dictionary
    end

    it "must respond to check word" do
      @dictionary.must_respond_to :check_word
    end
  end

  describe "check_word" do
    it "will return true if word is in list" do
      @dictionary.check_word("apple").must_equal true
    end

    it "will return false if word is not in list" do
      @dictionary.check_word("zzzzzzz").must_equal false
    end

    it "will return true if word is entered as upcase" do
      @dictionary.check_word("Apple").must_equal true
    end
  end
end
