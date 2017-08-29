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
        # nested array with word and its cooresponding score
        scores_array << [word, score(word)]
      end

      higest_score_word = scores_array.max_by { |word| word[1] }[0]
      return higest_score_word
    end

    def self.tie(words_and_scores)
      # iterate over nested array and return words with highest score
      # compare words by length
      # return word with shortest length
      max_score = words_and_scores.max_by{|a| a[1]}[1]
      top_scoring_words = words_and_scores.select{|a| a[1] == max_score}.map(&:first)
      tie_word = top_scoring_words[0]

      top_scoring_words.each do |word|
        if word.length == 7
          return word
        elsif word.length < tie_word.length
          tie_word = word
        end
      end
      return tie_word
    end
  end # end of ScoringClass
end

# ties
# It’s better to use fewer tiles, in the case of a tie, prefer the word with the fewest letters.
# There is a bonus for words that are seven letters. If the top score is tied between multiple words and one used all seven letters, choose the one with seven letters over the one with fewer tiles.
# If the there are multiple words that are the same score and same length, pick the first one in the supplied list.
