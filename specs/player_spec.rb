require_relative 'spec_helper.rb'

describe "The Player class" do

  before do
    @player = Scrabble::Player.new('Peter')
  end

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
