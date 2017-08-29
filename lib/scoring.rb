module Scrabble
  class Scoring
    def self.score(word)
      score_chart = {
        1 => ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
        2 => ["D","G"],
        3 => ["B", "C", "M", "P"],
        4 => ["F", "H", "V", "W", "Y"],
        5 => ["K"],
        8 => ["J", "X"],
        10 => ["Q","Z"]
      }

      if word.class != String
        raise ArgumentError.new("You did not enter a string for the word being scored.")
      elsif word.length > 7
        raise ArgumentError.new("You cannot enter a word greater than 7 letters!")
      else
        word.upcase!
        this_score = 0
        word.length.times do |index|
          score_chart.each do |point, score_letters|
            score_letters.each do |score_letter|
              if score_letter == word[index]
                this_score += point
              end
            end
          end
        end
      end
      if word.length == 7
        return this_score + 50
      else
        return this_score
      end
    end

    def self.highest_score_from(array_of_words)
      hash_of_scores = {}
      array_of_words.each do |word|
        hash_of_scores[word] = self.score(word)
        #hash_of_scores.merge(word => self.score(word))
      end
      highest_score = hash_of_scores.values.max
      puts "highest_score #{highest_score}"
      winning_hash = hash_of_scores.select {|word,score| score == highest_score}
      puts "winning_hash #{winning_hash}"


      if winning_hash.length == 1
        winning_hash.each do |word, score|
          puts "word #{word}"
          return word
        end
      elsif winning_hash.length > 1
        puts "there's a tie"
        seven_ltrs_wrd = winning_hash.select {|word, score| word.length == 7}
        if seven_ltrs_wrd.empty?
          tie_array = winning_hash.keys
          puts "Tie_array: #{tie_array}"
          winner = tie_array.min { |word1, word2| word1.length <=> word2.length }
          #puts "winner: #{winner}"
          return winner
        elsif (seven_ltrs_wrd.empty?) == false
          return seven_ltrs_wrd.keys[0]
        else
          raise ArgumentError.new("empty array")
        end
      else raise ArgumentError.new("empty winning hash")
      end
    end
  end
  #Scoring.highest_score_from(["KK", "Z"])

end
