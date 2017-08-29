module Scrabble
  class Scoring
    SCORE_HASH = {

      %w(A E I O U L N R S T) => 1,
      %w(D G) => 2,
      %w(B C M P) => 3,
      %w(F H V W Y) => 4,
      %w(K) => 5,
      %w(J X) => 8,
      %w(Q Z) => 10
    }

    def self.score(word)
      if word.class != String
        raise ArgumentError.new "Input must be a String class."
      else
        total_score = 0
        word.upcase.each_char do |letter|
          SCORE_HASH.keys.each do |arr|
            if arr.include? letter
              total_score += SCORE_HASH[arr]
            end
          end
        end
      end
      return total_score
    end
  end
end
