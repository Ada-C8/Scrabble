require_relative 'spec_helper.rb'

describe "Dictionary class" do

  it "Can be initialized" do
    Scrabble::Dictionary.new.must_be_instance_of Scrabble::Dictionary
  end

  it "Fills an array with words from text files" do
    Scrabble::Dictionary.new.dictionary_book.must_be_instance_of Array
  end


end
