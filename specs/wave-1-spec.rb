require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require 'minitest/pride'
require_relative '../lib/scrabble'

describe 'Scoring' do
  it "Scoring.new is a new instance of the Scoring class" do
    game1 = Scoring.new
    game1.must_be_instance_of Scoring

  end

end #describe scoring
