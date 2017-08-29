module Scrabble
  class Scoring

    def self.score(word)
      letter_values = {
        ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T']=> 1,
        ['D', 'G'] =>	2,
        ['B', 'C', 'M', 'P'] =>	3,
        ['F', 'H', 'V', 'W', 'Y'] =>	4,
        ['K'] =>	5,
        ['J', 'X'] =>	8,
        ['Q', 'Z'] => 10
      }

      word = word.upcase.split("")

      total = 0
      word.each do |letter|
        letter_values.each do |letters, points|
          if letters.include?(letter)
            total += points
          end
        end
      end

      if word.length == 7
        total += 50
        # puts "great job, 50 extra points to Ravenclaw!"
      end
      return total
    end

    def self.highest_scoring_word(words)
      words.sort_by! {|word| Scrabble::Scoring.score(word)}
      return words[-1]
    end


  end # end of class
end # end of module
