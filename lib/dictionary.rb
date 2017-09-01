require 'csv'
module Scrabble

  class Dictionary
    attr_reader :dictionary_hash

    SCRABBLE_DICT = CSV.read('./support/dictionary.csv')

    def import(csv)
      hash = {}

      csv.each do |word_row|
        word = word_row[0]
        letter1 = word[0].to_sym

        if !hash.key?(letter1)
          hash[letter1] = [word]
        else
          hash[letter1] << word
        end
      end

      return hash
    end


    def initialize
      @dictionary_hash = self.import(SCRABBLE_DICT)
    end


  end #end of Dictionary clas
end #end of module
