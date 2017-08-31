describe "class TileBag" do
  describe "initialize" do
    it "sets up the instance with a collection of all default tiles" do
      rack = Scrabble::TileBag.new
      rack.must_be_instance_of Scrabble::TileBag
    end
  end
end
