# require 'simplecov'
# SimpleCov.start
#
#
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/wave-1-scoring'
# require_relative 'spec_helper'

describe "Scoring Class" do
  it 'has a hash constant' do
    Scrabble::Scoring::SCORE_HASH.must_be_instance_of Hash
  end
end

describe "method self.score" do
  it 'must return an integer' do
    Scrabble::Scoring.score("word").must_be_kind_of Integer
  end

  it 'raises an Argument Error if input word is not composed of valid letters' do
    proc{Scrabble::Scoring.score(15)}.must_raise ArgumentError
  end

  it 'correctly scores a word' do
    Scrabble::Scoring.score("seven").must_equal 8
  end

  it 'scores comprehensively for several example words' do
    words = %w[a to the seven letters zebra joke ok fair hi warm]
    scores = [1, 2, 6, 8, 57, 16, 15, 6, 7, 5, 9]

    i = 0
    words.each do |word|
      Scrabble::Scoring.score(word).must_equal (scores[i])
      i += 1
    end
  end

  it 'raises an ArgumentError if a word has more than seven chars or less than 0' do
    proc{Scrabble::Scoring.score("supercalifrag")}.must_raise ArgumentError
    proc{Scrabble::Scoring.score("")}.must_raise ArgumentError
  end
end

describe "method self.highest_score_from" do
  before do
    @array_of_words = %w[a to the seven letters zebra joke ok fair hi warm]
  end

  it "raises an ArgumentError if not an Array" do
    proc{Scrabble::Scoring.highest_score_from("String")}.must_raise ArgumentError
  end

  it "raises an ArgumentError if input Array is empty" do
    proc{Scrabble::Scoring.highest_score_from([])}.must_raise ArgumentError
  end

  it "returns a word from the original array " do
    highest_word = Scrabble::Scoring.highest_score_from(@array_of_words)

    @array_of_words.include?(highest_word).must_equal true #why doesn't any? work?
  end

  it "must return the word with the highest score (no-ties)" do
    Scrabble::Scoring.highest_score_from(@array_of_words).must_equal "letters"
  end

  it "In case of a tie, chooses word with fewer letters" do
    words = %w[a to the ok hi]
    Scrabble::Scoring.highest_score_from(words).must_equal "ok"
  end

  it "in case of a tie, a word with 7 letters wins" do
    words = %w[qzzzzj to the ok hi aaaaaad]
    Scrabble::Scoring.highest_score_from(words).must_equal "aaaaaad"
  end

  it "in case of an entire tie, the first word entered wins" do
    words = %w[aeiouad to the ok hi aaaaaad]
    Scrabble::Scoring.highest_score_from(words).must_equal "aeiouad"
  end
end
