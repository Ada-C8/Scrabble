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

      letters_only = /^[a-zA-Z]{1,7}$/
      if !letters_only.match(word)
        raise ArgumentError.new("Only letter characters are accepted. Your word must be between 1 and 7 letters.")
      end

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
      end
      return total
    end

    def self.highest_scoring_word(words)

      scores = words.map {|word| Scrabble::Scoring.score(word)}
      word_scores = Hash[words.zip(scores)]

      word_scores = word_scores.sort_by {|word, score| score}.reverse
      max_score = word_scores[0][1]

      tie_words = []
      word_scores.each do |word, score|
        if score == max_score
          tie_words << word
        end
      end

      tie_words.sort_by!{|word| word.length}
      tie_words.each do |word|
        if word.length == 7
          return word
        end
      end

      if tie_words[0].to_s.length == tie_words[1].to_s.length
        overlap = tie_words & words
        return overlap[-1]
      else
        return tie_words[0]
      end
    end


  end # end of class
end # end of module
