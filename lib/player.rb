module Scrabble
  class Player
    attr_reader :name, :plays, :tiles

    def initialize(name, debug = false)
      @name = name.to_s
      @plays = []
      @debug = debug
      if @debug == :debug
        @tiles = ['J','A','Z','Z','C','A','T']
        @debug_points = 0
      else
        @tiles = []
      end
    end

    def play(word)
      return false if won?

      backup_hand = @tiles.dup

      word.upcase.chars.each do |letter|
        location = @tiles.index(letter)
        if location == nil
          @tiles = backup_hand
          return false
        end
        @tiles.delete_at(location)
      end

      @plays << word
      Scoring.score(word)
    end

    def total_score
      total = 0
      @plays.each do |word|
        total += Scoring.score(word)
      end
      if @debug == :debug
        total += @debug_points
      end
      total
    end

    def add_points(num)
      if @debug == :debug
        @debug_points += num
      end
    end

    def highest_scoring_word
      Scoring.highest_score_from(@plays)
    end

    def highest_word_score
      Scoring.score(highest_scoring_word)
    end

    def draw_tiles(tilebag)
      num_tiles = 7 - @tiles.length
      @tiles += tilebag.draw_tiles(num_tiles)
    end

    private

    def won?
      total_score > 100
    end

  end # end of Player class
end # end of Scrabble module
