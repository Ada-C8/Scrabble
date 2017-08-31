require_relative 'spec_helper.rb'

describe "The TileBag class" do

  before do
    @tilebag = Scrabble::TileBag.new
  end

  describe "Initializing TileBag" do

    it "Tilebag must be instance of Scrabble::TileBag" do
      @tilebag.must_be_instance_of Scrabble::TileBag
    end

    it "Tilebag is a class of the Scrabble" do
      @tilebag.class.must_be_kind_of Class
    end

  end

  # describe "The draw_tiles method" do
  #
  #   it "Responds to the draw_tiles method" do
  #
  #   end
  #
  # end
  #
  # describe "The tiles_remaining method" do
  #
  #   it "Responds to the tiles_remaining method" do
  #
  #   end
  #
  # end


end
