

module Scrabble
  class ScoringClass
    attr_reader :letter

    def initialize
      @letter = letter
    end

    def self.score(word)
      score_arr = []
      letters = word.downcase.split('', word.length)
      letters.each do |letter|
        case letter
        when "a", "e", "i", "o", "u", "l", "n", "r", "s", "t"
           score_arr << 1
        when "d", "g"
          score_arr << 2
        when "b", "c", "m", "p"
          score_arr << 3
        when "f", "h", "v", "w", "y"
          score_arr << 4
        when "j", "x"
          score_arr << 8
        when "k"
          score_arr << 5
        when "q", "z"
          score_arr << 10
        end #end case
      end #end letters loop
      sum = score_arr.inject(:+)
      return sum
    end #end self.score
  end
end
