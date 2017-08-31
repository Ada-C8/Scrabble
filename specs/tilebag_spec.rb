require_relative 'spec_helper'


describe "TileBagClass" do
  it "initiates an instance of TileBag" do
    tilebag = Scrabble::TileBag.new
    tilebag.must_be_instance_of Scrabble::TileBag
  end

end
