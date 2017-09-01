require_relative 'spec_helper'

describe "Dictionary" do
  it "Can create a Dictionary hash with first letter as key and values as arrays of words beginning with key" do
    dict = Scrabble::Dictionary.new

    dict.must_be_instance_of Dictionary
    dict.dictionary_hash.must_be_kind_of Hash

  end
end
