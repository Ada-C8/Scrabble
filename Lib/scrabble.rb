
module Scrabble
  POINTPERVARIABLE = {
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
    "Z" => 10
  }

  class Scoring

    attr_accessor :word, :score

    def initialize(word = "")
      @word =  word
      # @score = score
    end

    # self.score(word):
    #1. returns the total score for the given word.
    #2. The word is input as a string (case insensitive).
    #3..  Seven letter words receive a 50 point bonus.
    def self.scored(word)
      points = word_has_7?(word)
      word.each_char do |letter|
        points += POINTPERVARIABLE[letter.upcase]
      end
      points
    end

    def self.word_has_7?(word)
      if word.length >= 7
        50
      else
        0
      end
    end
    # self.highest_score_from(array_of_words): returns the word in the array with the highest score.
    # In the case of tie, use these tiebreaking rules:
    # 1. If the top score is tied between multiple words and one used all seven letters, choose the one with seven letters over the one with fewer tiles.
    # 2. If the there are multiple words that are the same score and same length, pick the first one in the supplied list.
    # 3. It’s better to use fewer tiles, in the case of a tie, prefer the word with the fewest letters.

    def self.shortest_word(words)
      shortest_word = words[0]
      shortest_length = words[0].length
      words.each do |word|
        if word.length < shortest_length
          shortest_word = word
          shortest_length = word.length
        end
      end
      return shortest_word
    end

    def self.seven_lettered(words)
      seven_letters = ""
      words.each do |word|
        if word.length >= 7
          seven_letters = word
          return seven_letters
        end
      end
      return seven_letters
    end

    def self.isolate_tieing_words(words)
      scores = []
      tieing_words =[]
      words.each do |word|
        scores << scored(word)
      end
      max_score = scores.sort.reverse[0]
      words.each do |word|
        if scored(word) == max_score
          tieing_words << word
        end
      end
      return tieing_words
    end

    def self.tied(words)
      values = []
      words.each do |word|
        values << scored(word)
      end
      if values.sort.reverse[0] == values.sort.reverse[1]
        tie = 1
      else
        tie = 0
      end
      return tie
    end

    def self.return_higest(words)
      highest_score = scored(words[0])
      best_word = words[0]
      words.each do |word|
        if scored(word) > highest_score
          highest_score = scored(word)
          best_word = word
        end
      end
      return best_word
    end

    def self.highest_score_from(array_of_words)
      #if there is no tie return higest scoring word
      #if there is a tie returns a sting of the tieing words
      if tied(array_of_words) == 0
        return return_higest(array_of_words)
      else
        tieing_words = isolate_tieing_words(array_of_words)
      end
      
    #if none of the tieing words are seven letters long, returns the #first instance of the shortest_word
    # If at least one word is seven letters long, returns the first
    #seven lettered word
      if seven_lettered(tieing_words) == ""
         shortest_word(tieing_words)
       else
         seven_lettered(tieing_words)
      end
    end
  end #self::Scoring
end #Module End

#
