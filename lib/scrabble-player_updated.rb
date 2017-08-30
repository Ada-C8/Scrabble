require_relative "scrabble-scoring"
require 'pry'

module Scrabble
  class Player
    attr_reader :name, :plays

    def initialize(name)
      @name = name
      @plays = []
      @hand = []
    end

    def tiles
      pretty_string = ""
      @hand.each do |letter|
        pretty_string << "#{letter} "
      end
      return pretty_string
    end

    def draw_tiles(tile_bag)
      @hand.concat(tile_bag.draw_tiles(7-@hand.length))
    end

    def check_word(word)
      word.upcase!
      temp_hand = @hand.clone
      bad_word = false
      word.each_char do |letter|
        index_to_delete = temp_hand.index(letter)
        if index_to_delete == nil
          bad_word = true
        else
          temp_hand.delete_at(index_to_delete)
        end
      end
      if bad_word
        puts "Oops! You don't have those tiles to play"
        puts "Enter a word to score:"
        word = check_word(gets.chomp)
      else
        # puts word
        return word
      end
    end

    def play(word)
      if won?
        return false
      else
        checked_word = check_word(word)
        # puts checked_word
        checked_word.each_char do |letter|
          @hand.delete_at(@hand.index(letter))
        end
        @plays << checked_word
        return checked_word
      end
    end


    def total_score
      total = 0
      plays.each do |word|
        total += Scrabble::Scoring.score(word)
      end
      return total
    end

    def highest_scoring_word
      return Scrabble::Scoring.highest_score_from_array(@plays)
    end

    def highest_word_score
      return Scrabble::Scoring.score(highest_scoring_word)
    end


    # private

    def won?
      if total_score > 100
        return true
      else
        return false
      end
    end

  end
end
