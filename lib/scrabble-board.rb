require_relative 'scrabble-dictionary'
require 'awesome_print'

module Scrabble
  class Board
    attr_reader :board_spaces, :size
    def initialize(size)
      @size = size
      @board_spaces = []
      size.times do
        @board_spaces << Array.new(size)
      end
      @dictionary = Scrabble::Dictionary.new
    end


    def print_row
      print "----"*@size
      puts "-"
    end
    def print_col(row)
      @size.times do |col|
        print "| #{@board_spaces[row][col] ? @board_spaces[row][col] : " "} "
      end
      puts "|"
    end

    def print_board
      print_row
      @size.times do |row|
        print_col(row)
        print_row
      end
    end

    def check_placement(word,start,direction)
      #TODO: argument error for start and direction!
      board = []
      @size.times do |i|
        board[i] = @board_spaces[i].clone
      end
      case direction
      when :down
        word.length.times do |i|
          if board[start[0]+i][start[1]].nil?
            board[start[0]+i][start[1]] = word[i]
          elsif word[i] != board[start[0]+i][start[1]]
            return false
          end
        end
      when :right
        word.length.times do |i|
          if board[start[0]][start[1]+i].nil?
            board[start[0]][start[1]+i] = word[i]
          elsif word[i] != board[start[0]][start[1]+i]
            puts "wrong letter"
            return false
          end
        end
      end
      new_words = []
      @size.times do |i|
        col_words = (0...@size).to_a.map { |row| board[row][i]}
        new_words << col_words.reduce("") {|results, n| results + ( n.nil? ? " ":n)}
        new_words << board[i].reduce("") {|results, n| results + ( n.nil? ? " ":n)}
      end
      new_words2 = []
      new_words.each do |word|
        new_words2 << word.split(" ")
      end
      new_words2.flatten.each do |word|
        # puts "#{word} #{word == ""}"
        if word != "" && !@dictionary.find_in_dictionary(word)
          puts "#{word} isn't in our dictionary"
          return false
        end
      end
      # puts "got to this point"
      @board_spaces = board
      return true
    end

  end
end
