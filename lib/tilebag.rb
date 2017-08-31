module Scrabble
  class TileBag

    attr_reader :tiles, :tiles_remaining

     def initialize
       @tiles = {
         "A" => 9,
         "B" => 2,
         "C" => 2,
         "D" => 4,
         "E" => 12,
         "F" => 2,
         "G" => 3,
         "H" => 2,
         "I" => 9,
         "J" => 1,
         "K" => 1,
         "L" => 4,
         "M" => 2,
         "N" => 6,
         "O" => 8,
         "P" => 2,
         "Q" => 1,
         "R" => 6,
         "S" => 4,
         "T" => 6,
         "U" => 4,
         "V" => 2,
         "W" => 2,
         "X" => 1,
         "Y" => 2,
         "Z" => 1
       }
       @tiles_remaining = 98
     end

     def draw_tiles(num)
       #Raise argument error if num > 7
       puts"Tiles remaining at start: #{@tiles_remaining}"
       raise ArgumentError.new("cannot take more than 7 letters at a time") if num > 7
       #Raise argument error if num > @tiles_remaining
       raise ArgumentError.new("you have requested more tiles than there are in the bag. There are #{@tiles_remaining} tiles remaining in the bag.") if num > @tiles_remaining

       #letters = @tiles.to_a.sample(num).to_h.keys
       #puts "Letters 1: #{letters}"
       drawn_tiles = []
       num.times do
         letter = @tiles.to_a.sample(1)
         puts "THIS LETTER #{letter}"
         @tiles[letter[0][0]] -= 1
         
         #quantity -= 1
         puts "QUANTITY? #{@tiles[letter[0][0]]}"
         @tiles.delete_if {|ltr, qty| qty == 0}
         drawn_tiles << letter[0]
         puts "drawn tiles inside loop: #{drawn_tiles}"
       end

      #  letters.each do |letter|
      #    @tiles[letter] -= 1
      #  end
        #@tiles.delete_if {|letter, quantity| quantity == 0}
        puts "Drawn_tiles1: #{drawn_tiles}"
        drawn_tiles = drawn_tiles.to_h.keys
        puts "Drawn_tiles2: #{drawn_tiles}"
        @tiles_remaining = tiles.values.inject(:+)
        puts "Tiles remaining after draw: #{@tiles_remaining}"

        puts "DRAWN TILES! #{drawn_tiles}"
        return drawn_tiles
     end


  end
end
