module Scrabble
  class Scoring
    attr_reader :values

    VALUES = {
      1 => ["A", "E", "I", "O", "L", "N", "R", "S", "T"],
      2 => ["D", "G"],
      3 => ["B", "C", "M", "P"],
      4 => ["F", "H", "V", "W", "Y"],
      5 => ["K"],
      8 => ["J", "X"],
      10 => ["Q", "Z"]
    }

    def self.score(input_word)
      if !(input_word.to_s.match(/[a-zA-Z]/))
        raise ArgumentError.new "Invalid character in word"
      end

      if input_word.length == 7
        score = 50
      else
        score = 0
      end

      input_letters = input_word.split("")
      input_letters.each do |letter|
        # if !(letter.match(/[a-zA-Z]/))
        #   raise ArgumentError.new "Invalid character in word"
        if VALUES[1].include? letter.upcase
          score += 1
        elsif VALUES[2].include? letter.upcase
          score += 2
        elsif VALUES[3].include? letter.upcase
          score += 3
        elsif VALUES[4].include? letter.upcase
          score += 4
        elsif VALUES[5].include? letter.upcase
          score += 5
        elsif VALUES[8].include? letter.upcase
          score += 8
        elsif VALUES[10].include? letter.upcase
          score += 10
        else
          raise ArgumentError.new "Invalid letter in word"
        end
      end
      return score
    end

    def self.highest_score_from(input_array)
      word_scores = []

      input_array.each do |word|

        word_scores << self.score(word)

      end
      highest_score = word_scores.sort![-1]
      highest_scoring_words = []
      input_array.each do |word|
        if self.score(word) == highest_score
          highest_scoring_words << word
        end
      end
      if highest_scoring_words.length == 1
        return highest_scoring_words[0]
      elsif highest_scoring_words.length > 1
        self.tie_breaker(highest_scoring_words)
      else
        raise ArgumentError.new "There are no words here"
      end
    end

    def self.tie_breaker(tie_array)
      seven_letters = tie_array.select{|word| word.length == 7}
      if seven_letters.length >= 1
        return seven_letters[0] # => winning word, only 1 word with 7 letters
      end
      shortest_word = tie_array.inject do |memo, word|
        memo.length <= word.length ? memo : word
      end
      if shortest_word.length >= 1
        return shortest_word # => winning word
      else
        raise ArgumentError.new "There are no tied words here"
      end
    end # => end of tie breaker


  end#end of scoring
end # end of module
