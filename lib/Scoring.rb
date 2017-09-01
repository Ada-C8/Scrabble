module Scrabble
  class Scoring
    @letter_values = [[%w{a e i o u l n r s t}, 1],
                      [%w{d g},                 2],
                      [%w{b c m p},             3],
                      [%w{f h v w y},           4],
                      [["k"],                   5],
                      [%w{j x},                 8],
                      [%w{q z},                10]
                    ]

    @letter_attributes = {}

    @letter_values.each do |array|
      array[0].each do |letter|
        @letter_attributes[letter] = {value: array[1]}
      end
    end

    def self.score(word)
      letters = word.downcase.chars
      total = letters.inject(0) { |sum, letter| sum + @letter_attributes[letter][:value] }
      total += 50 if word.length == 7
      return total
    end

    def self.highest_score_from(array_of_words)
      highest_score = array_of_words[0]
      array_of_words[1..-1].each do |word|
        highest_score = word if self.score(word) > self.score(highest_score)
        highest_score = self.tiebreaker(highest_score, word) if self.tie?(highest_score, word)
      end
      return highest_score
    end

    private

    def self.tie?(word1, word2)
      return self.score(word1) == self.score(word2)
    end

    def self.tiebreaker(word1, word2)
      # take the shorter word if neither has 7 letters
      return word2 if (word2.length < word1.length) && (word1.length != 7)
      # take the 7 letter word if the original high score didn't have 7 letters
      return word2 if (word2.length == 7) && (word1.length != 7)
      # otherwise, the original high score stands
      return word1
    end

  end #end class Scoring
end #end module Scrabble
