module Scrabble
  class Player
    attr_reader :name, :plays, :total, :highest_scoring_word, :highest_word_score, :tiles

    def initialize(input_name)
      @name = input_name
      @plays = []
      @total = 0
      @highest_word_score = 0
      @highest_scoring_word = "marisa"
      @tiles = []
    end

    def play(input_word)
      total_score #TODO 99 vs. 101 edge case.

       if won? == true
         return false
       end
      score = Scrabble::Scoring.score(input_word)
      @plays << input_word
      total_score

      return score
    end

    def total_score
      return 0 if @plays.length == 0
      scores = @plays.map{ |word| Scrabble::Scoring.score(word) }
      @total = scores.inject(:+)

      @highest_word_score = scores.max
      @highest_scoring_word = @plays.inject do |memo, word|
        Scrabble::Scoring.score(memo) >= Scrabble::Scoring.score(word) ? memo : word
      end

      return @total

    end

    def draw_tiles(input_bag)
      raise ArgumentError.new "Can only draw from a Tilebag" if !(input_bag.is_a? Scrabble::Tilebag)
      tiles_needed = 7 - @tiles.length
      if tiles_needed <= 7
        grab = input_bag.draw_tiles(tiles_needed)
        grab.each {|letter| @tiles << letter}
      end
      # grab = []
      # while @tiles < 7
      #   grab.push(input_bag.draw_tiles)
      # end
      # grab.each do |letter|
      #   @tiles << letter
      # end
    end

    private
    def won?
      @total > 99 ? true : false
    end

  end # => end of class
end # => end of module
