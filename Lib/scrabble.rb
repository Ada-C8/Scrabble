
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

    # self.highest_score_from(array_of_words):
    # returns the word in the array with the highest score.
    # In the case of tie:
    # 1. If the top score is tied between multiple words and is seven
    #   letters long, choose the one with seven letters over the one with #  fewer tiles.
    # 2. If the there are multiple words that are the same score and same
    #   length, pick the first one in the supplied list.
    # 3. It’s better to use fewer tiles, in the case of a tie, prefer the
    #    word with the fewest letters.

    def self.highest_score_from(array_of_words)
      #if there is no tie return higest scoring word
      #if there is a tie makes a string of the tieing words
      #if none of the tieing words are seven letters long, returns the #first instance of the shortest_word
      # If at least one word is seven letters long, returns the first
      #seven lettered word
      if tied(array_of_words) == 0
        return return_higest(array_of_words)
      end
      tieing_words = isolate_tieing_words(array_of_words)
      if seven_lettered(tieing_words) == ""
        shortest_word(tieing_words)
      else
        seven_lettered(tieing_words)
      end
    end

    #Takes an array of words and returns shortest word.
    #If there is a tie, the first shortest word is returned.
    def self.shortest_word(words)
      sorted = words.sort_by do |word|
        word.length
      end
      shortest_word = sorted[0]
      return shortest_word
    end

    # Takes an a array of words and returns a seven lettered word.
    # If there are two seven-lettered, it returns the first one.
    def self.seven_lettered(words) #try with select
      seven_letters = words.select {|word| word.length >=7}
      return seven_letters
    end
    #   seven_letters = ""
    #   words.each do |word|
    #     if word.length == 7
    #       seven_letters = word
    #       return seven_letters
    #     end
    #   end
    #   return seven_letters
    # end

    # Takes an a array of words and returns an array of all the words
    # that tie for the highest score.
    def self.isolate_tieing_words(words)
      tieing_words =[]
      best_word= words.max_by {|word| scored(word)}
      max_score = scored(best_word)
      tieing_words = words.select do |word|
        scored(word) == max_score
      end
      return tieing_words
    end

    # Takes an array of of words and returns 1 if there is a tie, and
    # zero if there is not.
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

    # Takes an array of words and returns the word with the highest score.
    # If their are two words that tie, it returns the first.
    def self.return_higest(words)
      best_word= words.max_by {|word| scored(word)}
      return best_word
    end
  end #self::Scoring
end #Module End
