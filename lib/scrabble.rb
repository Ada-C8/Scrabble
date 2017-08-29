require 'pry'

module Scrabble
  class Scoring

    # attr_reader :num
    def initialize
      # @num = 0
    end #initialize

    LETTER_VALUES = {
      'a' => 1,
      'b' => 3,
      'c' => 3,
      'd' => 2,
      'e' => 1,
      'f' => 4,
      'g' => 2,
      'h' => 4,
      'i' => 1,
      'j' => 8,
      'k' => 5,
      'l' => 1,
      'm' => 3,
      'n' => 1,
      'o' => 1,
      'p' => 3,
      'q' => 10,
      'r' => 1,
      's' => 1,
      't' => 1,
      'u' => 1,
      'v' => 4,
      'w' => 4,
      'x' => 8,
      'y' => 4,
      'z' => 10
    }
    # later in code we should ensure that we only pass out 7 tiles

    #added in check to ensure must be string
    def self.score(word)
      raise ArgumentError.new("input must be string") if word.class != String

      num = 0
      word.chars.each do |char|
        num += LETTER_VALUES[char.downcase]
      end
      num += 50 if word.length == 7
        return num
    end  # .each do loop

# note to rebecca:
# could we possibly use .map, .select and .max to do this more concisely?
    def self.highest_score_from(array_of_words)
      max_score = 0
      max_word = ""

      array_of_words.each do |word|
        if  self.score(word) == max_score
          if word.length != 7 || max_word.length != 7
            if word.length == 7
              max_word = word
              max_score = self.score(word)
            end
          elsif word.length < max_word.length
            max_word = word
            max_score = self.score(word)
            # return max_word.downcase
          end
        elsif self.score(word) > max_score
          max_score = self.score(word)
          max_word = word
        end # if conditional
      end # do loop
      return max_word.downcase
    end # self.highest_score_from

  end #scoring
end #module
