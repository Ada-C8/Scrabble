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
       @tiles_remaining = 0
     end

     def draw_tiles(num)
       #Raise argument error if num > 7
       raise ArgumentError.new("cannot take more than 7 letters at a time") if num > 7
       #Raise argument error if num > @tiles_remaining
       raise ArgumentError.new("you have requested more tiles than there are in the bag. There are #{@tiles_remaining} tiles remaining in the bag.") if num > @tiles_remaining

       letters = @tiles.to_a.sample(num).to_h.keys
      #  print "Letters 1: #{letters}"

       letters.each do |letter|
         @tiles[letter] -= 1
       end
        @tiles.delete_if {|letter, quantity| quantity == 0}
        # print "Letters 2: #{letters}"

        @tiles_remaining = tiles.values.inject(:+)

        return letters
     end


  end
end
