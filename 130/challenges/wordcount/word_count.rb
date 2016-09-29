class Phrase
  def initialize(words)
    @words = words.split(/,|[[:blank:]]+/).map { | word | sanitize(word) }
    @words = @words.reject(&:empty?).map(&:downcase)
  end

  def word_count
    counts = Hash.new(0)
    @words.each { | word | counts[word] += 1 }
    counts
  end

  private
  
  def sanitize(word)
    word.gsub(/[!&@$%^&:.]/, '').delete("\n").gsub(/^'(\w+)'$/,'\1')
  end
end
