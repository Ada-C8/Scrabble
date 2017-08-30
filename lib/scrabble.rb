module Scrabble
  class Scoring

    def self.score(word)
      if /^[a-zA-Z]+$/.match(word.to_s) != nil
        value = 0
        if word.length == 7
          value = 50
        end
        split_word = word.downcase.split(//)
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
          end
        end
        return value
      else
        raise ArgumentError.new("Word has numbers")
      end
    end

    def self.highest_score_from(array_of_words)
      num_hash = {}
      array_of_words.each do |word|
        num_hash[word] = self.score(word)
      end

      highest_score = num_hash.values.max

      tie_breaker = []
      num_hash.each do |key, value|
        if value == highest_score
          tie_breaker.push(key)
        end
      end

      tie_breaker.each do |word|
        if word.length == 7
          return word
        else
          return tie_breaker.min{|a,b| a.size <=> b.size}
        end
      end

    end
  end
end
