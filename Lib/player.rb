require_relative 'scrabble'
require_relative 'tile_bag'
require 'pry'
module Scrabble
  class Player

    attr_reader :name, :plays, :total_score, :tiles

    def initialize(name = "Pipes")
      @name = name
      @plays =[] #words played
      @total_score = 0
      @tiles = [] #will add all instances of Scoring class which are also each word in plays
    end

    def play(word)
      @plays << word
      word_score = Scoring.score(word)
      @total_score += word_score
      case
      when won?
        false
      when !won?
        word_score
      end
    end

    def word_uses_tiles?(word)
      hand_check = []
      hand_check = @tiles.dup
      word.each_char do |letter|
        index = hand_check.find_index{ |x| x == letter}
        return false if index == nil
        hand_check.delete_at(index)
      end
      true
    end


    # highest_scoring_word: Returns the highest scoring played word
    def highest_scoring_word
      Scoring.highest_score_from(@plays)
    end

    #highest_word_score: Returns the highest_scoring_word score
    def highest_word_score
      Scoring.score(highest_scoring_word)
    end

    def draw_tiles(tilebag)
      num = 7
      if @plays == []
      else
        remove_tiles(@plays[-1])
        num = @plays[-1].length
      end
      # tilebag << Scrabble::TileBag.remaining_tiles
      new_tiles = tilebag.draw_tiles(num)
      new_tiles.each do |tile|
        @tiles << tile
      end
      #REMOVES EVERY INSTANCE OF LETTER
      def remove_tiles(word)
        word.each_char do |word_letter|
          index = @tiles.find_index {|tile_letter| tile_letter == word_letter}
          @tiles.delete_at(index)
        end
      end

    end# end draw tiles
    
    private
    #won?: If the player has over 100 points returns true.
    # otherwise returns false
    def won?
      @total_score >= 100
    end

  end
end
