require 'terminal-table'
require 'colorize'

module Scrabble
  class Board

    BOARD_SIDE_SIZE = 15
    attr_reader :board_grid

    def initialize
      @board_grid = []
      initialize_board
    end

    # Assign numbers to board interface
    def initialize_board
      (0...BOARD_SIDE_SIZE).each do |rows| #rows
        column_arr = []
        (1..BOARD_SIDE_SIZE).each do |column|
          column_arr << column + (rows * BOARD_SIDE_SIZE)
        end
        @board_grid[rows] = column_arr
      end
    end

    # Print board state
    def draw_board
      table = Terminal::Table.new do |t|
        t.rows = @board_grid
        t.style = {:all_separators => true}
      end
      puts table
    end

    def put_on_board(word, direction, starting_tile)
      if !can_place_word_on_board?(word, direction, starting_tile)
        return false #unsuccessfully places it
      else
        word_array = word.split("")
        coordinates = convert_tile_to_index_coordinate(starting_tile)
        start_row = coordinates[0]
        start_col = coordinates[1]
        letter_index = 0
        if direction == "vertical"
          (start_row...start_row + word.length).each do |i|
            # Letters on the board are saved into the grid with the colorize string code as well
            # Ex. "r" as a light_white colorized string is "\e[0;97;49mr\e[0m"
            @board_grid[i][start_col] = word_array[letter_index].colorize(:light_white)
            letter_index += 1
          end
        elsif direction == "horizontal"
          (start_col...start_col + word.length).each do |j|
            @board_grid[start_row][j] = word_array[letter_index].colorize(:light_white)
            letter_index += 1
          end
        else
          return false #neither "horizontal" nor "vertical" were given as a direction
        end
        return true #successfully places it
      end
    end

    private

    # Returns an array [row, column]
    # 0-based
    def convert_tile_to_index_coordinate(tile_number)
      row = 0
      column = 0
      while tile_number > 15
        tile_number = tile_number - 15
        row += 1
      end
      column = tile_number - 1
      return [row, column]
    end

    # Pass in 0-index Coordinates
    # Return the tile number
    def convert_index_coordinate_to_tile(coordinate_arr)
      row = coordinate_arr[0]
      column = coordinate_arr[1]
      tile_number = (BOARD_SIDE_SIZE * row) + column + 1
      return tile_number
    end

    # Given a tile number, returns either the tile number (as an Int) or letter (as a string)
    def object_at_tile tile_number
      coordinates = convert_tile_to_index_coordinate(tile_number)
      target_object = @board_grid[coordinates[0]][coordinates[1]]
      if target_object.class == Integer
        return target_object
      else #it's a string
        return target_object.uncolorize
      end
    end

    def can_place_word_on_board?(word, direction, starting_tile)
      # if the "word" is not a string, nor does it contain special characters
      return false unless word.class == String && word.match?(/^[A-z]+$/)
      # if tile number is not in the board...
      return false if starting_tile > BOARD_SIDE_SIZE ** 2

      word_array = word.split("")
      coordinates = convert_tile_to_index_coordinate(starting_tile)
      start_row = coordinates[0]
      start_col = coordinates[1]
      letter_index = 0

      # Invalid play if:
      # Runs off the board: if row = 14 (index) and direction is horizontal OR if col = 14 (index) and direction is vertical
      # It runs into another letter, the letter doesn't match what's at the current word letter

      if direction == "vertical" # check vertically if it runs into another word
        return false if start_row + word.length > BOARD_SIDE_SIZE #reaches the end of the word
        (start_row...start_row + word.length).each do |i|
          current_tile_number = convert_index_coordinate_to_tile([i, start_col])
          if object_at_tile(current_tile_number).class != Integer
            return false if object_at_tile(current_tile_number) != word_array[letter_index]
          end
          letter_index += 1
        end
      elsif direction == "horizontal" # check horizontally if it runs into another word
        return false if start_col + word.length > BOARD_SIDE_SIZE # if the word will go past the board
        (start_col...start_col + word.length).each do |i|
          current_tile_number = convert_index_coordinate_to_tile([start_row, i])
          if object_at_tile(current_tile_number).class != Integer
            return false if object_at_tile(current_tile_number) != word_array[letter_index] # if the letter it hits isn't the current word letter iterated
          end
          letter_index += 1
        end
      end
      return true
    end

  end
end
