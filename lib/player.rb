require_relative 'score'

module Scrabble
  class Player
    attr_reader :name, :plays, :tiles
    def initialize(name)
      @name = name
      @plays = []
      @tiles = []
    end


    def play(word) 
	  valid_play = true
	  word = word.upcase
	  word.split("").each do |i|
		if !@tiles.include? i
			valid_play = false
		end
	  end
	  if valid_play
		  if won?
			return false
		  else
			@plays << word
			return Scrabble::Scoring.score(word)
			end
	  else
		puts "You must use the tiles you have"
	  end
    end


    def total_score
        total_so_far = 0
        @plays.each do |i|
            total_so_far += Scrabble::Scoring.score(i)
          end
        return total_so_far
    end


    def won?
       total_score > 100 ? true : false
    end

    def highest_scoring_word
      return Scrabble::Scoring.highest_score_from_array(@plays)
    end

    def highest_word_score
      return Scrabble::Scoring.score(highest_scoring_word)
    end

    def draw_tiles(tile_bag)
      # fills tiles array until it has 7 letters from the given tile bag
      count = 7 - @tiles.length
      @tiles.concat(tile_bag.draw_tiles(count))# when used push, it pushes array inside of an array
    end

    #private :won?
	#I think there might be a bug in wave-2-game.rb or in the spec.
	#The spec says won? should be a private method.
	#If won? is made private then line 54 in wave-2-game.rb shouldn't
	#work because the method is private. I'm not sure if I'm missing
	#something, but this doesn't seem possible.
  end
end
