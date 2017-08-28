module Scrabble
  class Scoring
    attr_reader :values

      @values = {
        1 => ["A", "E", "I", "O", "L", "N", "R", "S", "T"],
        2 => ["D", "G"],
        3 => ["B", "C", "M", "P"],
        4 => ["F", "H", "V", "W", "Y"],
        5 => ["K"],
        8 => ["J", "X"],
        10 => ["Q", "Z"]
      }

    def self.score(input_word)
    end

  end#end of scoring
end# end of module
