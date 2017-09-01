require 'pry'
module Scrabble
  class PlayerClass
    attr_reader :name, :plays, :tiles
    #name: returns the value of the @name instance variable
    #plays: returns an Array of the words played by the player
    def initialize(name)
      @name = name
      @plays = []
      @tiles = []
    end


    def total_score
      # total_score: Returns the sum of scores of played words

      # Loop version of what we accomplish with the inject enumerable below
        # running_score = 0
        # @plays.each do |word|
        #   running_score += Scrabble::ScoringClass.score(word)
        # end
        # return running_score

      #[1,2,3,4].inject(0) { |result, element| result + element } # => 10
      total = @plays.inject(0){|sum,word| sum + Scrabble::ScoringClass.score(word)}
      return total
    end

    def draw_tiles(tile_bag)
      until @tiles.length == 7 do
        @tiles << tile_bag.draw_tiles(1)
      end
    end

    def play(word)
      legit_word?(word)
      @tiles = word_in_tiles(word)
      # hit a wall - need to program in game.rb to get further on this optional
      draw_tiles(we would call tilebag here)
      # Returns false if player has already won
      # Returns the score of the word
      @plays << word
      won? ? (return false) : (return Scrabble::ScoringClass.score(word))
    end

    def is_alphabet?(input)
      is_string?(input) == false ? (raise ArgumentError.new("#{input} is an invalid entry - you may only enter strings")) : (return /^[a-z]+$/.match(input))
    end

    def is_string?(input)
      input.class == String
    end

    def legit_word?(player_word)
      raise ArgumentError.new("#{player_word} is an invalid entry - you may only enter letters in the the english alphabet") if is_alphabet?(player_word) == nil
    end

    def word_in_tiles(word)
      hash_letters = Hash.new(0)
      @tiles.each do |element|
        hash_letters[element] += 1
      end

      word_arr = word.split('')

      word_arr.each do |letter|
        temp = hash_letters.has_key? letter
        if temp != true
          raise ArgumentError.new("you don't have the right tiles to play the word #{word}")
        else
          hash_letters[letter] -= 1
          if hash_letters[letter] < 0
            raise ArgumentError.new("you don't have enough of #{letter} tiles to play the word #{word}")
          end
        end
      end

      return hash_letters.select {|key, value| value > 0}.keys
    end

    def highest_scoring_word
      #highest_scoring_word: Returns the highest scoring played word
      return Scrabble::ScoringClass.highest_score_from(@plays)
    end

    def highest_word_score
      #highest_word_score: Returns the highest_scoring_word score
      # score highest scoring word
      Scrabble::ScoringClass.score(highest_scoring_word)
    end

    private

    def won?
      # won?: If the player has over 100 points, returns true, otherwise returns false
      # This should be a private method
      total_score >= 100 ? (return true) : (return false)
    end
  end
end

# player1 = Scrabble::PlayerClass.new("Sandy")
# bag_o_tiles = Scrabble::Tilebag.new
#
# player1.play("dog")
