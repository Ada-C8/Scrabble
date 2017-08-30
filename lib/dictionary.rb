module Scrabble
  class Dictionary
    def self.look_up(word)
      puts "word: #{word}"
      @dictionary = File.open('./support/words.txt', "r") do |f|
        f.each do |line|
          if line.match(/#{word}/)
            return true
          end
        end
      end
      return false
    end
  end
end


p Scrabble::Dictionary.look_up("ACADEMY")
