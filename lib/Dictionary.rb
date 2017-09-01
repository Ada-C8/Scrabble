
module Scrabble
  class Dictionary

    def initialize
    end

    def check_word(word)
      word = word.downcase
      File.open('lib/engmix.txt').each do |line|
        line = line[0..line.length-2]
        if line == word
          return true
        end
      end
      return false
    end
  end
end
