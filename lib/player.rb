module Scrabble
  class Player

    attr_reader :name, :plays

    def initialize(input_name)
      @name = input_name
      @plays = []
    end

    def play(input_word)
      @plays << input_word
      
    end




  end # => end of class
end # => end of module
