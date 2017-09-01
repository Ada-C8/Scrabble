require_relative 'spec_helper.rb'

describe "Class player" do
  before do
    @tile_bag = Scrabble::TileBag.new
  end
  describe "Initialize" do
    it "Return to name" do
      Scrabble::Player.must_respond_to :name
    end

    it "Respond to new person name" do
      bianca = Scrabble::Player.new("Bianca")
      bianca.name.must_equal "Bianca"
    end

    it "Player instance variable is empty upon initialization" do
      Scrabble::Player.new("Mariana").plays.must_equal []
    end

    describe "play method" do
      before do
        @new_player = Scrabble::Player.new("Ecuador", true)
        @new_player.draw_tiles(@tile_bag, ["P", "E", "R", "E", "Z", "A", "M", "M", "A"])
      end

      it "Returns score of word while won is false" do
        @new_player.play("mama").must_equal 8
      end

      it "Deletes the used letters" do
        @new_player.play("mama").must_equal 8
        @new_player.tiles.must_equal ["P", "E", "R", "E", "Z"]
      end

      it "Raises an argument error if tiles are not available to make word" do
        proc {@new_player.play("zorro")}.must_raise ArgumentError
      end

    end

    describe "total_score" do
      before do
        @jugador = Scrabble::Player.new("Morsa", true)
        @jugador.draw_tiles(@tile_bag, ["P", "E", "R", "E", "Z", "A", "M", "F", "O", "O", "D"] )
        @jugador.play("Pereza")
        @jugador.play("Food")
      end

      it "returns an integer" do
        @jugador.total_score.must_be_instance_of Fixnum
      end

      it "returns the total score" do
        @jugador.total_score.must_equal 25
      end

      it "Responds to an empty array" do
        @jugador.play("").must_equal 0
      end

      it "Total score  0 for a non played game" do
        fantasma = Scrabble::Player.new("Fantasma")
        fantasma.total_score.must_equal 0
      end

    end #descrieb total_score

    describe "Won? method" do
      before do
        @jugador = Scrabble::Player.new("Morsa", true)
        @jugador.draw_tiles(@tile_bag, ["P", "E", "R", "E", "Z", "A", "M", "F", "O", "O", "D"] )
        @jugador.play("PEREZA")
        @jugador.play("FOOD")
      end

      it "Returns false (under 100 )" do
        @jugador.won?.must_equal false
      end

      it "Returns true if over 100" do
        @jugador.draw_tiles(@tile_bag, ["R", "Z", "F", "O", "O", "Z", "Z", "Z", "Z", "Z", "Z", "R", "Z", "Z"] )
        @jugador.play("ZORRO")
        @jugador.play("ZZZZZZZ")
        @jugador.won?.must_equal true
      end
    end #describe

    describe "highest score with word" do
      before do
        @jugador = Scrabble::Player.new("Morsa", true)
        @jugador.draw_tiles(@tile_bag, ["P", "E", "R", "E", "Z", "A", "M", "F", "O", "O", "D"] )
        @jugador.play("PEREZA")
        @jugador.play("FOOD")
      end

      it "Returns an array" do
        @jugador.highest_scoring_word_score.must_be_instance_of Array
      end

      it "Returns the highest score" do
        @jugador.highest_scoring_word_score.must_equal ["PEREZA", 17]
      end

      it "Returns empty array and 0 score for 0 words played" do
        fantasma = Scrabble::Player.new("Fantasma")
        proc{fantasma.highest_scoring_word_score}.must_raise ArgumentError
      end
    end #describe highest

    describe "draw_tiles" do


      it "fills tile array with our debug code " do
        morsa = Scrabble::Player.new("Morsa", true)
        morsa.draw_tiles(@tile_bag, ["P", "E", "R", "E", "Z", "A"]).length.must_equal 6
      end

      it "fills the tile array with " do
        morsa = Scrabble::Player.new("Morsa")
        morsa.draw_tiles(@tile_bag).length.must_equal 7
      end
    end

  end#describe initialize
end #describe class player
