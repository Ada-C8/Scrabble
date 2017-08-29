require_relative 'spec_helper.rb'

describe "The Player class" do

  before do
    @player = Scrabble::Player.new('Peter')
    # @class = Scrabble::Player
  end

  describe "Initialising Player" do

    it "Player is a class of the Scrabble" do

      @player.must_be_instance_of Scrabble::Player
    end

    it "Player is a class" do
      @player.class.must_be_kind_of Class
    end

    it "hsa a readable name variable" do
      @player.name.must_equal "Peter"
    end
  end

  describe "the player method" do

    it "Responds to the play method" do
    @player.must_respond_to :play
    end

  end
end
