module Scrabble
  class Scoring

    POINTS = {?A => 1, ?B => 3, ?C => 3, ?D => 2, ?E => 1, ?F => 4, ?G => 2, ?H => 4, ?I => 1, ?J => 8, ?K => 5, ?L => 1, ?M => 3, ?N => 1, ?O => 1, ?P => 3, ?Q => 10, ?R => 1, ?S => 1, ?T => 1, ?U => 1, ?V => 4, ?W => 4, ?X => 8, ?Y => 4, ?Z => 10}

    def self.score(word)
      word = word.upcase.split("")
      total_score = 0

      if word.length == 7
        total_score += 50
      end

      word.each do |letter|
        total_score += POINTS[letter]
      end
      return total_score
    end # end of self.score

    def self.highest_score_from(array_of_words)
      best_word = array_of_words[0]
      array_of_words.each do |word|
        if self.score(word) == self.score(best_word)
          if best_word.length == 7
            # do nothing
          elsif word.length == 7
            best_word = word
          elsif word.length < best_word.length
            best_word = word
          end
        elsif self.score(word) > self.score(best_word)
          best_word = word
        end
      end
      return best_word
    end # end of self.highest_score


  end # end of Scoring class

end # end of module
