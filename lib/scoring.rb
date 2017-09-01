module Scrabble
  class ScoringClass
    attr_reader :letter

    # def initialize
    # end

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

    def self.highest_score_from(array_of_words)
      scores_array = []
      array_of_words.each do |word|
        # nested array with word and its cooresponding score ex. ["dog",5]
        scores_array << [word, score(word)]
      end
      # returns highest scoring word
      return tie(scores_array)
    end

    def self.tie(words_and_scores)
      # words_and_scores is scores_array aka nested array of [["word",score],["word",score]]
      # looks through words_and_scores array and stores the max score in max_score variable
      max_score = words_and_scores.max_by{|a| a[1]}[1]

      # pulls the top scoring word or words and stores them in array variable
      top_scoring_words = words_and_scores.select{|a| a[1] == max_score}.map(&:first)

      # takes the first word from top_scoring_words which we will use as a starting point for comparing the length of words in the loop below
      tie_word = top_scoring_words[0]

      # compares top_scoring_words for length. A seven letter word wins the tie breaker and is returned immediately. Otherwise it compares words and stores the smallest word in varible tie_word. At the end of the loop we will be left with the top scoring word with the smallest length.
      top_scoring_words.each do |word|
        if word.length == 7
          return word # tie breaking word if length = 7
        elsif word.length < tie_word.length
          tie_word = word
        end
      end
      return tie_word # top scoring word with the smallest length
    end
  end # end of ScoringClass
end
