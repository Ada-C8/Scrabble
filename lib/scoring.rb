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

      scores = words.group_by { |word| score(word)}
      highest_scoring_words = scores[scores.keys.max]
      lengths = highest_scoring_words.group_by { |word| word.length}
      return lengths[lengths.keys.min][0].upcase

    end
  end
end
