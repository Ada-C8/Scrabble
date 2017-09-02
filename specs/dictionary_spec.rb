require_relative 'spec_helper.rb'
require 'ruby-dictionary'
require 'awesome_print'

describe "The Dictionary class" do

  before do
       @ourdictionary = Scrabble::OurDictionary.new
  end

  describe "find method" do
    it "Returns true" do
      word = "Hello"
      @ourdictionary.find(word).must_equal true
    end

    it "Returns false" do
      word = "Arglekl"
      @ourdictionary.find(word).must_equal false
    end

  end

end
