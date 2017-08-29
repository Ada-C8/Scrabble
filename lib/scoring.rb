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

      scores_hash = {}
      words.each do |word|
        scores_hash[word] = score(word)
      end

      highest_scoring_words = scores_hash.select { |k, v| v == scores_hash.values.max }.keys

      if highest_scoring_words.length == 1
        winning_word = highest_scoring_words[0].upcase
        return winning_word
      else
        winning_word = highest_scoring_words.min_by { |word| word.length}
        return winning_word.upcase
      end

      # if .length == 1
      #   return scores[scores.keys.max].upcase
      # else
      #   winning_word = highest_scoring_words.min_by { |word| word.length}
      #   return winning_word.upcase
      # end

      # scores = words.group_by { |word| score(word)}
      # highest_scoring_words = scores[scores.keys.max]
      # lengths = highest_scoring_words.group_by { |word| word.length}
      # if lengths.keys.include?(7)
      #   return lengths[7]
      # else
      #   return lengths[lengths.keys.min]
      # end

      # scores_hash = words.inject({}) { |hash, word| hash.update word => score(word) }


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

    end
  end
end
