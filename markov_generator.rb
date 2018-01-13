require 'pp'

class MarkovGenerator
  def self.from_file(file)
    from_text(File.read(file))
  end

  def self.from_text text
    freq_hash = Hash.new {|hash, key| hash[key] = [] }

    # turning punctuation into words
    text.gsub!(".", " .")
    text.gsub!("!", " !")
    text.gsub!("?", " ?")

    text.split.each_cons(2) do |word, following_word|
      freq_hash[word] << following_word
    end

    # pp freq_hash
    current_word = freq_hash.keys.sample
    sentence = [current_word]

    20.times do
      p current_word
      current_word = freq_hash[current_word].sample

      sentence << current_word
    end

    # punctuation = sentence.select do |word|
    #   word == " !" || word == " ." || word == " ?"
    # end

    sentence.join(" ")
  end

end

# use scan?
# end_with?
# How to handle words that end with punctuation?
  # do not want sentences to end with ','
  # words that end with '?' or '.' need to be at end of sentence

# if word.split(//).each contains '?' or '.'
  # treat '?' or '.' as separate word
  # add at end of sentence

# capitalize all sentences.