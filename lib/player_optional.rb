module Scrabble
  class Player

    attr_reader :name, :plays, :tiles

    def initialize(name)
      @name = name
      @plays = []
      @tiles = []
    end

    def play(word)
      if won?
        return false
      else
        word_array = word.split("").sort
        tiles = @tiles.sort
        taken_tiles = word_array.take_while { |letter| tiles.include?(letter) }

        if taken_tiles.length < word.length
          return false
        else
          plays << word

          @tiles.each_index do |i|
            taken_tiles.each_index do |j|
              if @tiles[i] == taken_tiles[j]
                @tiles.delete_at(i)
                taken_tiles.delete_at(j)
              end
            end
          end

          Scoring.score(word)
        end
      end
    end

    def total_score
      plays.inject(0) { |sum, word| sum + Scoring.score(word) }
    end

    def highest_scoring_word
      Scoring.highest_score_from(plays)
    end

    def highest_word_score
      Scoring.score(highest_scoring_word)
    end

    def draw_tiles(tile_bag)
      until tiles.length == 7
        tiles.concat(tile_bag.draw_tiles(1))

      end
    end

    private
    def won?
      total_score > 100 ? true : false
    end

  end
end
