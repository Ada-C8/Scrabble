require 'awesome_print'
require 'terminal-table'

module Scrabble
  class Board
    BOARD_HASH = {"A" => 1, "B" => 2, "C" => 3, "D" => 4, "E" => 5, "F" => 6, "G" => 7, "H" => 8, "I" => 9, "J" => 10, "K" => 11, "L" => 12, "M" => 13, "N" => 14, "O" => 15}

    attr_reader :board, :BOARD_HASH

    def initialize
      @size = 15
      create_board
    end

    def create_board
      @board = Array.new
      i = 0
      @board[0] = []
      (@size + 1).times do |num|
        @board[0] << num.to_s
      end
      @size.times do
        row = Array.new(@size + 1)
        row[0] = BOARD_HASH.keys[i]
        @board << row
        i += 1
      end
    end

    def play_letter(letter, loc_down, loc_across)
      # location = @board[loc_down.to_i][loc_across.to_i]
      # if location == nil
      #   location = letter
      # elsif location == letter
      #   location = letter
      # else
      #   ArgumentError.new "Not a valid letter for this location"
      # end

      if @board[loc_down.to_i][loc_across.to_i] == nil
        @board[loc_down.to_i][loc_across.to_i] = letter
        return letter
      elsif @board[loc_down.to_i][loc_across.to_i] == letter
        return true
      else
        return false
      end
    end

    def show_table
      table = Terminal::Table.new do |t|
        i = 0
        (@size + 1).times do
          t << @board[i]
          t << :separator
          i += 1
        end
      end
      puts table
    end

    # returns the letters used playing the word
    def play_word(word, loc_let, loc_num, direction)
      letters = []
      word = word.upcase.split("")
      i = 0
      loc_down = BOARD_HASH[loc_let]
      if direction == "across"
        word.length.times do
          letters << play_letter(word[i], loc_down, loc_num)
          loc_num += 1
          i += 1
        end

      elsif direction == "down"

        word.length.times do
          letters << play_letter(word[i], loc_down, loc_num)
          loc_down += 1
          i += 1
        end
      end

      if letters.include?(false)
        return false
      else
        letters.delete(true)
        return letters
      end 
    end # end of play_word

    def check_if_possible(word, loc_let, loc_num, direction)
      loc_down = BOARD_HASH[loc_let]
      letters = []
      word.upcase.split("").each do |letter|
        if loc_down > 15 || loc_num > 15
          puts "TOOOO BIIIIIIIG!!!!"
          return false
        end
        if direction == "across"
          if @board[loc_down][loc_num] == nil || @board[loc_down][loc_num] == letter
            if @board[loc_down][loc_num] == nil
              letters << letter
            end
            loc_num += 1
          else
            return false
          end
        elsif direction == "down"
          if @board[loc_down][loc_num] == nil || @board[loc_down][loc_num] == letter
            if @board[loc_down][loc_num] == nil
              letters << letter
            end
            loc_down += 1
          else
            return false
          end
        else
          raise ArgumentError.new "not a valid direction"
        end
      end
      return letters
    end
  end
end
#
# board1 = Scrabble::Board.new(10)
# p board1.show_table
# p board1.play_word("hey", "C", 2, "across")
# p board1.show_table
# p board1.play_word("bello", "C", 2, "down")
# p board1.show_table
