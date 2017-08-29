module Scrabble

  class Scoring

    def initialize

    end#Initialize

    def self.score(word)
      all_values = {
        "A" => 1,
        "B" => 3,
        "C" => 3,
        "D" => 2,
        "E" => 1,
        "F" => 4,
        "G" => 2,
        "H" => 4,
        "I" => 1,
        "J" => 8,
        "K" => 5,
        "L" => 1,
        "M" => 3,
        "N" => 1,
        "O" => 1,
        "P" => 3,
        "Q" => 10,
        "R" => 1,
        "S" => 1,
        "T" => 1,
        "U" => 1,
        "V" => 4,
        "W" => 4,
        "X" => 8,
        "Y" => 4,
        "Z" => 10,
      }
      word = word.upcase
      score = 0

      word.split('').each do |l|
        score += all_values[l]
      end

      #return score
      if word.length == 7
        return score + 50
      else
        return score
      end
    end #end self.score

    def self.highscore_from(array_of_words)
      array_of_word_scores = []
      scores = []
      array_of_words.each do |word|
        array_of_word_scores << [word, self.score(word)]
        scores << self.score(word)
      end

      max = scores.max

      all_max = array_of_word_scores.find_all{|array_of_2| array_of_2[1]==max }
      #puts "max score is #{all_max}"

      if all_max.length == 1 # no ties
        return all_max[0][0]
      else #ties
        all_max.each do |n|
          if n[0].length == 7 #there is a seven letters word
            return n[0]
          end
        end # no seven leters word

        shortest_winning_word = all_max.min_by {|x| x[0].length} #regresa la palabra mas corta
        return shortest_winning_word[0]
      end


      #   return array_of_words[e]
      # elsif array_of_words.count(max) > 1
      #

      #return scores
    end

  end #class end


end #module end

array_words = ["house", "mama", "flan", "dulce"]

puts Scrabble::Scoring.highscore_from(array_words)
