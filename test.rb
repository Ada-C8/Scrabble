# It’s better to use fewer tiles, in the case of a tie, prefer the word with the fewest letters.
# There is a bonus for words that are seven letters. If the top score is tied between multiple words and one used all seven letters, choose the one with seven letters over the one with fewer tiles.



def self.highest_score_from(array_of_words)
  highest_score = 0
  highest_score_word = []
  array_of_words.each do |word|
    word_score = Scrabble::Scoring.score(word)
    if word_score > highest_score
      highest_score_word << word_score
    elsif word_score == highest_score
      highest_score_word << word_score
    end #if/else

    highest_score_word.each do |word|
      word.upcase!
    end

    if highest_score_word.length == 1
      return highest_score_word[0]
    elsif highest_score_word.length > 1
      highest_score_word.each do |word|
        if word.length == 7
          return word
        end #if
      end #.each

      shortest_word = highest_score_word.min{|a,b| a.size <=> b.size }
      return shortest_word
    end #if/else

  end #.each
  return highest_score_word
end # DEF
