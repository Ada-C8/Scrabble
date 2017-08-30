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

      ##idea #1: using nested group_by (shortest)
      scores = words.group_by { |word| score(word)}
      highest_scoring_words = scores[scores.keys.max]
      lengths = highest_scoring_words.group_by { |word| word.length}
      return lengths[lengths.keys.min][0].upcase

      ## useless if option for zzzzzz vs. aaaaaaa
      # if lengths.keys.include?(7)
      #   return lengths[7][0].upcase
      # else
      #   return lengths[lengths.keys.min][0].upcase
      # end

      # ##idea #2: using key-value pairs of word and score
      # scores_hash = words.inject({}) { |hash, word| hash.update word => score(word) }
      #
      # #use select to find the highest_scoring_words
      # highest_scoring_words = scores_hash.select { |k, v| v == scores_hash.values.max }.keys
      #
      # #logic that returns the winning_word
      # if highest_scoring_words.length == 1
      #   winning_word = highest_scoring_words[0].upcase
      #   return winning_word
      # else
      #   winning_word = highest_scoring_words.min_by { |word| word.length}
      #   return winning_word.upcase
      # end

      ## idea #3 using a bunch of different enumerables?
      # highest_scoring_word = words.max_by { |word| score(word) }
      # highest_scoring_words = words.select do |word|
      #   score(word) == score(highest_scoring_word)
      # end
      # # lowest_to_highest = words.sort_by { |word| score(word) }
      # if highest_scoring_words.length == 1
      #   return highest_scoring_words[0].upcase
      # else
      #   lengths = highest_scoring_words.group_by { |word| word.length }
      #   if lengths.keys.include?(7)
      #     return lengths[7].upcase
      #   else
      #     return lengths[lengths.keys.min].upcase
      #   end
      # end

      ## idea #4, not sure?
      # #use .each loop to create hash
      # scores_hash = {}
      # words.each do |word|
      #   scores_hash[word] = score(word)
      # end
      #
      # if highest_scoring_words.length == 1
      #   return scores[scores.keys.max].upcase
      # else
      #   winning_word = highest_scoring_words.min_by { |word| word.length}
      #   return winning_word.upcase
      # end
    end
  end
end
