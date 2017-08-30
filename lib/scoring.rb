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
      scored_words = array_of_words.map {|word| self.score(word)}

    end

  end #end of class

end #end of module

puts
