require 'pry'
module Scrabble

  class Scoring
    def initialize

    end

    def self.score_letter(letter)
      case letter
      when 'A', 'E', 'I','O','U','L','N','R','S','T'
        return 1
      when 'D', 'G'
        return 2
      when 'B', 'C', 'M', 'P'
        return 3
      when 'F', 'H', 'V', 'W', 'Y'
        return 4
      when 'K'
        return 5
      when 'J', 'X'
        return 8
      when 'Q', 'Z'
        return 10
      end
    end

    def self.score(word)
      total = 0
      word.upcase.split('').each do |let|
        total += score_letter(let)
      end
      if word.length == 7
        total += 50
      end
      return total
    end

    def self.highest_score_from(words)
      # # using variable replace
      # highest_score = words_arr[0]
      # # tie = []
      # words_arr.each do |word|
      #   if score(word) > score(highest_score)
      #     highest_score = word
      #   # elsif score(word) == score(highest_score)
      #     # tie << word
      #     # tie << highest_score
      #   end
      # end
      # return highest_score.upcase

      # using enumerable
      # this line works by itself for not ties.
      # highest_scoring_word = words.max_by { |word| score(word)}

      scores_hash = {}
      words.each do |word|
        scores_hash[word] = score(word)
      end


      highest_score = scores_hash.values.max
      highest_scoring_words = scores_hash.select { |k, v| v == highest_score }.keys
      # binding.pry
      if highest_scoring_words.length == 1
        winning_word = highest_scoring_words[0].upcase
        return winning_word
      else
        winning_word = highest_scoring_words.min_by { |word| word.length}
        return winning_word.upcase
      end

      # this is logic for determining ties
      # binding.pry
      # if tie
      #   if
      #     w1 = 7 letters
      #     w1 wins
      #   end
      #   shortest word wins
      # end

      # # using .zip method
      # scores = []
      # words.each do |word|
      #   scores << score(word)
      # end
      #
      # highest_score = scores.zip(words)
      #
      # highest_scoring_word = highest_score[1].upcase

      # return highest_scoring_word.upcase
    end

  end

end
# Scrabble::Scoring.highest_score_from(["this", "that", "queasy"]).must_equal "queasy"
# Scrabble::Scoring.highest_score_from(["gp", "dart", "dat" ])
