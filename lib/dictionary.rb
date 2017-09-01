require 'csv'

module Scrabble

  class Dictionary
    attr_reader :all_words

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
      @all_words = self.import(SCRABBLE_DICT)
    end

    def is_word?(word)
      # remove any leading or trailing whitespace and make downcase
      word.strip!
      word.downcase!

      # check for empty string
      return false if word.length < 1

      letter1 = word[0]

      # get all words beginning with first letter from dict
      words_beginning_with_letter1 = @all_words[letter1.to_sym]

      # use binary search to search for word in the array
      low = 0
      high = words_beginning_with_letter1.length - 1

      while low <= high
        mid = (low + high) / 2

        if word == words_beginning_with_letter1[mid]
          return true
        # search left half
        elsif word < words_beginning_with_letter1[mid]
          high = mid - 1
        # search right half
        else
          low = mid + 1
        end
      end

      return false
    end


  end #end of Dictionary clas
end #end of module

d = Scrabble::Dictionary.new
#puts d.all_words[:a]


puts d.is_word?("azotic")
puts d.is_word?("qqrjk")
puts d.is_word?("baby")
