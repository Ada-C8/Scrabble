require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scoring.rb'
require_relative 'spec_helper'
require 'pry'

describe "Scoring Class" do
  describe "initialize scoring class" do
    it "ScoringClass.new is an instance of scrabble module" do
      #arrange
      scoring = Scrabble::ScoringClass.new
      #act
      #assert
      scoring.must_be_instance_of Scrabble::ScoringClass
    end

  end
  #arrange
  #act
  #assert
end
