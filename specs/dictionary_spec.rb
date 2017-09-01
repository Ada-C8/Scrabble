require_relative 'spec_helper.rb'

describe "The Dictionary class" do


  it "Can be initialized" do
    word = "Hello"
    dictionary = Scrabble::Dictionary.new(word)
    dictionary.must_be_instance_of Scrabble::Dictionary
  end

  it "Returns true if a word is in the dictionary" do

  end

end
