require_relative 'scoring'
require_relative 'tilebag'

module Scrabble
  class Player
    attr_reader :name, :plays, :word_scores, :hand, :tile_bag
    def initialize(name, tile_bag)
      @name = name
      @tile_bag = tile_bag
      @word_scores = []
      @plays = []
      @hand = []
    end

    def play(word)
      if won? == true
        return false
      end

      score = Scrabble::Scoring.score(word)
      @word_scores << score
      @plays << word

      remove_played_letters_from_hand(word)
      return score
    end


    def total_score
      if @word_scores.empty?
        return 0
      else
        return @word_scores.reduce(:+)
      end
    end

    def highest_scoring_word
      return Scrabble::Scoring.highest_score_from_array(@plays)
    end


    def highest_word_score
      return Scrabble::Scoring.score(highest_scoring_word)
    end


    def draw_tiles
      if bag_empty?
        return "Sorry, bag's empty! Work with whatcha momma gave ya!"
      end
      push_to_hand(@tile_bag.draw_tiles(get_num))
      #pushes
    end



    private
    #I think this was also a block of code that I moved into its own method but didn't otherwise change, just for the sake of cleaning it up a little.
    def remove_played_letters_from_hand(word)
      word = word.split("")
      word.each do |letter|
        if @hand.include?(letter)
          @hand.delete_at(@hand.index(letter))
        end
      end
    end

    def get_num
      num = 7 - @hand.length
      if num > @tile_bag.num_tiles_remaining
        num = @tile_bag.num_tiles_remaining
      end
      return num
    end

    def won?
      total_score >= 100 ? true : false
    end

    def bag_empty?
      if @tile_bag.num_tiles_remaining == 0
        return true
      end
    end

    def push_to_hand(tiles_you_drew)
      @hand.push(tiles_you_drew)
      @hand = @hand.flatten!
    end
  end
end

##mariam webster dictionary api??
