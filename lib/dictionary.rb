# require_relative 'dictionary.txt'

module Scrabble

  class Dictionary
    attr_reader :dictionary_array

    def initialize
      @dictionary_array = []
    end

    def dictionary_book
      file = File.open("dictionary.txt", "r")
      file.each do |line|
        @dictionary_array.push(line.chomp.upcase)
      end
      return @dictionary_array
    end

  end #module method

end #module Scrabble
