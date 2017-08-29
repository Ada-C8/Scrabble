module Scrabble
  class Scoring

    def self.score(word)
      if word.is_a? String
        if /[\d]/.match(word) == nil
          word = word.downcase
          split_word = word.split(//)
          value = 0
          split_word.each do |letter|
            case letter
            when "a", "e", "i", "o", "u", "l", "n", "r", "s", "t"
              value += 1
            when "d", "g"
              value += 2
            when "b", "c", "m", "p"
              value += 3
            when "f", "h", "v", "w", "y"
              value += 4
            when "k"
              value += 5
            when "j", "x"
              value += 8
            when "q", "z"
              value += 10
            else
              raise ArgumentError.new("Character is a symbol or whitespace")
            end
          end
          return value
        else
          raise ArgumentError.new("Word has numbers")
        end
      else
        raise ArgumentError.new("Word is not a string")
      end
    end


    def self.highest_score_from(array_of_words)
      words_array = array_of_words
      num_array = []
      array_of_words.each do |word|
        num_array << self.score(word)
      end

      highest_score_index = num_array.each_with_index.max[1]
      return words_array[highest_score_index]
    end
  end
end
