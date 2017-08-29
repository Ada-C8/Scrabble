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

# This one works!
 #    def self.highest_scoring_word(words)
 # +      words.sort_by! {|word| Scrabble::Scoring.score(word)}
 # +      return words[-1]
 # +    end

    def self.highest_scoring_word(words)

      words = words
      scores = words.map! {|word| Scrabble::Scoring.score(word)}
      word_scores = Hash[words.zip(scores)]
      

      # This one works!
       #    def self.highest_scoring_word(words)
       # +      words.sort_by! {|word| Scrabble::Scoring.score(word)}
       # +      return words[-1]
       # +    end

      #
      # word_scores = word_scores.sort_by {|word, score| score}
      #
      #
      #   if word_scores.value[-1] != word_scores.value[-2]
      #     return word_scores.key[-1]
      #   elsif word_scores.value[-1] == word_scores.value[-2]
      #     if word_scores.key[-1].length > word_scores.key[-2].length
      #       return word_scores.key[-2]
      #     else
      #       return word_scores.key[-1]
      #     end
      #   end



    end


  end # end of class
end # end of module
