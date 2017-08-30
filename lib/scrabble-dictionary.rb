module Scrabble
  class Dictionary
    def initialize
      @words = []
      file = File.open("/usr/share/dict/words")
      file.each do |line|
        @words << line.strip.downcase
      end
    end

    def find_in_dictionary(word)
      return @words.include?(word.downcase)
    end
  end
end
