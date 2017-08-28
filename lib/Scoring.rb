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
      total= 0

      letters.each do |letter|
        total += @letter_attributes[letter][:value]
      end

      return total
    end
  end
end
