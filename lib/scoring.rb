module Scrabble
  class ScoringClass
    attr_reader :letter

    def initialize
      @letter = letter
    end

    def self.score(word)
      score_arr = []
      letters = word.downcase.split('', word.length)
      word_score = 0

      letters.each do |letter|
        case letter
        when "a", "e", "i", "o", "u", "l", "n", "r", "s", "t"
           score_arr << 1
        when "d", "g"
          score_arr << 2
        when "b", "c", "m", "p"
          score_arr << 3
        when "f", "h", "v", "w", "y"
          score_arr << 4
        when "j", "x"
          score_arr << 8
        when "k"
          score_arr << 5
        when "q", "z"
          score_arr << 10
        end #end case
      end #end letters loop
      word_score = score_arr.inject(:+)
      # add 50 pt bonus for 7 letter word
      if word.length >= 7
        word_score += 50
      end
      return word_score
    end #end self.score

    def self.highest_score_from_array(array_of_words)
      scores_array = []
      array_of_words.each do |word|
        # nested array with word and its cooresponding
        scores_array << [word, score(word)]
      end

      higest_score_word = scores_array.max_by { |word| word[1] }[0]
      return higest_score_word
    end

  end # end of ScoringClass
end
