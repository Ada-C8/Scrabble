module Scrabble
  class Dictionary
    def self.look_up(word)
      raise ArgumentError.new "must be a String" if !word.is_a? String
      raise ArgumentError.new "input word must conatain only letters" if !word.match(/^[A-Z]+$/i)
      File.open('./support/words.txt', "r") do |f|
        f.each do |line|
          if line.match(/#{word}/i)
            return true
          end
        end
      end
      return false
    end
  end
end

#
# lines = IO.readlines('./support/words.txt')
# p lines.first
# p lines.last
