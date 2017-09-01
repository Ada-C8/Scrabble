require_relative 'spec_helper'

describe "dictionary" do

  describe "initialize" do

    before do
      @dictionary = Scrabble::dictionary.new
    end

    it "must be an array" do
      @dictionary.must_be_kind_of Array
    end

    it "elements in array must be strings" do
      50.times do
        @dictionary[0..@dictionary.length].must_be_kind_of String
      end
    end
  end

  describe "check_word" do
    it "will return an error message if word is not in the dictionary" do
      proc {word.check_word("KJKLJLK")}.must raise ArgumentError
    end
  end

end
