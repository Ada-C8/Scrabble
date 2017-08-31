require_relative 'spec_helper.rb'

require_relative '../lib/tilebag'

describe "TileBag class" do

  describe "Initialize" do

    it "Can be initialized" do
      Scrabble::TileBag.new.must_be_instance_of Scrabble::TileBag
    end

    it "Will have a total of 98 tiles" do
      Scrabble::TileBag.new.tile_array.length.must_equal 98
    end

    it "Allows access to tile array (attr reader)" do

    end




  end

end
