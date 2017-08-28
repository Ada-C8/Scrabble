

module Scrabble
  class ScoringClass
    attr_reader :letter

    def initialize
      @letter = letter
    end

    def self.score(w)
      case w
      when "a", "e", "i", "o", "u", "l", "n", "r", "s", "t"
        return 1
      when "d", "g"
        return 2
      when "b", "c", "m", "p"
        return 3
      when "f", "h", "v", "w", "y"
        return 4
      when "j", "x"
        return 8
      when "k"
        return 5
      when "q", "z"
        return 10
      end


    end
  end
end
