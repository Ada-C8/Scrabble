require_relative 'spec_helper'

describe 'Scrabble' do
  describe 'Scoring' do

    before do
      @game1 = Scrabble::Scoring.new
    end

    it "Scoring.new is a new instance of the Scoring class" do
      @game1.must_be_instance_of Scrabble::Scoring

    end # new instance of scoring

    describe "self.score " do
      it "CAT returns 5" do
        Scrabble::Scoring.score("cAt").must_equal 5
      end # CAT logic

      it "7 letter words receive 50 point bonus" do # probably a more interesting way to test this... score + 50
        Scrabble::Scoring.score("laurenl").must_equal 57
      end #50 point bonus

    end # self.score

    describe "self.highest_score_from(array_of_words)" do

      it "read array and return highest word count" do
        array_of_words = ["Rebecca", "Lauren", "cat"]
        Scrabble::Scoring.highest_score_from(array_of_words).must_equal "rebecca"
      end # rebecca wins

      it "tie will make shorter word win" do
        array_of_words = ["be", "it", "cat", "date", "sit"]
        Scrabble::Scoring.highest_score_from(array_of_words).must_equal "cat"
      end #short word tie win

      it "tie 7 letter word win" do
        array_of_words = ["laurend", "dog", "cat", "zzzzzx", "sit"]
        Scrabble::Scoring.highest_score_from(array_of_words).must_equal "laurend"
      end # 7 letter tie

      it "tie 7 letter word win" do
        array_of_words = [ "dog", "cat", "zzzzzx", "laurend", "sit"]
        Scrabble::Scoring.highest_score_from(array_of_words).must_equal "laurend"
      end # 7 letter tie

      it "equal scores and length will make first one win" do
        array_of_words = ["cat", "it", "be", "bat", "sit"]
        Scrabble::Scoring.highest_score_from(array_of_words).must_equal "cat"
      end # equal scores
    end # self.highest_score_from

    describe "tied words" do
      it "the first word of two equal scores will win" do
          Scrabble::Scoring.highest_score_from(["Cat", "bat"]).must_equal "cat"
      end

      it "three way tie results in first word win" do
        Scrabble::Scoring.highest_score_from(["bo", "cat", "be", "bat", "pat"]).must_equal "cat"
      end
    end


  end #describe scoring
end # describe scrabble



# 1- How did writing tests help you approach writing the scoring logic?
# we knew exactly when and from where the error resulted. We were able to work on each functionality. Although now we have a great deal of refactoring to tackle!

# 2- We created a hash with key,value pairs so that we could use each character within the word as a key! We certainly could have used an array but it most likely would have added an extra step of always recalling the index of where the value lived.
