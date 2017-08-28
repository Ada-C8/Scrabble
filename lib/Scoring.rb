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
      raise ArgumentError.new("All words must be 7 letters or less.") if word.length > 7
      letters = word.downcase.chars
      total= 0

      letters.each do |letter|
        total += @letter_attributes[letter][:value]
      end

      total += 50 if word.length == 7

      return total
    end

    def self.highest_score_from(array_of_words)
      highest_score = ""

      array_of_words.each do |word|
        highest_score = word if self.score(word) > self.score(highest_score)
        if self.tie?(word, highest_score)
          highest_score = self.tiebreaker(word, highest_score)
        end
      end

      return highest_score

    end

    private

    def self.tie?(word1, word2)
      return self.score(word1) == self.score(word2)
    end

    def self.tiebreaker(word1, word2)
      if word1.length < word2.length
        return word1 if word2.length != 7
      else
        return word1 if word1.length == 7 && word2.length != 7
      end
      return word2
    end

  end #end class Scoring
end #end module Scrabble
