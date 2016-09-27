class Anagram
  attr_accessor :anagram, :matched_words

  def initialize(word)
    @anagram = word
  end

  def match(possible_matches)
    result =
      possible_matches.select do |word|
        if word.downcase != @anagram.downcase
          word.downcase.chars.sort.join == anagram.downcase.chars.sort.join
        end
      end
      @matched_words = result
      result
  end

  def sort
    @matched_words.sort
  end
end
