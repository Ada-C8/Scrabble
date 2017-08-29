require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/wave-1-scoring'

describe "Scoring Class" do
  it 'has a hash constant' do
    Scrabble::Scoring::SCORE_HASH.must_be_instance_of Hash
  end
end
describe "method self.score" do
  it 'must return an integer' do
    Scrabble::Scoring.score("word").must_be_kind_of Integer
  end
  it 'raises an Argument Error if input is not a String' do
    proc{Scrabble::Scoring.score(15)}.must_raise ArgumentError
  end
  it 'correctly scores a word' do
    Scrabble::Scoring.score("seven").must_equal 8
  end
  it 'scores comprehensively for several example words' do
    words = %w[a to the seven letters zebra joke ok fair hi warm]
    scores = [1, 2, 6, 8, 7, 16, 15, 6, 7, 5, 9]

    i = 0
    words.each do |word|
      Scrabble::Scoring.score(word).must_equal (scores[i])
      i += 1
    end
  end
end
