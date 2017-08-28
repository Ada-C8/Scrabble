require_relative 'spec_helper'

describe 'Scoring' do
  describe 'initialize' do
    it "has a Constant variable that is a Hash" do
      Scrabble::Scoring::POINTS.must_be_kind_of Hash
    end
  end

  
end # end of Scoring
