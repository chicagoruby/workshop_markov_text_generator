# Break the input text into words. Ruby's String class has a #split method that works great for this.
# Build a hash that keeps track of all of the words that appear immediately after each word in the the input.
# Choose a random word from the text, and then choose a random word from the list of words that followed that word.
# Choose a random word that follows the following word from the last step, and repeat.


class MarkovGenerator
  def self.from_file(file)
    from_text(File.read(file))
  end

  def self.from_text text
    freq_hash = Hash.new {|hash, key| hash[key] = [] }

    text.split.each_cons(2) do |word, following_word|
      if word.end_with?('.')
        word == word.end_with?('.')
        freq_hash[word] << following_word
      elsif word.end_with?(',')
        word == word.end_with?(',')
        freq_hash[word] << following_word
      elsif word == word.end_with?('.')
        word == word.end_with?('.')
        freq_hash[word] << following_word
      else
        freq_hash[word] << following_word
      end
    end


    require 'pp'
    pp freq_hash
    current_word = freq_hash.keys.sample
    sentence = [current_word]

    12.times do
      p current_word
      current_word = freq_hash[current_word].sample
      sentence << current_word
    end

    sentence.join(" ")
  end
end

# Treat sentence-ending punctuation (ie, ., ?, and !) as words themselves.
# if word[-1] == '.' || '?' || '!'
# use scan?
# end_with?