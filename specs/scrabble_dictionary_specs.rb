require_relative 'spec_helper.rb'
require_relative '../lib/scrabble-player'
require_relative '../lib/scrabble-tilebag'
require_relative '../lib/scrabble-dictionary'


describe "Scrabble::Dictionary" do
  before do
    @dict = Scrabble::Dictionary.new
  end
  it "can be initialized" do
    Scrabble::Dictionary.new.must_be_instance_of Scrabble::Dictionary
  end
  it "can be searched" do
    @dict.must_respond_to :find_in_dictionary
  end
  it "can find a word and return true " do
    @dict.find_in_dictionary("accordantly").must_equal true
  end
  it "returns false if not a word" do
    @dict.find_in_dictionary("hni").must_equal false
  end
  it "returns false if blank" do
    @dict.find_in_dictionary("").must_equal false
  end
  it "returns true if case is different" do
    @dict.find_in_dictionary("AccorDanTLY").must_equal true
  end

end
