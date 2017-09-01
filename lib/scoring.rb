require 'pry'
require 'awesome_print'

module Scrabble
  class Scoring



    LETTER_VALUES = {
      A: 1,
      B: 3,
      C: 3,
      D: 2,
      E: 1,
      F: 4,
      G: 2,
      H: 4,
      I: 1,
      J: 8,
      K: 5,
      L: 1,
      M: 3,
      N: 1,
      O: 1,
      P: 3,
      Q: 10,
      R: 1,
      S: 1,
      T: 1,
      U: 1,
      V: 4,
      W: 4,
      X: 8,
      Y: 4,
      Z: 10
    }


    def self.score(word)
      raise ArgumentError.new("Word argument must be a string") if !word.is_a? String
      word = word.upcase.split("")
      score = word.map {|letter| LETTER_VALUES[letter.to_sym]}.reduce(:+)
      word.length == 7 ? score += 50 : score
    end

    def self.highest_score_from(array_of_words)
      raise ArgumentError.new("Input must be an Array") if !array_of_words.is_a? Array
      raise ArgumentError.new("elements inside array must be strings") if !array_of_words.all? { |word| word.is_a? String}
      word_score_hash = {}
      array_of_words.each do |word|
        word_score_hash[word] = self.score(word)
      end

      words_with_length_7 = array_of_words.find_all{ |word| word.length == 7}

      # puts words_with_length_7

      # max_word_pair = word_score_hash.max_by{ |word, score| score }
      # max_word_pair[0]
      #
      # shortest_length_pair = word_score_hash.min_by{ |word, score| word.length }
      # shortest_length_pair[0]


    end

  end #end of class

end #end of module

# array_of_words = [ "animals", "frog", "zoo", "quizzes"]
#
# ap Scrabble::Scoring.highest_score_from(array_of_words)
