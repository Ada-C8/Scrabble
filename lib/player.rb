require_relative 'score'

module Scrabble
  class Player
    attr_reader :name, :plays
	
    def initialize(name)
      @name = name
	  @plays = []
    end
	
	def play(word)
		if won?
			return false
		else
			@plays << word
			return Scrabble::Score.score(word)
		end
	end
	
	def won?
		total = 0
		@plays.each do |i|
			total += Scrabble::Score.score(i)
		end
		if total > 100
			return true 
		else
			return false
		end
	end
	
	def total_score
		score = 0
		@plays.each do |i|
			score += Scrabble::Score.score(i)
		end
		return score
	end
	
	def highest_scoring_word
		word = ""
		high_score = 0
		@plays.each do |i|
			this_word_score = Scrabble::Score.score(i)
			if this_word_score > high_score 
				high_score = this_word_score
				word = i
			end
		end
		return word
	end
	
	def highest_word_score
		word = highest_scoring_word
		return Scrabble::Score.score(word)
	end
	
	private :won?
   end
end

=begin
a = Scrabble::Player.new('John')
a.play('hello')
a.play('bubbles')
a.play('hello')
a.play('bubbles')
a.play('hello')
a.play('bubbles')
a.play('hello')


puts a.name
puts a.highest_scoring_word
puts a.highest_word_score
puts a.plays
puts "##########"
puts a.total_score
puts "##########"
=end