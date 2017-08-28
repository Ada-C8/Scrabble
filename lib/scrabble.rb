module Scrabble
  class Scoring
    def initialize
    end #initialize

    LETTER_VALUES = {
      'a' => 1,
      'b' => 3,
      'c' => 3,
      'd' => 2,
      'e' => 1,
      'f' => 4,
      'g' => 2,
      'h' => 4,
      'i' => 1,
      'j' => 8,
      'k' => 5,
      'l' => 1,
      'm' => 3,
      'n' => 1,
      'o' => 1,
      'p' => 3,
      'q' => 10,
      'r' => 1,
      's' => 1,
      't' => 1,
      'u' => 1,
      'v' => 4,
      'w' => 4,
      'x' => 8,
      'y' => 4,
      'z' => 10
    }
    # later in code we should ensure that we only pass out 7 tiles


    def self.score(word)
      num = 0
      word.chars.each do |char|
        num += LETTER_VALUES[char.downcase]
      end
      if word.length == 7
        # num = num + 50
        return num + 50
      else
        return num
      end # if conditional
    end  # .each do loop

  end #scoring
end #module
